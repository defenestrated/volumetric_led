#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
  #include <avr/power.h>
#endif

// Parameter 1 = number of pixels in strip
// Parameter 2 = Arduino pin number (most are valid)
// Parameter 3 = pixel type flags, add together as needed:
//   NEO_KHZ800  800 KHz bitstream (most NeoPixel products w/WS2812 LEDs)
Adafruit_NeoPixel strips[] = {
  Adafruit_NeoPixel(10, 3, NEO_GRB + NEO_KHZ800),
  Adafruit_NeoPixel(20, 5, NEO_GRB + NEO_KHZ800),
  Adafruit_NeoPixel(20, 6, NEO_GRB + NEO_KHZ800)
};

#define NUM_STRIPS 3

int wait = 10;
int period = 4000;

// IMPORTANT: To reduce NeoPixel burnout risk, add 1000 uF capacitor across
// pixel power leads, add 300 - 500 Ohm resistor on first pixel's data input
// and minimize distance between Arduino and first pixel.  Avoid connecting
// on a live circuit...if you must, connect GND first.

void setup() {

  for (int i = 0; i < NUM_STRIPS; i++) {
    strips[i].begin();
    strips[i].show(); // Initialize all pixels to 'off'
  }

  Serial.begin(9600);

}

void loop() {

  unsigned long current = millis() % period;
  float uptime = float(period)/2;
  boolean half = current < period/2;

  float where = float(current) / uptime;
  where = where < 1 ? where : where - 1;

  Serial.print(current);
  Serial.print("\t");
  Serial.print(half);
  Serial.print(" ");
  Serial.print(where);
  Serial.print(" ");


  for (int i = 0; i < NUM_STRIPS; i++) {
    float total = strips[i].numPixels();
    int ix = int(where*total);
    boolean is_folded = i == 2;
    Serial.print(is_folded);

    if (current < 2000) {
      strips[i].setPixelColor(ix, 255,255,255);
      strips[i].setPixelColor((ix-1)%int(total), 0,0,0);
    }
    /* else strips[i].setPixelColor(ix, 0,0,0); */
    /* if (half) { */
      /* strips[i].setPixelColor(5, 255,255,255); */
    /* } */
    /* else { */
      /* strips[i].setPixelColor(5, 0,0,0); */
    /* } */

    strips[i].show();


  }


  Serial.println();
}

int pixelpick(Adafruit_NeoPixel strip, boolean mirror, int index) {
  if (mirror == true) {
    return int(strip.numPixels() - index);
  }
  else return index;
}


// Input a value 0 to 255 to get a color value.
// The colours are a transition r - g - b - back to r.
uint32_t Wheel(Adafruit_NeoPixel strip, byte WheelPos) {
  WheelPos = 255 - WheelPos;
  if(WheelPos < 85) {
    return strip.Color(255 - WheelPos * 3, 0, WheelPos * 3);
  }
  if(WheelPos < 170) {
    WheelPos -= 85;
    return strip.Color(0, WheelPos * 3, 255 - WheelPos * 3);
  }
  WheelPos -= 170;
  return strip.Color(WheelPos * 3, 255 - WheelPos * 3, 0);
}



// Fill the dots one after the other with a color
void colorWipe(Adafruit_NeoPixel strip, uint32_t c, uint8_t wait) {
  for(uint16_t i=0; i<strip.numPixels(); i++) {
    strip.setPixelColor(i, c);
    strip.show();
    delay(wait);
  }
}

void rainbow(Adafruit_NeoPixel strip, uint8_t wait) {
  uint16_t i, j;

  for(j=0; j<256; j++) {
    for(i=0; i<strip.numPixels(); i++) {
      strip.setPixelColor(i, Wheel(strip, (i+j) & 255));
    }
    strip.show();
    delay(wait);
  }
}

// Slightly different, this makes the rainbow equally distributed throughout
void rainbowCycle(Adafruit_NeoPixel strip, uint8_t wait) {
  uint16_t i, j;

  for(j=0; j<256*5; j++) { // 5 cycles of all colors on wheel
    for(i=0; i< strip.numPixels(); i++) {
      strip.setPixelColor(i, Wheel(strip, ((i * 256 / strip.numPixels()) + j) & 255));
    }
    strip.show();
    delay(wait);
  }
}

//Theatre-style crawling lights.
void theaterChase(Adafruit_NeoPixel strip, uint32_t c, uint8_t wait) {
  for (int j=0; j<10; j++) {  //do 10 cycles of chasing
    for (int q=0; q < 3; q++) {
      for (uint16_t i=0; i < strip.numPixels(); i=i+3) {
        strip.setPixelColor(i+q, c);    //turn every third pixel on
      }
      strip.show();

      delay(wait);

      for (uint16_t i=0; i < strip.numPixels(); i=i+3) {
        strip.setPixelColor(i+q, 0);        //turn every third pixel off
      }
    }
  }
}

//Theatre-style crawling lights with rainbow effect
void theaterChaseRainbow(Adafruit_NeoPixel strip, uint8_t wait) {
  for (int j=0; j < 256; j++) {     // cycle all 256 colors in the wheel
    for (int q=0; q < 3; q++) {
      for (uint16_t i=0; i < strip.numPixels(); i=i+3) {
        strip.setPixelColor(i+q, Wheel(strip, (i+j) % 255));    //turn every third pixel on
      }
      strip.show();

      delay(wait);

      for (uint16_t i=0; i < strip.numPixels(); i=i+3) {
        strip.setPixelColor(i+q, 0);        //turn every third pixel off
      }
    }
  }
}
