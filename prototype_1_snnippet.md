function preload(){
  loadJSON("Buses.json", dataReady1);
}

function dataReady1(data1){
  osc1 = new p5.Oscillator();
  osc2 = new p5.Oscillator();
  osc3 = new p5.Oscillator();
  
  osc1.setType('sine');
  osc1.freq(0);
  osc1.amp(0.4);
  osc1.start();

  osc2.setType('triangle');
  osc2.freq(0);
  osc2.amp(0.5);
  osc2.start();

  osc3.setType('sawtooth');
  osc3.freq(0);
  osc3.amp(0.2);
  osc3.start();

  figures1 = data1.figures;
  for (var i = 0; i < figures1.length; i++) {
    append(arrayBus, [figures1[i].AADF,figures1[i].NE,figures1[i].SE,figures1[i].WM]);
};

  // for three cities 
  for (var i = 0; i < arrayBus.length;  i++) {
    
    setTimeout(function(y) {
    
    freq1 = map(arrayBus[y][1],140235, 183753, 200, 600);
    freq2 = map(arrayBus[y][2],227700, 377048, 700, 1000);
    freq3 = map(arrayBus[y][3],328924, 490877, 1100, 2000);

    //console.log(freq);
    
    osc1.freq(freq1);
    osc2.freq(freq2);
    osc3.freq(freq3);
    
    }, i * 500, i);
     // we're passing i  
    };
  }
  
