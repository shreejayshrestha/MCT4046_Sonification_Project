
let data1;




var button;

let osc1;
let osc2;
let osc3;

let freq1;
let freq2;
let freq3;

let arrayBus = [];
let arraySE = [];
let arrayWM = [];

let figures1;

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
  
function  setup() {

  button = createButton('stop sonification');
  button.position(150, 19);
  button.mousePressed(stopsound);

  button = createButton('start sonification');
  button.position(19, 19);
  button.mousePressed(startsound);
  

  //createCanvas(400,400);
    noCanvas();
  //createP(data.figures[0].name);

  // to load JSON data into an Array
 
  //printing out the data that we have in the Array
  
  function mousePressed(){
    getAudioContext().resume()
  } 

  function stopsound() {
    osc1.stop();
    osc2.stop();
    osc3.stop();
  }

  function startsound(){

    
    osc1.start();
    osc2.start();
    osc3.start();
  
  }
  
}