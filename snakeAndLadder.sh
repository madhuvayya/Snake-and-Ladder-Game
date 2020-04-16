#!/bin/bash -x

playerPos=0

random=$((1+RANDOM%6))
option=$((RANDOM%3))
echo option $option

case $option in
	0 )
		echo "NO play stay in same position"
		;;
	1 )
		playerPos=$(($playerPos+$random))
		;;
	2 )
		playerPos=$(($playerPos-$random))
		;;
esac

echo "player position" $playerPos
