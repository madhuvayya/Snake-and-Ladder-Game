#!/bin/bash -x

WIN_POS=100

playerPos=0

while true
do
	random=$((1+RANDOM%6))
	option=$((RANDOM%3))
	prevPos=0

	case $option in
		0 )
			;;
		1 )
			prevPos=$playerPos
			playerPos=$(($playerPos+$random))
			;;
		2 )
			playerPos=$(($playerPos-$random))
			;;
	esac

	if [ $playerPos -lt 0 ]
	then
		playerPos=0
	elif [ $playerPos -gt 100 ]
	then
		playerPos=$prevPos
	fi

	if [ $playerPos -eq $WIN_POS ]
	then
		echo "Player reached winning position:" $playerPos
		exit
	fi
done
