#!/bin/bash
echo "Weclome to Tic Tac Toe Game."
#array declaration of array
declare -a board

function resettingBoard() {
        board=(. . . . . . . . . .)
}
resettingBoard
function displayBoard() {

        echo "***TicTacToe Board***"
        echo "|  ${board[1]}  ||  ${board[2]}  ||  ${board[3]}  |"
        echo "|  ${board[4]}  ||  ${board[5]}  ||  ${board[6]}  |"
        echo "|  ${board[7]}  ||  ${board[8]}  ||  ${board[9]}  |"
        echo "**********************"

}
displayBoard
