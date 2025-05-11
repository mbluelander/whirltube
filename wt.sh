#!/usr/bin/env bash
#requires: yt-dlp, ffmpeg, VLC

#https://mattbee.zone/whirltube
version="🌀 whirltube 1.1.4"

### DEFAULT SETTINGS ################################################
sub=1		# 1 = download subtitles of specified language
lang="en-en" 	# Subtitle language
res=720 	# Default resolution. 480, 720, 1080, etc.
form="mp3" 	# Format for audio extraction. Mp3, Opus, M4a, etc.
cookies=0	# 1 = import browser cookies for login-gated content
bsr="firefox"	# Browser from which to allow cookies
embed=0		# 1 = embed chapter metadata
### ADVANCED ########################################################
vc="h264"	# Video codec
ac="m4a"	# Audio codec
player="vlc"	# Local video player for streaming
#####################################################################

ans=0
subu=("[x] no    [ ] yes" "[ ] no    [x] yes")
cookiesu=("[x] no    [ ] yes" "[ ] no    [x] yes")

if [[ cookies -eq 1 ]]; then
	usecookies="--cookies-from-browser $bsr"
else
	usecookies=""
fi
if [[ embed -eq 1 ]]; then
	chapters="--embed-chapters"
else
	chapters=""
fi

if [[ $1 > "" ]]; then
	ans=1
	url=$1
fi
while [[ $ans -lt 1 || $ans -gt 6 ]]; do
	clear
	echo $version 
	echo
	echo " 1. Download video" 
	echo " 2. Extract audio"
	echo " 3. Play in $player"
	echo -n " 4. Download subtitles? " && echo "${subu[sub]}"
	echo -n " 5. Use cookies?        " && echo "${cookiesu[cookies]}"
	echo -n " 6. Change resolution   [" && echo -n $res && echo "p]"
	echo -n " 7. Change audio format [" && echo -n $form && echo "]"
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
	if [[ $ans -eq 5 && $cookies -eq 0 ]]; then
		cookies=1
		usecookies="--cookies-from-browser $bsr"
		ans=0
	elif [[ $ans -eq 5 && $cookies -eq 1 ]]; then
		ans=0
		cookies=0
		usecookies=""
	fi
	if [[ $ans -eq 6 && $res -eq 720 ]]; then
		res=1080
		ans=0
	elif [[ $ans -eq 6 && $res -eq 1080 ]]; then
		res=480
		ans=0
	elif [[ $ans -eq 6 && $res -eq 480 ]]; then
		res=720
		ans=0
	fi
	if [[ $ans -eq 7 && $form == "mp3" ]]; then
		form="Opus"
		ans=0
	elif [[ $ans -eq 7 && $form == "opus" ]]; then
		form="M4a"
		ans=0
	elif [[ $ans -eq 7 && $form == "m4a" ]]; then
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
		yt-dlp $usecookies $url -S vcodec:$vc,fps,res:$res,acodec:$ac --write-sub --write-auto-sub --sub-lang "$lang.*" $chapters
		exit
	else
		yt-dlp $usecookies $url -S vcodec:$vc,fps,res:$res,acodec:$ac $chapters
		exit
	fi
elif [[ $ans -eq 2 ]]; then 
	yt-dlp $usecookies --audio-format $form $url -x
	exit
elif [[ $ans -eq 3 ]]; then
	yt-dlp $usecookies -o - --downloader ffmpeg -f "bv*+ba/b" - $url | $player -
	exit
fi
exec bash
