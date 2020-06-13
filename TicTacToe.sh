#!/bin/bash
echo "Weclome to Tic Tac Toe Game."
#variable
player=O
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

resettingBoard
displayBoard
tossToPlay
