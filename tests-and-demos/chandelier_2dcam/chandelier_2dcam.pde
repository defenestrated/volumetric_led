import processing.video.*;
import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

int
  spacing = 20,
  cols = 16,
  rows = 120;

Capture video;
PeasyCam cam;

void setup() {
  size(1600, 900, P3D);
  double lx =  (cols*spacing)/2;
  double ly =  200;
  // double lz =  rows/2*spacing;
  cam = new PeasyCam(this, lx, ly, lx, 300);
  // cam.setYawRotationMode();
  cam.setSuppressRollRotationMode();

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

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (i >= 4 && i < 12 && j % 2 == 0) {
        float x = i*spacing;
        float y = j*spacing*cols/rows;

        int loc = (video.width - i - 1) + j * video.width;
        color c = video.pixels[loc];
        float magnitude = brightness(c);
        stroke(255, magnitude);
        // point(x, y);
        for (int k = 0; k < 8; k++) {
          int z = k*spacing;
          point(x, y, z);
        }
        cam.beginHUD();
        noStroke();
        fill(255, magnitude);
        rect(x+spacing/2,y+spacing/2, spacing, 2*spacing*cols/rows);
        cam.endHUD();
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
