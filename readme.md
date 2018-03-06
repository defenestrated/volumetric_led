# LED Chandelier
### Studio Galison / IB5k / MC2 / Verizon
---

### There are three parts to this software setup:
1. The custom video processing software - built in [Max/MSP/Jitter](https://cycling74.com/). This reads the camera feeds, performs background subtraction, creates the delay effect, and maps the video to fit the physical structure.
2. A [Lightjams](https://www.lightjams.com/) file; lightjams communicates with the Enttec Pixelator and controls the actual LED lights.
3. [Spout](http://spout.zeal.co/), a framework for realtime video transport in windows (equivalent to syphon on mac). This is how Jitter sends video to Lightjams.
---
### fresh installation:
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
### usage:
After installation, you'll have a folder containing the whole project. It'll be in the home folder of your user. In that folder, open the following two files:
- [lightjams/volumetric-36grid-production.ljp](lightjams/volumetric-36grid-production.ljp)
- [video-processing-WINDOWS/video-processing-WINDOWS.maxproj](video-processing-WINDOWS/video-processing-WINDOWS.maxproj)
   
...and that's it! The Max patch should start up, load the right preset, and begin sending data to lightjams right away. If there are any issues, they'll show up in the Max console, which you can access via Window > Max Console or ctrl+M.

**note:** you can ignore any messages that say "grabber component already open" or similar.

---
### pulling changes:
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
