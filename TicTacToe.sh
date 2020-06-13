#!/bin/bash
echo "Weclome to Tic Tac Toe Game."
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
        else
                echo "Computer will play first."
        fi
}
resettingBoard
displayBoard
tossToPlay
