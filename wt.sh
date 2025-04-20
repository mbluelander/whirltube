#!/usr/bin/env bash
#requires: yt-dlp, ffmpeg, VLC
ans=0
while [[ $ans -lt 1 || $ans -gt 3 ]]; do
	clear
	echo "whirltube 1.0.1" 
	echo
	echo "1. Download video"
	echo "2. Extract Mp3"
	echo "3. Play in VLC"
	echo	
	echo -n "Choice? "
	read -n 1 ans
done
echo && echo
echo -n "Enter URL: "
read -r url
if [[ $ans -eq 1 ]]; then
	yt-dlp $url -S vcodec:h264,fps,res:720,acodec:m4a --write-sub --write-auto-sub --sub-lang "en.*"
	exit
elif [[ $ans -eq 2 ]]; then
	yt-dlp --audio-format mp3 $url -x
	exit
elif [[ $ans -eq 3 ]]; then
	yt-dlp -o - --downloader ffmpeg -f "bv*+ba/b" - $url | vlc -
	exit
fi
