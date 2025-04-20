#!/usr/bin/env bash
#requires: yt-dlp, ffmpeg, VLC
#https://github.com/mbluelander/whirltube/

### DEFAULT SETTINGS
sub=0		# 1 to download subtitles, 0 to leave off
lang="en" 	# Subtitle language
res=720 	# Default resolution. 480, 720, 1080, etc.
form="Mp3" 	# Format for audio extraction. Mp3, Opus, Ogg, etc.
### END SETTINGS

ans=0
subu=("[x] no    [ ] yes" "[ ] no    [x] yes")

if [[ $1 > "" ]]; then
	ans=1
	url=$1
fi
while [[ $ans -lt 1 || $ans -gt 4 ]]; do
	clear
	echo "whirltube 1.1.1" 
	echo
	echo " 1. Download video" 
	echo " 2. Extract audio"
	echo " 3. Play in VLC"
	echo -n " 4. Download subtitles? " && echo "${subu[sub]}"
	echo -n " 5. Change resolution   [" && echo -n $res && echo "p]"
	echo -n " 6. Change audio format [" && echo -n $form && echo "]"
	echo " 9. Exit"
	echo	
	echo -n "Choice? "
	read -n 1 ans
	if [[ $ans -eq 9 ]]; then
		echo && echo
		exit
	fi
	if [[ $ans -eq 4 && $sub -eq 0 ]]; then
		sub=1
		ans=0
	elif [[ $ans -eq 4 && $sub -eq 1 ]]; then
		sub=0
		ans=0
	fi
	if [[ $ans -eq 5 && $res -eq 720 ]]; then
		res=1080
		ans=0
	elif [[ $ans -eq 5 && $res -eq 1080 ]]; then
		res=480
		ans=0
	elif [[ $ans -eq 5 && $res -eq 480 ]]; then
		res=720
		ans=0
	fi
	if [[ $ans -eq 6 && $form == "Mp3" ]]; then
		form="Opus"
		ans=0
	elif [[ $ans -eq 6 && $form == "Opus" ]]; then
		form="Ogg"
		ans=0
	elif [[ $ans -eq 6 && $form == "Ogg" ]]; then
		form="Mp3"
		ans=0
	fi
done

echo && echo
while [[ $url == "" ]]; do
	echo -n "Enter URL: "
	read -r url
done
if [[ $ans -eq 1 ]]; then
	if [[ $sub -eq 1 ]]; then
		yt-dlp $url -S vcodec:h264,fps,res:$res,acodec:m4a --write-sub --write-auto-sub --sub-lang "$lang.*"
		exit
	elif [[ $sub -eq 0 ]]; then
		yt-dlp $url -S vcodec:h264,fps,res:$res,acodec:m4a
		exit
	fi
elif [[ $ans -eq 2 ]]; then 
yt-dlp --audio-format $form $url -x
	exit
elif [[ $ans -eq 3 ]]; then
	yt-dlp -o - --downloader ffmpeg -f "bv*+ba/b" - $url | vlc -
	exit
fi
