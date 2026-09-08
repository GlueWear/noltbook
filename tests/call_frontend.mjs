// Pure regression checks use the actual frontend functions with fake devices/senders.
// No ship, camera, microphone, or network access is needed.
import fs from 'node:fs';
import vm from 'node:vm';
import assert from 'node:assert/strict';
const html=fs.readFileSync(new URL('../lib/noltbook/index.html',import.meta.url),'utf8');
for(const m of html.matchAll(/<script([^>]*)>([\s\S]*?)<\/script>/g))if(!/type="text\/plain"/.test(m[1])&&m[2].trim())new vm.Script(m[2]);
const section=(a,b)=>html.slice(html.indexOf(a),html.indexOf(b,html.indexOf(a)));
class Track{constructor(kind,id){Object.assign(this,{kind,id,enabled:true,muted:false,readyState:'live'})}stop(){this.readyState='ended'}getSettings(){return {noiseSuppression:true}}}
class Stream{constructor(tracks=[]){this.tracks=[...tracks]}getTracks(){return [...this.tracks]}getAudioTracks(){return this.tracks.filter(t=>t.kind==='audio')}getVideoTracks(){return this.tracks.filter(t=>t.kind==='video')}addTrack(t){this.tracks.push(t)}removeTrack(t){this.tracks=this.tracks.filter(x=>x!==t)}getTrackById(id){return this.tracks.find(t=>t.id===id)||null}}
const sender=t=>({track:t,async replaceTrack(next){this.track=next}});
let getMedia,mode=false,messages=[],sinks=[];
const elements=new Map();
const el=id=>{if(!elements.has(id))elements.set(id,{hidden:true,checked:true,disabled:false,textContent:'',classList:{toggle(){},remove(){}},setAttribute(){},focus(){},querySelector(){return el('close')},contains(){return false}});return elements.get(id)};
const ctx=vm.createContext({console,Map,Set,Promise,Date,Uint8Array,MediaStream:Stream,Option:class{},
 localStorage:{getItem(){return null},setItem(){}},navigator:{mediaDevices:{getUserMedia:c=>getMedia(c),getSupportedConstraints:()=>({noiseSuppression:true}),addEventListener(){}}},
 HTMLMediaElement:class{setSinkId(){}},document:{getElementById:el,addEventListener(){},querySelector(){return null},querySelectorAll(){return []}},
 rtcManager:{peers:{},localStream:null,muted:false,videoOn:false,rawMicTrack(){return this.localStream?.getAudioTracks()[0]||null},microphoneTrack(){return this.micProcessor?.track||this.rawMicTrack()}},
 state:{inCall:'test'},api:{ship:'zod'},sfu:{up:new Map()},callIsSfu:()=>mode,renderCallRail(){},syncCallControls(){},spkUnwatch(){},spkEnsureCtx(){},
 _screenPending:false,window:{},requestAnimationFrame(){return 1},cancelAnimationFrame(){},cssEsc:x=>x});
vm.runInContext(section('// ===== local microphone denoising','function toggleMute(){'),ctx);
vm.runInContext('callDeviceMessage=(t)=>{}; refreshCallDevices=async()=>{}; syncCallDeviceAvailability=()=>{};',ctx);
const run=s=>vm.runInContext(s,ctx);
let count=0;
async function test(name,fn){await fn();count++;console.log('PASS',name)}
function setup(audio=true){
 mode=false;ctx.state.inCall='test';ctx.sfu.up.clear();
 const old=new Track(audio?'audio':'video','old');const screen=new Track('video','screen');
 Object.assign(ctx.rtcManager,{localStream:new Stream([old]),micProcessor:null,peers:{},muted:false,videoOn:!audio,gainMic:null,micSource:null,mixDest:null,screenStream:new Stream([screen])});
 run('callDeviceBusy=false; callCameraBusy=false; callDeviceEpoch=0; callDevices.mic="";callDevices.camera="";callDevices.output="";callDevices.noise=true;');
 return {old,screen,stream:ctx.rtcManager.localStream};
}
await test('noise reduction starts on and requests echo cancellation',()=>{const c=run('callAudioConstraints("mic-a",callDevices.noise)');assert.equal(c.noiseSuppression.ideal,true);assert.equal(c.echoCancellation.ideal,true);assert.equal(c.deviceId.exact,'mic-a')});
await test('mesh microphone switch preserves mute, stream, and screen capture',async()=>{
 const {old,screen,stream}=setup();const next=new Track('audio','next');const s=sender(old);ctx.rtcManager.peers.a={audioSender:s};ctx.rtcManager.muted=true;getMedia=async()=>new Stream([next]);
 await run('changeCallDevice("mic","new-mic")');assert.equal(s.track,next);assert.equal(next.enabled,false);assert.equal(ctx.rtcManager.localStream,stream);assert.equal(old.readyState,'ended');assert.equal(screen.readyState,'live');assert.equal(run('callDevices.mic'),'new-mic');
});
await test('muting during an in-flight replacement immediately silences the pending mic',async()=>{
 const {old}=setup();const next=new Track('audio','pending');let resolve,started;const ready=new Promise(r=>started=r);
 ctx.rtcManager.peers.a={audioSender:{track:old,replaceTrack(){started();return new Promise(r=>resolve=r)}}};getMedia=async()=>new Stream([next]);
 run(section('function toggleMute(){','// toggleScreenAudio:'));
 const pending=run('changeCallDevice("mic","next")');await ready;
 run('toggleMute()');assert.equal(next.enabled,false);resolve();await pending;assert.equal(next.enabled,false);
});
await test('SFU camera switch preserves sender and updates stream bookkeeping',async()=>{
 const {old,stream}=setup(false);mode=true;const next=new Track('video','next');const s=sender(old);const u={videoSender:s,stream:new Stream([old])};ctx.sfu.up.set('camera',u);getMedia=async()=>new Stream([next]);
 await run('changeCallDevice("camera","cam-b")');assert.equal(s.track,next);assert.equal(u.stream.getTrackById(next.id),next);assert.equal(u.stream.getTrackById(old.id),null);assert.equal(ctx.rtcManager.localStream,stream);
});
await test('camera selection while off never opens capture',async()=>{setup();getMedia=()=>{throw Error('Must not capture')};await run('changeCallDevice("camera","cam-b")');assert.equal(run('callDevices.camera'),'cam-b')});
await test('capture permission failure retains old microphone and preference',async()=>{const {old}=setup();getMedia=async()=>{throw Object.assign(Error('denied'),{name:'NotAllowedError'})};await run('changeCallDevice("mic","bad")');assert.equal(old.readyState,'live');assert.equal(run('callDevices.mic'),'')});
await test('partial sender failure rolls back and releases rejected capture',async()=>{
 const {old}=setup();const next=new Track('audio','next'),first=sender(old);ctx.rtcManager.peers={a:{audioSender:first},b:{audioSender:{track:old,async replaceTrack(){throw Error('failed')}}}};getMedia=async()=>new Stream([next]);
 await run('changeCallDevice("mic","bad")');assert.equal(first.track,old);assert.equal(old.readyState,'live');assert.equal(next.readyState,'ended');assert.equal(run('callDevices.mic'),'');
});
await test('ending the call during device acquisition discards the new capture',async()=>{
 setup();const next=new Track('audio','next');let resolve;getMedia=()=>new Promise(r=>resolve=r);
 const pending=run('changeCallDevice("mic","late")');run('callDeviceEpoch++');ctx.state.inCall=null;resolve(new Stream([next]));await pending;assert.equal(next.readyState,'ended');assert.equal(run('callDevices.mic'),'');
});
await test('noise switch reconnects only the microphone branch of a screen mix',async()=>{
 const {old,screen}=setup();const next=new Track('audio','next');const gain={gain:{value:0}};let disconnected=false,connected;
 ctx.rtcManager.gainMic=gain;ctx.rtcManager.muted=true;ctx.rtcManager.mixDest={};ctx.rtcManager.micSource={disconnect(){disconnected=true}};
 ctx.rtcManager.audioCtx={createMediaStreamSource(stream){assert.equal(stream.getAudioTracks()[0],next);return {connect(g){connected=g}}}};
 getMedia=async c=>{assert.equal(c.audio.noiseSuppression.ideal,false);return new Stream([next])};
 await run('changeCallDevice("noise",false)');assert.equal(connected,gain);assert(disconnected);assert.equal(gain.gain.value,0);assert.equal(screen.readyState,'live');assert.equal(next.enabled,true);assert.equal(old.readyState,'ended');assert.equal(run('callDevices.noise'),false);
});
await test('output selection updates all current peers and is remembered',async()=>{
 setup();const audio=()=>({sinkId:'',async setSinkId(id){this.sinkId=id}});ctx.rtcManager.peers={a:{audioEl:audio()},b:{audioEl:audio()}};
 await run('changeCallDevice("output","headphones")');assert.equal(ctx.rtcManager.peers.a.audioEl.sinkId,'headphones');assert.equal(ctx.rtcManager.peers.b.audioEl.sinkId,'headphones');assert.equal(run('callDevices.output'),'headphones');
});
await test('new peers use remembered output and fall back when it disappears',async()=>{
 const audio={sinkId:'',async setSinkId(id){if(id==='headphones')throw Error('unplugged');this.sinkId=id}};ctx.newAudio=audio;await run('applyCallOutput(newAudio)');assert.equal(audio.sinkId,'');
});
await test('output failure rolls back earlier peers and retains preference',async()=>{
 setup();const a={sinkId:'',async setSinkId(id){this.sinkId=id}},b={sinkId:'',async setSinkId(){throw Error('failed')}};ctx.rtcManager.peers={a:{audioEl:a},b:{audioEl:b}};
 await run('changeCallDevice("output","bad")');assert.equal(a.sinkId,'');assert.equal(run('callDevices.output'),'');
});
await test('missing saved microphone falls back only on initial capture',async()=>{
 setup();run('callDevices.mic="gone"');let calls=0;getMedia=async c=>{calls++;if(c.audio.deviceId)throw Object.assign(Error('gone'),{name:'NotFoundError'});return new Stream([new Track('audio','default')])};
 await run('captureCallDevices(false)');assert.equal(calls,2);assert.equal(run('callDevices.mic'),'');
});
// The processed track must feed both transports and survive screen-share teardown.
vm.runInContext('Object.assign(rtcManager,{'+section('  microphoneTrack(){','  // build (or extend)')+'})',ctx);
await test('outbound audio chooses enhanced mic, and screen mix takes precedence',()=>{
 setup();const processed=new Track('audio','processed'),mix=new Track('audio','mix');
 ctx.rtcManager.micProcessor={track:processed,closed:false};
 assert.equal(ctx.rtcManager.outboundAudioTrack(),processed);ctx.rtcManager.mixDest={stream:new Stream([mix])};assert.equal(ctx.rtcManager.outboundAudioTrack(),mix);
});
await test('enhanced microphone switch publishes processed audio while retaining raw ownership',async()=>{
 const {old,stream}=setup();const oldOut=new Track('audio','old-processed');let closed=false;
 ctx.rtcManager.micProcessor={track:oldOut,closed:false,ctx:{close(){closed=true;return Promise.resolve()}}};
 const raw=new Track('audio','new-raw'),out=new Track('audio','new-processed');const s=sender(oldOut);ctx.rtcManager.peers.a={audioSender:s};
 ctx.nextProcessor={track:out,closed:false};getMedia=async()=>new Stream([raw]);
 run('savedPrepare=prepareMicProcessor;prepareMicProcessor=async()=>nextProcessor');
 try{await run('changeCallDevice("mic","new")')}finally{run('prepareMicProcessor=savedPrepare')}
 assert.equal(s.track,out);assert.equal(stream.getAudioTracks()[0],raw);assert.equal(old.readyState,'ended');assert.equal(oldOut.readyState,'ended');assert(closed);
});
await test('turning enhanced reduction off restores raw output and disposes the processor',async()=>{
 setup();const oldOut=new Track('audio','processed');ctx.rtcManager.micProcessor={track:oldOut,closed:false};const s=sender(oldOut);ctx.rtcManager.peers.a={audioSender:s};
 const raw=new Track('audio','new-raw');getMedia=async()=>new Stream([raw]);await run('changeCallDevice("noise",false)');
 assert.equal(s.track,raw);assert.equal(ctx.rtcManager.micProcessor,null);assert.equal(oldOut.readyState,'ended');
});
await test('screen-share stop restores processed microphone rather than bypassing reduction',async()=>{
 setup();const out=new Track('audio','processed'),mix=new Track('audio','mix');ctx.rtcManager.micProcessor={track:out,closed:false};ctx.rtcManager.mixDest={stream:new Stream([mix])};ctx.rtcManager.gainMic={gain:{value:1}};
 const s=sender(mix);ctx.rtcManager.peers.a={audioSender:s};ctx.rtcManager.teardownAudioMix=function(){this.mixDest=null;this.gainMic=null};
 run('Object.assign(rtcManager,{'+section('  async stopScreenShare(opts){','  createPeer(ship){')+'})');
 await run('rtcManager.stopScreenShare()');assert.equal(s.track,out);assert.equal(out.readyState,'live');assert.equal(ctx.rtcManager.micProcessor.closed,false);
});
await test('processor failure restores the raw microphone and preserves mute',async()=>{
 const {old}=setup();const out=new Track('audio','failed');const processor={track:out,closed:false};ctx.rtcManager.micProcessor=processor;ctx.rtcManager.muted=true;
 const s=sender(out);ctx.rtcManager.peers.a={audioSender:s};ctx.failedProcessor=processor;
 await run('recoverMicProcessor(failedProcessor)');assert.equal(s.track,old);assert.equal(old.enabled,false);assert.equal(out.readyState,'ended');assert.equal(ctx.rtcManager.micProcessor,null);
});
// Evaluate the real speaking detector against controlled levels and time.
ctx.Date={now:()=>ctx.now};ctx.now=0;ctx.level=0;ctx.ring=false;
ctx.document.querySelector=()=>({classList:{toggle:(name,on)=>ctx.ring=on,remove:()=>ctx.ring=false}});
vm.runInContext(section('const SPK_ON=','// syncTileControl:'),ctx);
run('spkLevel=()=>level;spkStart=()=>{};');
const track=new Track('audio','voice');ctx.track=track;ctx.rtcManager.muted=false;
run('_spk.nodes.set("~zod",{track,speaking:false})');
function tick(time,level){ctx.now=time;ctx.level=level;run('spkTick()');return ctx.ring}
await test('silence and middle-band noise do not activate a fresh speaker',()=>{assert.equal(tick(0,0),false);assert.equal(tick(100,.03),false)});
await test('speaking holds through a pause and clears after sustained silence',()=>{assert.equal(tick(200,.06),true);assert.equal(tick(300,0),true);assert.equal(tick(400,.03),true);assert.equal(tick(500,0),true);assert.equal(tick(821,0),false)});
await test('MIC mute immediately clears local speaking even with a live screen mix',()=>{assert.equal(tick(900,.06),true);ctx.rtcManager.muted=true;assert.equal(tick(901,.06),false)});
await test('stopped tracks clear the ring',()=>{ctx.rtcManager.muted=false;assert.equal(tick(1000,.06),true);track.stop();assert.equal(tick(1001,.06),false)});
await test('avatar refresh changes only the avatar layer when its URL changes',()=>{
 let url='one',paints=0;const av={setAttribute(){},set innerHTML(s){paints++}};ctx.tile={querySelector:()=>av};ctx.resolveAvatarUrl=()=>url;ctx.avatarHtml=()=>'<img>';ctx.sigilFn=null;
 run(section('function paintTileAvatar(', '// A tile shows video'));
 run('paintTileAvatar(tile,"~nec")');run('paintTileAvatar(tile,"~nec")');assert.equal(paints,1);url='two';run('paintTileAvatar(tile,"~nec")');assert.equal(paints,2);
});
console.log(`${count} frontend regression checks passed.`);
