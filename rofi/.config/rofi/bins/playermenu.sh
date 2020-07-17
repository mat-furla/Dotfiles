#! /bin/bash
function setoption {
	while test $# -gt 0; do
		case "$1" in
			-l)
				shift
				option="date"
				string="$1"
				shift
				;;
			-r)
				shift
				option="relevance"
				string="$1"
				shift
				;;
			-v)
				shift
				option="viewCount"
				string="$1"
				shift
				;;
			*)
				echo "$1 is not recognized flag please use [-l latest], [-r relevance], [-v viewCount] as options"
		esac
	done
}	
setoption "$1" "$2"
query=$( echo "$string" | sed 's/ /%20/g' )
url="https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=15&order=$option&q=$query&key=INSERT_YOUTUBE_API_KEY_HERE"
list=$(curl -s "$url" --header 'Accept: application/json' --compressed)
length=$( echo "$list" | jq '.items | length')
selected=$(echo $list | jq -r '.items[] | .snippet.title+" (by - "+.snippet.channelTitle+") id = "+(.id.playlistId // .id.videoId)' |rofi -show -dmenu -theme $HOME/.config/rofi/themes/bookmarksmenu.rasi -l $length)
idselect=$(echo $selected |  awk 'NF>1{print $NF}')
length=$(printf $idselect | wc -c)
#echo "$length"
if [ $length == 11 ]
then
	$(echo $idselect | xargs -I {} mpv "https://www.youtube.com/watch?v={}")
elif [ $length -gt 11 ]
then
	watchcondition=$(printf "No\nYes" | rofi -show -dmenu -theme $HOME/.config/rofi/themes/bookmarksmenu.rasi -p "This link is for a playlist?Want to watch?")
	if [ $watchcondition == "No" ]
	then
		exit 1
	fi	
	urlp="https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=$idselect&key=INSERT_YOUTUBE_API_KEY_HERE"
	urlplaylist=$(curl -s "$urlp" --header 'Accept: application/json' --compressed)
	arr=($(echo $urlplaylist | jq -r '.items[].snippet.resourceId.videoId'))
	for  i in  "${arr[@]}"
	do 
		$(mpv "https://www.youtube.com/watch?v=$i")
	done
fi