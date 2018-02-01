import processing.video.*;
import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

int videoScale = 10;
int cols, rows;

Capture video;
PeasyCam cam;

void setup() {
  size(1600, 900, P3D);
  double lx =  cols/2*videoScale;
  double ly =  rows/2*videoScale;
  double lz =  rows/2*videoScale;
  cam = new PeasyCam(this, lx, ly, lz, 400);
  cam.setYawRotationMode();
  // cam.lookAt(cols/2*videoScale, rows/2*videoScale, rows/2*videoScale);
  // Initialize columns and rows
  cols = 8;
  rows = 60;
  // Construct the Capture object
  video = new Capture(this, cols, rows);
  video.start();
  stroke(255);
  strokeWeight(3);
}

void captureEvent(Capture video) {
  video.read();
}

void draw() {
  background(0);
  video.loadPixels();
  // Begin loop for columns

  translate(0,(rows*videoScale)/-4,0);

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i*videoScale;
      int y = j*videoScale/3;
      int loc = (video.width - i - 1) + j * video.width;
      color c = video.pixels[loc];
      float magnitude = brightness(c);
      stroke(255, magnitude);
      for (int k = 0; k < cols; k++) {
        point(i*10, j*10/3, k*10);
      }
    }
  }



  // for (int i = 0; i < cols; i++) {
  //   // Begin loop for rows
  //   for (int j = 0; j < rows; j++) {
  //     for (int k = 0; k < cols; k++) {

  //       // Where are you, pixel-wise?
  //       int x = i*videoScale;
  //       int y = j*videoScale;
  //       int z = k*videoScale;

  //       // Reverse the column to mirro the image.
  //       int loc = (video.width - i - 1) + j * video.width;

  //       color c = video.pixels[loc];
  //       // A rectangle's size is calculated as a function of the pixel’s brightness.
  //       // A bright pixel is a large rectangle, and a dark pixel is a small one.
  //       float sz = (brightness(c)/255) * videoScale;

  //       rectMode(CENTER);
  //       fill(255);
  //       noStroke();
  //       rect(x + videoScale/2, y + videoScale/2, z + videoScale/2, sz, sz);
  //     }
  //   }
  // }
}
