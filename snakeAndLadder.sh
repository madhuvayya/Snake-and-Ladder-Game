#!/bin/bash -x

START_POS=0
WIN_POS=100

echo "Enter number of players:"
read n

declare -A players
declare -A dieRolledCount

count=0

players(){
	for((i=1;i<=$n;i++))
	do
		players[$i]=0
	done
}

move(){
	playerPos=$1

	die=$((1+RANDOM%6))
	option=$((RANDOM%3))

	case $option in
		0 )
			#No change in player position
			;;
		1 )
			prevPos=$playerPos
			playerPos=$(($playerPos+$die))

			if [ $playerPos -gt $WIN_POS ]
			then
				playerPos=$prevPos
			fi
			;;
		2 )
			playerPos=$(($playerPos-$die))

			if [ $playerPos -lt $START_POS ]
			then
				playerPos=0
			fi
			;;
	esac

	echo $playerPos
}

start(){
	while true
	do
		for((i=1;i<=$n;i++))
		do

			#Invoking move function
			players[$i]=$( move ${players[$i]} )

			echo "player $i positio:" ${players[$i]}

			if [ ${players[$i]} -eq $WIN_POS ]
			then
				echo "Player $i Won"
				echo "Plyers positions:" ${players[@]}
				exit
			fi
		done
	done
}

#Invoking players function
players

#Invoking start function to start the game
start
