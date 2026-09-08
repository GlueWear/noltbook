// Noltbook microphone processor. The pinned RNNoise factory is prepended by the
// embedding tool. AudioWorklet supplies 128-sample quanta; RNNoise consumes 480
// mono samples at 48 kHz in the int16 amplitude range, stored as float32.
class NoltbookDenoiseProcessor extends AudioWorkletProcessor {
  constructor(){
    super();
    if(sampleRate!==48000)throw new Error('RNNoise requires a 48 kHz audio context');
    this.rnn=createRNNWasmModuleSync();
    this.state=this.rnn._rnnoise_create(0);
    this.frame=this.rnn._malloc(480*4);
    if(!this.state||!this.frame)throw new Error('RNNoise allocation failed');
    this.inputCount=0;this.read=0;this.write=0;this.queued=0;
    this.output=new Float32Array(960);this.stopped=false;
    this.port.onmessage=e=>{
      if(e.data&&e.data.type==='stop'&&!this.stopped){
        this.stopped=true;this.rnn._rnnoise_destroy(this.state);this.rnn._free(this.frame);
      }
    };
    this.port.postMessage({type:'ready'});
  }
  process(inputs,outputs){
    const out=outputs[0]&&outputs[0][0];
    if(this.stopped){if(out)out.fill(0);return false}
    if(!out)return true;
    const input=inputs[0]&&inputs[0][0];
    for(let i=0;i<out.length;i++){
      out[i]=this.queued?this.output[this.read]:0;
      if(this.queued){this.read=(this.read+1)%this.output.length;this.queued--}
      this.rnn.HEAPF32[(this.frame>>2)+this.inputCount++]=(input?input[i]:0)*32768;
      if(this.inputCount===480){
        this.rnn._rnnoise_process_frame(this.state,this.frame,this.frame);
        for(let j=0;j<480;j++){
          const v=this.rnn.HEAPF32[(this.frame>>2)+j]/32768;
          this.output[this.write]=Number.isFinite(v)?Math.max(-1,Math.min(1,v)):0;
          this.write=(this.write+1)%this.output.length;this.queued++;
        }
        this.inputCount=0;
      }
    }
    // The node is configured mono, but defensively fill additional output channels.
    for(let c=1;c<outputs[0].length;c++)outputs[0][c].set(out);
    return true;
  }
}
registerProcessor('noltbook-denoise',NoltbookDenoiseProcessor);
