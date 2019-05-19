


//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& BUS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% AMP & FREQ TO BE USED IN MAPPIING
SynthDef ("bus", {arg out=0, freq= 50, mul=0.7,amp = 1;
    var f;
    f = Saw.ar(freq,mul,0);
	Out.ar(out,f*amp);
}).add;

g= Synth.new(\bus)
g.free
//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&



//¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤ CAR ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤ AMP & FREQ TO BE USED IN MAPPIING
SynthDef ("formula1", {arg out=0, freq = 2.5, mul2= 10;
    var f;
    f = LFPulse.ar(LFPulse.kr(freq, 0, 0.3, mul2, 200), 0, 0.8, 0.1);
    Out.ar(out,f);
}).add;

f= Synth.new(\formula1)
f.free
//¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤



//----------****************** MOTOGP**************************** AMP & FREQ TO BE USED IN MAPPIING

// mul3 10-100 ----------- freq 50-100
SynthDef("motogp", { arg out=0, freq= 10, mul3 = 100, amp = 2;
    var m;
    m = RLPF.ar(LFPulse.ar(SinOsc.ar(0.2, 0, 0, 10),0.5, 0.2),freq,0.5,100);
    Out.ar(out, m*amp);
}).add;
m = Synth.new(\motogp)

//******************************************************************************


