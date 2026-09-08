// Runs the pinned real RNNoise WebAssembly and actual local worklet, offline.
import fs from 'node:fs';
import vm from 'node:vm';
import assert from 'node:assert/strict';
import createRNNWasmModuleSync from '../third_party/rnnoise/rnnoise-sync.js';
let Processor;
vm.runInNewContext(fs.readFileSync(new URL('../lib/noltbook/audio/denoise-worklet.js',import.meta.url),'utf8'),{
 sampleRate:48000,createRNNWasmModuleSync,Float32Array,Number,Math,
 AudioWorkletProcessor:class{constructor(){this.port={postMessage(){}}}},
 registerProcessor:(name,cls)=>Processor=cls
});
function denoise(input){
 const p=new Processor(),output=new Float32Array(input.length);
 for(let offset=0;offset<input.length;offset+=128){
  const out=new Float32Array(Math.min(128,input.length-offset));
  p.process([[input.subarray(offset,offset+128)]],[[out]]);output.set(out,offset);
  assert(p.queued<=480);assert(p.inputCount<480);
 }
 p.port.onmessage({data:{type:'stop'}});
 assert.equal(p.process([],[[new Float32Array(128)]]),false);
 assert(output.every(Number.isFinite));return output;
}
let seed=42;
const random=()=>{seed=(Math.imul(seed,1664525)+1013904223)>>>0;return seed/4294967296-.5};
const noise=Float32Array.from({length:48000*4},()=>random()*.2);
const clean=denoise(noise);
const power=(a,start=24000,end=a.length)=>{let sum=0;for(let i=start;i<end;i++)sum+=a[i]*a[i];return sum/(end-start)};
const reduction=10*Math.log10(power(noise)/power(clean));
assert(reduction>15,`Stationary noise attenuation too low: ${reduction} dB`);
assert.equal(power(denoise(new Float32Array(48000))),0);
console.log(`PASS real RNNoise stationary-noise reduction: ${reduction.toFixed(1)} dB`);
console.log('PASS silence, finite output, bounded buffering, and processor disposal');
// Optional local synthetic-speech WAV: 48 kHz, mono, signed 16-bit PCM.
if(process.argv[2]){
 const wav=fs.readFileSync(process.argv[2]);let data;
 for(let p=12;p+8<wav.length;){const n=wav.readUInt32LE(p+4);if(wav.toString('ascii',p,p+4)==='data'){data=wav.subarray(p+8,p+8+n);break}p+=8+n+(n%2)}
 assert(data,'Missing WAV samples');
 const speech=Float32Array.from({length:data.length/2},(_,i)=>data.readInt16LE(i*2)/32768);
 const noisy=Float32Array.from(speech,(x,i)=>x+random()*.04+.015*Math.sin(2*Math.PI*120*i/48000));
 const out=denoise(noisy);
 // RNNoise and frame buffering delay the speech. Find alignment, then measure
 // correlation on active speech (not silence that would inflate the score).
 let best={correlation:-1,lag:0,gain:0};
 for(let lag=0;lag<3000;lag+=16){
  let xy=0,xx=0,yy=0;
  for(let i=24000;i<speech.length-lag;i+=4){if(Math.abs(speech[i])<.025)continue;xy+=speech[i]*out[i+lag];xx+=speech[i]**2;yy+=out[i+lag]**2}
  const correlation=xy/Math.sqrt(xx*yy);
  if(correlation>best.correlation)best={correlation,lag,gain:xy/xx};
 }
 assert(best.correlation>.65,`Speech not preserved: ${JSON.stringify(best)}`);
 assert(best.gain>.35,`Speech attenuated too much: ${JSON.stringify(best)}`);
 console.log('PASS noisy synthetic speech retained:',JSON.stringify(best));
}
