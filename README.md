### Whirltube

Simple bash interface for interacting with [yt-dlp](https://github.com/yt-dlp/yt-dlp). Requires yt-dlp, ffmpeg and VLC.

![screenshpt](https://imgur.com/fijdcLD.png)

### Use

Download wt.sh from the web interface or with 

```
wget https://raw.githubusercontent.com/mbluelander/whirltube/refs/heads/main/wt.sh
```

If you would like to be able to run the program from anywhere, place wt.sh in one of your system's "PATH" folders. An example on Debian would be `/home/[username]/.local/bin/`. For a list of folders in your system's PATH, open a command line and type `echo $PATH`. 

Make the program executable with `chmod +x wt.sh`. If you placed wt.sh in a path folder, simply open a terminal and type wt.sh. Your downloaded media will be stored in whatever folder you're currently in. Otherwise, navigate to the folder containing wt.sh and type `./wt.sh`. Choose your option, and paste the youtube (or other supported media) URL with `ctrl+shift+v` (may vary depending on your terminal emulator) and press enter.

Option 4 toggles downloading of subtitles. To set this option to always on, change the default settings.

Options 5 and 6 will cycle through some basic options for video resolution and audio format. This can be overridden by changing the default settings.

```
wt.sh [url]
```

Will skip the menu and immediately download the media at [url] with the default settings.

### Default settings

Open wt.sh in a text editor to change.

```bash
sub=0		# 1 to download subtitles, 0 to leave off
lang="en" 	# Subtitle language
res=720 	# Default resolution. 480, 720, 1080, etc.
form="Mp3" 	# Format for audio extraction. Mp3, Opus, Ogg, etc.
```


### Changes

* **1.0.1**
  * Whirltube will now download any available english subtitles for video.
* **1.0.3**
  * Downloading subtitles is now a configurable setting.
  * Launching whirltube with a URL will now automatically start yt-dlp with the default download settings.
* **1.0.4**
   * Fixed bug with wrong equality symbol.
* **1.1.0**
   * Added support for changing resolution, audio format and subtitle language.
   * Added default setting information.
