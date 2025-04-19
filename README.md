### Whirltube

Simple bash interface for interacting with [yt-dlp](https://github.com/yt-dlp/yt-dlp). Requires yt-dlp, ffmpeg and VLC.

![screenshpt](https://i.imgur.com/TdKwlTv.png)

### Use

Download wt.sh from the web interface or with `wget https://raw.githubusercontent.com/mbluelander/whirltube/refs/heads/main/wt.sh`. If you would like to be able to run the program from anywhere, place wt.sh in one of your system's "PATH" folders. An example on Debian would be `/home/[username]/.local/bin/`. For a list of folders in your system's PATH, open a command line and type `echo $PATH`. 

Make the program executable with `chmod +x wt.sh`. If you placed wt.sh in a path folder, simply open a terminal and type wt.sh. Your downloaded media will be stored in whatever folder you're currently in. Otherwise, navigate to the folder containing wt.sh and type `./wt.sh`. Choose your option, and paste the youtube (or other supported media) URL with `ctrl+shift+v` (may vary depending on your terminal emulator) and press enter. Tested and working on Debian 12 with bash 5.2.15.
