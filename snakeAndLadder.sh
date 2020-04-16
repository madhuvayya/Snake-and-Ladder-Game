#!/bin/bash -x

START_POS=0
WIN_POS=10

player1Pos=0
player2Pos=0

count=0

move(){
	playerPos=$1

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

	echo $playerPos
}

while true
do
	#Invoking move function
	player1Pos=$( move $player1Pos )
	p1sPos[((count))]=$player1Pos

	player2Pos=$( move $player2Pos )
	p2sPos[((count++))]=$player2Pos

	if [ $player1Pos -eq $WIN_POS ]
	then
		echo "Player1 Won"
		echo "Player1 positions:" ${p1sPos[@]}
		echo "Number of times dice rolled:" ${#p1sPos[@]}
		exit
	elif [ $player2Pos -eq $WIN_POS ]
	then
		echo "Player2 Won"
		echo "Player2 positions:" ${p2sPos[@]}
		echo "Number of times dice rolled:" ${#p2sPos[@]}
		exit
	fi
done
