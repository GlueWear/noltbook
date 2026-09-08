// Isolated real-browser checks: no ship access and no microphone/camera permission.
import fs from 'node:fs';import os from 'node:os';import path from 'node:path';
import http from 'node:http';import {spawn} from 'node:child_process';import assert from 'node:assert/strict';
const html=fs.readFileSync(new URL('../lib/noltbook/index.html',import.meta.url),'utf8');
const section=(a,b)=>html.slice(html.indexOf(a),html.indexOf(b,html.indexOf(a)));
const css=html.match(/<style>([\s\S]*?)<\/style>/)[1];
const controls=section('      <div class="call-controls"','    </aside>').replace('style="display:none"','');
const worklet=section('<!-- BEGIN LOCAL CALL DENOISER -->','<!-- END LOCAL CALL DENOISER -->');
const script=`
const state={inCall:'test'},api={ship:'zod'};let sigilFn=null,_screenPending=false;
const rtcManager={muted:false,videoOn:false,screenOn:false,peers:{},rawMicTrack:()=>null,micProcessor:null};
const callIsSfu=()=>false,sfu={up:new Map()};
function syncCallControls(){} function spkEnsureCtx(){} function spkUnwatch(){} function renderCallRail(){}
function cssEsc(v){return v} function toggleTileExpand(){} function toggleRailFullscreen(){} function toggleScreenAudio(){}
const displayName=()=> 'A readable participant name';
const resolveAvatarUrl=()=> 'local';
const avatarHtml=()=> '<div style="width:100%;height:100%;display:flex;align-items:center;justify-content:center;background:#385573"><svg width="100%" height="100%" viewBox="0 0 100 100"><circle cx="50" cy="35" r="20" fill="#bdd8ee"/><ellipse cx="50" cy="100" rx="35" ry="38" fill="#bdd8ee"/></svg></div>';
${section('function ensureTile(', '/* ===== SPEAKING INDICATOR')}
${section('// ===== local microphone denoising','function toggleMute(){')}
Object.defineProperty(navigator.mediaDevices,'enumerateDevices',{value:async()=>[
{kind:'audioinput',deviceId:'mic-a',label:'Desk microphone'},
{kind:'videoinput',deviceId:'cam-a',label:'Front camera'},
{kind:'audiooutput',deviceId:'out-a',label:'Headphones'}]});
window.browserChecks=(async()=>{
 const results=[];const check=(name,ok)=>{results.push([name,!!ok]);if(!ok)throw Error(name)};
 const media=document.getElementById('callMedia');
 const tiles=['~zod','~nec','~bud','~wes'].map((ship,i)=>{const t=ensureTile(media,'cam:'+ship,'cam',['You','Mignes Magtel','Dolten Dilpun','Long readable name'][i],ship);setTileVideo(t,false);return t});
 const box=t=>{const r=t.getBoundingClientRect();return {x:r.x,y:r.y,w:r.width,h:r.height}};
 const grid=tiles.map(box),width=media.getBoundingClientRect().width;
 check('four avatars form a 2 by 2 grid',grid[0].y===grid[1].y&&grid[2].y===grid[3].y&&grid[2].y>grid[0].y);
 check('avatars are square and quarter area',grid.every(r=>r.w===r.h&&r.w*r.h/(width*width)<.26));
 check('four avatars fit the former full tile area',grid[3].y+grid[3].h-grid[0].y<=width+1);
 check('names are at least 12px and visible without hover',parseFloat(getComputedStyle(tiles[1].querySelector('.media-tile-label')).fontSize)>=12&&getComputedStyle(tiles[1].querySelector('.media-tile-label')).opacity==='1');
 const video=tiles[0].querySelector('video');setTileVideo(tiles[0],true);const camera=box(tiles[0]);
 check('camera retains full-column square size',camera.w===width&&camera.h===width);
 check('camera toggle reuses original video',tiles[0].querySelector('video')===video);
 setTileVideo(tiles[0],false);media.classList.add('theater');tiles[0].classList.add('staged');let stage=box(tiles[0]);
 check('expanded stage retains 4:3 sizing',Math.abs(stage.w/stage.h-4/3)<.01);
 tiles[0].classList.remove('staged');tiles[0].classList.add('thumb');let thumb=box(tiles[0]);
 check('theater thumbnail retains 16:9 sizing',Math.abs(thumb.w/thumb.h-16/9)<.01);
 media.classList.remove('theater');tiles[0].classList.remove('thumb');tiles[0].classList.add('speaking');
 check('amber outline paints above the avatar',getComputedStyle(tiles[0],'::after').zIndex==='2');
 toggleCallSettings();await refreshCallDevices();
 check('device menu populates and noise defaults on',document.getElementById('callMicDevice').options.length===2&&document.getElementById('callNoiseReduction').checked);
 let escaped=false;document.addEventListener('keydown',()=>escaped=true);
 document.dispatchEvent(new KeyboardEvent('keydown',{key:'Escape',bubbles:true}));
 check('Escape closes menu without changing theater',document.getElementById('callDeviceMenu').hidden&&!escaped);
 const btns=[...document.querySelectorAll('#callControls>.call-ctrl-btn')].map(box),rail=box(document.getElementById('callRail'));
 check('four control buttons fit the column',btns.every(b=>b.x>=rail.x&&b.x+b.w<=rail.x+rail.w));
 // Test the actual embedded WebAssembly in an AudioWorklet with a synthetic noise
 // stream. The source never connects to speakers, and no capture API is called.
 const sourceCtx=new AudioContext({sampleRate:48000});await sourceCtx.resume();
 const buffer=sourceCtx.createBuffer(1,48000,48000);let seed=42;
 const samples=buffer.getChannelData(0);for(let i=0;i<samples.length;i++){seed=(Math.imul(seed,1664525)+1013904223)>>>0;samples[i]=(seed/4294967296-.5)*.2}
 let source=sourceCtx.createBufferSource();source.buffer=buffer;source.loop=true;
 const dest=sourceCtx.createMediaStreamDestination();source.connect(dest);
 const raw=dest.stream.getAudioTracks()[0];let proc;
 try{
  proc=await prepareMicProcessor(raw,true);check('real AudioWorklet starts with the embedded RNNoise model',!!proc&&proc.ctx.state==='running');
  check('processed microphone stays mono for sender replacement',proc.track.getSettings().channelCount===1);
  const analyser=proc.ctx.createAnalyser();analyser.fftSize=2048;proc.node.connect(analyser);source.start();
  await new Promise(r=>setTimeout(r,1800));const output=new Float32Array(analyser.fftSize);analyser.getFloatTimeDomainData(output);
  const inputPower=samples.reduce((a,x)=>a+x*x,0)/samples.length,outputPower=output.reduce((a,x)=>a+x*x,0)/output.length;
  const reductionDb=10*Math.log10(inputPower/Math.max(outputPower,1e-20));
  check('real browser processor reduces stationary noise',reductionDb>15);
  source.stop();
  const speechResponse=await fetch('/speech.wav');let speech;
  if(speechResponse.ok)speech=await sourceCtx.decodeAudioData(await speechResponse.arrayBuffer());
  else{
    speech=sourceCtx.createBuffer(1,48000,48000);const a=speech.getChannelData(0);
    for(let i=0;i<a.length;i++){const t=i/48000,e=Math.sin(Math.PI*(t%.2)/.2)**2;a[i]=e*(.15*Math.sin(2*Math.PI*150*t)+.08*Math.sin(2*Math.PI*300*t)+.04*Math.sin(2*Math.PI*450*t))}
  }
  source=sourceCtx.createBufferSource();source.buffer=speech;source.loop=true;source.connect(dest);
  const rawAnalyser=sourceCtx.createAnalyser();rawAnalyser.fftSize=2048;source.connect(rawAnalyser);source.start();
  let rawEnergy=0,cleanEnergy=0;const rb=new Float32Array(2048),cb=new Float32Array(2048);
  for(let i=0;i<30;i++){await new Promise(r=>setTimeout(r,50));rawAnalyser.getFloatTimeDomainData(rb);analyser.getFloatTimeDomainData(cb);for(let j=0;j<2048;j++){rawEnergy+=rb[j]*rb[j];cleanEnergy+=cb[j]*cb[j]}}
  check('real browser processing preserves audible speech',rawEnergy>1&&cleanEnergy/rawEnergy>.1);

  disposeMicProcessor(proc);check('processor cleanup stops output track',proc.track.readyState==='ended');
  window.audioResult={noiseReductionDb:Math.min(80,reductionDb),speechPowerRatio:cleanEnergy/rawEnergy,rate:proc.ctx.sampleRate};
 }finally{disposeMicProcessor(proc);raw.stop();source.stop();await sourceCtx.close()}
 toggleCallSettings();await refreshCallDevices();
 return {results,grid,camera,stage,thumb,audio:window.audioResult};
})();
window.browserChecks.then(r=>document.getElementById('result').textContent=JSON.stringify(r)).catch(e=>document.getElementById('result').textContent='ERROR '+e.stack);
`;
const fixture='<!doctype html><meta charset="UTF-8"><style>'+css+'</style><aside class="call-rail open" id="callRail" style="height:700px"><div class="call-rail-header">CALL</div><div class="call-rail-body" id="callRailBody"><div id="callMedia"></div></div>'+controls+'</aside><pre id="result"></pre>'+worklet+'<script>'+script+'</script>';
const dir=fs.mkdtempSync(path.join(os.tmpdir(),'nb-call-browser-'));
const server=http.createServer((req,res)=>{if(req.url==='/speech.wav'){if(process.argv[2]){res.setHeader('Content-Type','audio/wav');res.end(fs.readFileSync(process.argv[2]))}else{res.statusCode=404;res.end()}return}res.setHeader('Content-Type','text/html');res.end(fixture)});
await new Promise(r=>server.listen(0,'127.0.0.1',r));
const chrome=spawn(process.env.CHROME||'/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',[
 '--headless','--no-sandbox','--disable-gpu','--no-first-run','--no-default-browser-check','--disable-background-networking',
 '--autoplay-policy=no-user-gesture-required','--remote-debugging-port=0','--user-data-dir='+dir,'--window-size=500,850','about:blank'
],{stdio:'ignore'});
let ws;
try{
 const portFile=path.join(dir,'DevToolsActivePort');
 for(let i=0;!fs.existsSync(portFile)&&i<150;i++)await new Promise(r=>setTimeout(r,100));
 const port=fs.readFileSync(portFile,'utf8').split('\n')[0];
 const pages=await (await fetch('http://127.0.0.1:'+port+'/json/list')).json();
 ws=new WebSocket(pages.find(p=>p.type==='page').webSocketDebuggerUrl);
 await new Promise((resolve,reject)=>{ws.onopen=resolve;ws.onerror=reject});
 let id=0;const pending=new Map();let loaded;
 ws.onmessage=e=>{const r=JSON.parse(e.data);if(r.id){const p=pending.get(r.id);pending.delete(r.id);if(p){clearTimeout(p.timer);r.error?p.reject(Error(JSON.stringify(r.error))):p.resolve(r.result)}}else if(r.method==='Page.loadEventFired'&&loaded)loaded()};
 const command=(method,params={})=>new Promise((resolve,reject)=>{const n=++id;const timer=setTimeout(()=>{pending.delete(n);reject(Error('CDP timeout '+method))},20000);pending.set(n,{resolve,reject,timer});ws.send(JSON.stringify({id:n,method,params}))});
 await command('Page.enable');const load=new Promise(r=>loaded=r);
 await command('Page.navigate',{url:'http://127.0.0.1:'+server.address().port});await load;
 const result=await command('Runtime.evaluate',{expression:'window.browserChecks',awaitPromise:true,returnByValue:true});
 if(result.exceptionDetails)throw Error(JSON.stringify(result.exceptionDetails));
 assert(result.result.value,'No browser result');
 console.log(JSON.stringify(result.result.value,null,2));assert(result.result.value.results.every(([,ok])=>ok));
 const png=await command('Page.captureScreenshot',{format:'png'});fs.writeFileSync(path.join(dir,'preview.png'),Buffer.from(png.data,'base64'));
 console.log('Browser preview:',path.join(dir,'preview.png'));
}finally{if(ws)ws.close();chrome.kill('SIGTERM');server.close()}
