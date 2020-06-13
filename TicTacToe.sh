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

                else
                        playerLatter=$l
                        computerLatter=X
                fi


        else
                echo "Computer will play first."
        fi
}
function computerPlaying() {
        echo "Computer turn: "
        computerPlayingToWin
        computerPlayingToBlock
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
	winningCondition $turnChange
}


function playerPlaying() {
        echo "Player turn: "
        read -p "Enter position between 1 to 9: " position
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
                                echo "Winner is $computer's"
                                exit
                        else
                                board[$j]="."
                                #block=0
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
                                #block=1
                                ((count++))
                                displayBoard
                                break
                        else
                                board[$k]="."
                        fi
                fi
        done
}





function checkingGameStatus() {
        if [[ $winner -eq 1 ]]
        then
                echo "Winner is $turnChange's"
                exit
        elif [[ $count -ge $TOTAL_CELL ]]
        then
                echo tie
        fi
}
resettingBoard
tossToPlay
displayBoard
switchPlayer
displayBoard
checkingGameStatus
