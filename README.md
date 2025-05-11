### Whirltube

Simple bash interface for interacting with [yt-dlp](https://github.com/yt-dlp/yt-dlp). Also requires [ffmpeg](https://github.com/FFmpeg/FFmpeg) and optionally [vlc](https://github.com/videolan/vlc) to enable streaming.

![screenshot](https://imgur.com/f2z4ILu.png)

### Use

Download wt.sh from the web interface or with 

```
wget https://raw.githubusercontent.com/mbluelander/whirltube/refs/heads/main/wt.sh
```

If you would like to be able to run the program from anywhere, place wt.sh in one of your system's "PATH" folders. For a list of folders in your system's PATH, open a command line and type `echo $PATH`. 

>[!NOTE]
>wt.sh must be in the same folder as yt-dlp, or yt-dlp must be in your system's `$PATH` to use whirltube.

Make the program executable with `chmod +x wt.sh`. If you placed wt.sh in a path folder, simply open a terminal and type wt.sh. Your downloaded media will be stored in whatever folder you're currently in. Otherwise, navigate to the folder containing wt.sh and type `./wt.sh`. Choose your option, and paste the youtube (or other supported media) URL with `ctrl+shift+v` (may vary depending on your terminal emulator) and press enter.

Option 4 toggles downloading of subtitles. To set this option to always on, change the default settings.

Option 5 toggles the importing of browser cookies for obtaining login-gated content. This will default to firefox, which can be changed in the default settings (see below.)

Options 6 and 7 will cycle through some basic options for video resolution and audio format. This can be overridden by changing the default settings.

```
wt.sh [url]
```

Will skip the menu and immediately download the media at [url] with the default settings.

### Default settings

Open wt.sh in a text editor to change.

```bash
### DEFAULT SETTINGS ################################################
sub=0		# 1 = download subtitles of specified language
lang="en-en" 	# Subtitle language
res=720 	# Default resolution. 480, 720, 1080, etc.
form="mp3" 	# Format for audio extraction. Mp3, Opus, M4a, etc.
cookies=0	# 1 = import browser cookies for login-gated content
bsr="firefox"	# Browser from which to allow cookies
embed=1		# 1 = embed chapter metadata
### ADVANCED ########################################################
vc="h264"	# Video codec
ac="m4a"	# Audio codec
player="vlc"	# Local video player for streaming
#####################################################################
```


### Changes
* **1.1.4**
  * Fixed case sensitivity bug. Added advanced default settings.
* **1.1.3**
  * Whirltube will now embed chapter metadata into downloaded video if available.
  * Added attractive unicode icon.
* **1.1.2**
  * Added option to import browser cookies.
  * Replaced Ogg in default audio formats with M4a.
* **1.1.1**
  * Fixed inconsistent UI.
* **1.1.0**
   * Added support for changing resolution, audio format and subtitle language.
   * Added default setting information.
* **1.0.4**
   * Fixed bug with wrong equality symbol.
* **1.0.3**
  * Downloading subtitles is now a configurable setting.
  * Launching whirltube with a URL will now automatically start yt-dlp with the default download settings.

* **1.0.1**
  * Whirltube will now download any available english subtitles for video.
