#!/bin/bash
echo "Weclome to Tic Tac Toe Game."
#constant
TOTAL_CELL=9

#variable
count=0
switchPlayer=1
playerLatter=O
computerLatter=X
#array declaration of array
declare -a board

function resettingBoard() {
        board=(. . . . . . . . . .)
}
function empty() {
        index=0
        for((i=1;i<=9;i++)){
            if [[ ${board[$i]} == . ]]
            then
                 emptyCells[$index]=$i
                let index++
            fi
        }
}

function displayBoard() {

        echo "***TicTacToe Board***"
        echo "|  ${board[1]}  ||  ${board[2]}  ||  ${board[3]}  |"
        echo "|  ${board[4]}  ||  ${board[5]}  ||  ${board[6]}  |"
        echo "|  ${board[7]}  ||  ${board[8]}  ||  ${board[9]}  |"
        echo "**********************"

}

function tossToPlay() {
        if [ $((RANDOM%2)) -eq 0 ]
        then

                switchPlayer=0
                echo "Player will play first."
                read -p "choose your letter X or O : " l

                if [[ $l == $computerLatter ]]
                then
                        playerLatter=$l
                        computerLatter=O

                else
                        playerLatter=$l
                        computerLatter=X

                fi


        else
                echo "Computer will play first."
        fi
}

function computerPlaying() {
	echo "========================="
        echo "Computer turn: "
        computerPlayingToWin
        computerPlayingToBlock
        if [[ $block == 0 ]]
        then
                takeAvailableCorners
        fi
        switchPlayer=0
	displayBoard
}



function switchPlayer() {


        if [[ $switchPlayer == 0 ]]
        then
                playerPlaying
        else
                computerPlaying
        fi
                winningCondition $turnChange
}


function playerPlaying() {
	echo "==========================="

        echo "Player turn: "

	displayBoard
	echo "player latter : $playerLatter"
        echo "computer latter : $computerLatter"
	echo "Empty Cells :${emptyCells[@]}"
        read -p "Select your Cell : " position

        turnChange=$playerLatter
        checkingEmptyCell
        board[$position]=$playerLatter
        switchPlayer=1
}



function checkingEmptyCell() {
        if [[ $position -ge 1 && $position -le 9 ]]
                then
                        if [[ ${board[$position]} == . ]]
                        then
                        echo "............ $turnChange is placed at $position ............"
                        ((count++))
                        else
                                echo "Cell is already occupied!!!"
                                switchPlayer
                        fi
         else
                 echo "Invalid cell value!!!"
                 switchPlayer
         fi
}

function winningCondition() {
        for((i=1;i<=$TOTAL_CELL;i=$(($i+3))))
        do
                if [[ ${board[$i]} == ${board[$i+1]} && ${board[$i+1]} == ${board[$i+2]} && ${board[$i+2]} == $1 ]]
                then
                        winner=1
                fi
        done
        for((i=1;i<=3;i++))
        do
                if [[ ${board[$i]} == ${board[$i+3]} && ${board[$i+3]} == ${board[$i+6]} && ${board[$i]} == $1 ]]
                then
                        winner=1
                fi
        done
        if [[ ${board[1]}  == ${board[5]} && ${board[5]} == ${board[9]} && ${board[5]} == $1 ]]
        then
                winner=1
        elif [[ ${board[3]}  == ${board[5]} && ${board[5]} == ${board[7]} && ${board[5]} == $1 ]]
        then
                winner=1
        fi
}

function computerPlayingToWin() {
        for((j=1;j<=$TOTAL_CELL;j++))
        do
                if [[ ${board[$j]} == . ]]
                then
                        board[$j]=$computerLatter
                        winningCondition $computerLatter
                        if [[ $winner -eq 1 ]]
                        then
                                displayBoard
                                echo "Winner is computer's"
                                exit
                        else
                                board[$j]="."
                                block=0
                        fi
                fi
        done
}

function computerPlayingToBlock() {
        for((k=1;k<=$TOTAL_CELL;k++))
        do
                if [[ ${board[$k]} == . ]]
                then
                        board[$k]=$playerLatter
                        winningCondition $playerLatter
                        if [[ $winner -eq 1 ]]
                        then
                                board[$k]=$computerLatter
                                winner=0
                                block=1
                                ((count++))
                                #displayBoard
                                break
                        else
                                board[$k]="."
                        fi
                fi
        done
}
function takeAvailableCorners() {
        for((l=1;l<=$TOTAL_CELL;l=$l+2))
        do
                if [[ $l == 5 ]]
                then
                        l=$(($l+2))
                fi
                if [[ ${board[$l]} == . ]]
                then
                        board[$l]=$computerLatter
                        local center=1
                        ((count++))
                        break
                fi
        done
        takeCenter
}

function takeCenter() {
        if [[ $center -ne 1 ]]
        then
                local middle=$(($TOTAL_CELL+1))/2
                if [[  ${board[$middle]} == . ]]
                then
                        board[$middle]=$computerLatter
                        ((count++))
                else
                        takeAvailableSides
                fi
        fi
}

function takeAvailableSides() {
        for((m=2;m<=8;m+=2))
        do
                if [[ ${board[$m]} == . ]]
                then
                        board[$m]=$computerLatter
                        ((count++))
                        break
                fi
        done
}
function checkingGameStatus() {
        if [[ $winner -eq 1 ]]
        then
		displayBoard
                echo "Winner is $turnChange's"
                exit
        elif [[ $count -ge $TOTAL_CELL ]]
        then
		echo "=========================="
		displayBoard
                echo "game is tie"
        fi
}

resettingBoard
tossToPlay
while [[ $count -ne $TOTAL_CELL ]]
do
	empty
        switchPlayer
        checkingGameStatus
        emptyCells=()

done
