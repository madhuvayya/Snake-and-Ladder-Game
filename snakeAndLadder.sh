#!/bin/bash

START_POS=0
WIN_POS=100

playerPos=0

i=0

move(){
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

	if [ $playerPos -lt $START_POS ]
	then
		playerPos=0
	elif [ $playerPos -gt $WIN_POS ]
	then
		playerPos=$prevPos
	fi
}

while true
do
	#Invoking move function
	move

	position[((i++))]=$playerPos

	if [ $playerPos -eq $WIN_POS ]
	then
		echo "Player reached winning position:" $playerPos
		echo "Positions: " ${position[@]}
		echo "Number of times dice rolled:" ${#position[@]}
		exit
	fi
done
