TicTacToe App
==============

## Description

This iOS app is an easy-to-use tictactoe game simulator where the user can play against a friend or the computer. 

## Background

I created this simple app as a side project in my free time. I initially programmed a python program that was an unbeatable tictactoe machine. However, I thought the game would be more interesting as an app with the visuals of a real tictactoe game. Once I translated the code from python into Swift, I then added more screens, difficulty levels, and modes for a more enjoyable app. 

## Demo / Walkthrough

<img src="http://g.recordit.co/QG3gM0imjZ.gif" width="200px">

## Features

- Two modes
  - In single player, the user competes with the computer
  - In multiplayer, there would be two users on the phone alternating turns. 
- Ranging difficulty levels: The three modes (as seen in the demo) are easy, medium, and difficult. 
  - In easy, the computer opponent will randomly select an open position for its move. 
  - In medium, the computer will check to see if any of the squares is a winning move, and move there; otherwise its move is random. 
  - In difficult, the computer is literally unbeatable; it first looks for any winning moves (by either player), then checks the center, then checks for the corners and finally resorts to a side position. While you may be able to tie this computer, you will never be able to beat it. 
- Restart button after game is won: 
  - This button is shown after a player has won or there is a tie and allows the user to begin a brand new game. 
 
