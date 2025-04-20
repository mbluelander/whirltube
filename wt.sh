#!/usr/bin/env bash
#requires: yt-dlp, ffmpeg, VLC
ans=0
sub="[off]"

if [[ $1 > "" ]]; then
	ans=1
	url=$1
fi
while [[ $ans -lt 1 || $ans -gt 4 ]]; do
	clear
	echo "whirltube 1.0.4" 
	echo
	echo "1. Download video"
	echo "2. Extract Mp3"
	echo "3. Play in VLC"
	echo -n "4. Download subtitles? " && echo $sub
	echo	
	echo -n "Choice? "
	read -n 1 ans
	if [[ $ans -eq 4 && $sub == "[off]" ]]; then
		sub="[on]"
		ans=0
	elif [[ $ans -eq 4 && $sub == "[on]" ]]; then
		sub="[off]"
		ans=0
	fi
done

echo && echo
while [[ $url == "" ]]; do
	echo -n "Enter URL: "
	read -r url
done
if [[ $ans -eq 1 ]]; then
	if [[ $sub == "[on]" ]]; then
		yt-dlp $url -S vcodec:h264,fps,res:720,acodec:m4a --write-sub --write-auto-sub --sub-lang "en.*"
		exit
	elif [[ $sub == "[off]" ]]; then
		yt-dlp $url -S vcodec:h264,fps,res:720,acodec:m4a
		exit
	fi
elif [[ $ans -eq 2 ]]; then
	yt-dlp --audio-format mp3 $url -x
	exit
elif [[ $ans -eq 3 ]]; then
	yt-dlp -o - --downloader ffmpeg -f "bv*+ba/b" - $url | vlc -
	exit
fi
