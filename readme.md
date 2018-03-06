# LED Chandelier
#### Studio Galison / IB5k / MC2 / Verizon
---

## There are three parts to this software setup
1. The custom video processing software - built in [Max/MSP/Jitter](https://cycling74.com/). This reads the camera feeds, performs background subtraction, creates the delay effect, and maps the video to fit the physical structure.
2. A [Lightjams](https://www.lightjams.com/) file; lightjams communicates with the Enttec Pixelator and controls the actual LED lights.
3. [Spout](http://spout.zeal.co/), a framework for realtime video transport in windows (equivalent to syphon on mac). This is how Jitter sends video to Lightjams.
---
## fresh installation
1. download and install:
   - [Git for windows](https://git-scm.com/download/win)
   - [Max](https://cycling74.com/downloads)
   - [Lightjams](https://www.lightjams.com/getIt.html)
   - [Spout](http://spout.zeal.co/download-spout/)

2. open Max and install the Jitter externals for spout through the package manager:
   - File > Show Package Manager (if it asks you to update, click ok)
   - enter "spout" in the search bar
   - Spout should be the only thing that shows up -- click it, then click install.
   - close the package manager
   
3. Open Git Bash (comes with the Git for Windows installation) and type or copy/paste the following, then hit enter:
```bash
    git clone https://github.com/defenestrated/volumetric_led
```
---
## usage
After installation, you'll have a folder containing the whole project. It'll be in the home folder of your user. In that folder, open the following two files:
- [lightjams/volumetric-36grid-production.ljp](lightjams/volumetric-36grid-production.ljp)
- [video-processing-WINDOWS/video-processing-WINDOWS.maxproj](video-processing-WINDOWS/video-processing-WINDOWS.maxproj)
   
...and that's it! The Max patch should start up, load the right preset, and begin sending data to lightjams right away. If there are any issues, they'll show up in the Max console, which you can access via Window > Max Console or ctrl+M.

**note:** you can ignore any messages that say "grabber component already open" or similar.

### what's going on in the patch:
#### Top left panel:
- **patch on / off** (the big X) *shortcut: space* -- turns on /off the whole patch - camera intake, video processing, video out.
- **toggle color** *shortcut: C* -- choose whether the camera intake is in color or black+white (**note**: this is unrelated to the color *tint*, below)
- **delay time** -- the amount of time in frames it takes the camera image to cascade back in space from one row of LED tubes to the next
- **refresh device lists** -- repopulates the lists of attached cameras
- **preset panel** -- controls global presets for the whole patch. Shift+click on a square to save a new preset, click to activate that preset, alt+shift+click to delete a preset  
(**note:** the first preset will be autoloaded within 20 seconds of the patch opening.)

#### Two central panels (front cam / side cam):
These control the image processing for each of the two cameras. "Side cam" should face to your right as you look at the front of the chandelier.
- **webcam select** -- dropdown menu to choose video input device. Both webcams will be labeled "Microsoft LifeCam...", so it's a bit confusing.
- **toggle camera resolution** *shortcut: Y* -- toggles between rendering full (160 x 120) images and rendering the "actual" resolution of the chandelier, which is 6x60 per face. This shouldn't affect the visuals, but rendering the full image makes the previews easier to understand, potentially at the cost of some processing speed.
- **glide** -- how much the video "glides" between frames. It's a trailing effect, and also reduces some noise.
- **contrast** -- adjust image contrast
- **brightness** -- adjust image brightness
- **toggle / set threshhold** -- if set, image will be full black and full white, with anything below the threshhold going black. Useful for eliminating noise, at the cost of a slightly less recognizable image.
- **color tint** -- tint the resultant image a certain color (choose color via RGB number boxes or the saturation / color picker below)

#### Bottom left panel:
This controls the motion detection / analytics logging
- **motion / threshhold** -- left slider shows the amount of change in the video image, right slider sets what counts as "movement."
- **# of samples to smooth** -- higher values mean smoother readings + less responsive to quick changes, lower values mean jumpier readings, more responsive
- **m/s indicators** -- indicates movement / stillness
- **open log file** -- opens currently active interaction log
- **auto wipe timeout** -- how long a face has to be still before it automatically subtracts the background again

#### Bottom right panel:
- **enable previews** -- see the output in real time (on the right) - turn off for slightly better processing speed
- **invert Y output** -- something about Spout flips the video in the Y direction -- this compensates.




---
## pulling changes
1. copy any motion log files somewhere safe: copy any **.txt** files in the video-processing-WINDOWS/patchers folder to the desktop, which you can do manually or with the following command:
```bash
    cd ~/volumetric_led/video-processing-WINDOWS
    cp *.txt ~/Desktop/
```
2. get the latest changes with the following commands:

*caution: this will destroy any local changes, including interaction logs, so be sure to back those up somewhere outside the volumetric_led folder*
```bash
    cd ~/volumetric_led
    git stash --all
    git pull
    git stash drop
```
