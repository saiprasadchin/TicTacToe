#!/bin/bash
echo "Weclome to Tic Tac Toe Game."
#constant
TOTAL_CELL=9

#variable
count=0
switchPlayer=0
playerLatter=O
computerLatter=X
#array declaration of array
declare -a board

function resettingBoard() {
        board=(. . . . . . . . . .)
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
                echo "Player will play first."
                read -p "choose your letter X or O : " l

                if [[ $l == $computerLatter ]]
                then
                        playerLatter=$l
                        computerLatter=O
                        echo "player latter : $playerLatter"
                        echo "computer latter : $computerLatter"

                else
                        playerLatter=$l
                        computerLatter=X
                        echo "player latter : $playerLatter"
                        echo "computer latter : $computerLatter"
                fi


        else
                echo "Computer will play first."
        fi
}

function switchPlayer() {
        echo "player latter : $playerLatter"
        echo "computer latter : $computerLatter"
        if [[ $switchPlayer == 0 ]]
        then
                playerPlaying
        else
                computerPlaying
        fi

}


function playerPlaying() {
        echo "Player turn: "
        read -p "Enter position between 1 to 9: " position
        board[$position]=$playerLatter
        switchPlayer=1
}
resettingBoard

tossToPlay
displayBoard
switchPlayer
displayBoard
