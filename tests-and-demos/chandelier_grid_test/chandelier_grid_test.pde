import controlP5.*;

ControlP5 cp5;
int myColor = color(0,0,0);


int pointsize = 10;
int buffer = 50;
float spacing;


int gridSize = 7;
int stripDensity = 30;
int ledTotal = 0;
boolean stagger = false;
Slider gs;
RadioButton r1;

int[] leds = {30, 60, 144};

Textlabel note, note2;

void setup() {
  size(800,900);
  noStroke();
  cp5 = new ControlP5(this);

  cp5.addToggle("stagger")
    .setPosition(700, 850)
    .setSize(50,20);

  r1 = cp5.addRadioButton("stripDensity")
    .setPosition(50,820)
    .setSize(40,20)
    .setItemsPerRow(3)
    .setSpacingColumn(50)
    .addItem("30",1)
    .addItem("60",2)
    .addItem("144",3)
    ;

  r1.activate(0);

  cp5.addSlider("gridSize")
     .setPosition(50,850)
     .setWidth(600)
    .setHeight(15)
    .setRange(1,10)
     .setNumberOfTickMarks(10)
     .setSliderMode(Slider.FIX)
    .setValue(7)
     ;
  // use Slider.FIX or Slider.FLEXIBLE to change the slider handle
  // by default it is Slider.FIX

  note = cp5.addTextlabel("label")
    .setText("strip count: " + stripcount())
    .setPosition(600,820)
    .setColorValue(0xffffffff)
    ;
  note2 = cp5.addTextlabel("label2")
    .setText("LED count: " + ledCount())
    .setPosition(600,830)
    .setColorValue(0xffffffff)
    ;


}

void draw() {
  background(0);
  noStroke();
  fill(255);


  pushMatrix();
  if (stagger == true) translate(buffer+spacing/2, buffer+spacing/2);
  else translate(buffer+spacing/2, buffer+spacing/2);
  for (int x = 0; x < gridSize; x++) {
    for (int y = 0; y < gridSize; y++) {
      makepoint(x,y);
      if (stagger == true) {
        if (x < gridSize-1 && y < gridSize-1) makepoint(x+.5, y+.5);

    }
    }

  }
  popMatrix();

  note.setText("stripcount: " + stripcount());
  note2.setText("LED count: " + ledCount());
}

void gridSize(int gsize) {
  gridSize = gsize;
  if (gridSize != 0) spacing = (width-buffer*2)/gridSize;
}


void makepoint(float x, float y) {
  ellipse(x*spacing, y*spacing, pointsize, pointsize);
}

int stripcount() {
  return stagger ? gridSize*gridSize + (gridSize-1)*(gridSize-1) : gridSize*gridSize;
}

int ledCount() {
  ledTotal = floor(leds[int(r1.getValue())-1] * stripcount() * 2.13);
  return ledTotal;
}
