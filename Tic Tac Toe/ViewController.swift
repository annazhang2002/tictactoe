//
//  ViewController.swift
//  ATown Connect
//
//  Created by Anna Zhang on 2/14/19.
//  Copyright © 2019 Anna Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var board = [String](repeating: " ", count: 10)
    var gameOver = false
    
    var mode = String()
    var level = String()
    var letter = "X"
    
    
    
    @IBOutlet weak var s1: UIButton!
    @IBOutlet weak var s2: UIButton!
    @IBOutlet weak var s3: UIButton!
    @IBOutlet weak var s4: UIButton!
    @IBOutlet weak var s5: UIButton!
    @IBOutlet weak var s6: UIButton!
    @IBOutlet weak var s7: UIButton!
    @IBOutlet weak var s8: UIButton!
    @IBOutlet weak var s9: UIButton!
    
    @IBOutlet weak var restart: UIButton!
    @IBAction func restart(_ sender: Any) {
        if gameOver {
            board = [String](repeating: " ", count: 10);
            s1.setTitle("", for: UIControl.State.normal);
            s2.setTitle("", for: UIControl.State.normal);
            s3.setTitle("", for: UIControl.State.normal);
            s4.setTitle("", for: UIControl.State.normal);
            s5.setTitle("", for: UIControl.State.normal);
            s6.setTitle("", for: UIControl.State.normal);
            s7.setTitle("", for: UIControl.State.normal);
            s8.setTitle("", for: UIControl.State.normal);
            s9.setTitle("", for: UIControl.State.normal);
            restart.setTitle("", for: UIControl.State.normal);
            info.text = "Click any space to begin";
            winner.text = "";
            gameOver = false;
            letter = "X"
        }
    }
    
    @IBOutlet weak var info: UILabel!
    
    @IBOutlet weak var winner: UILabel!
    
    
    @IBAction func move(_ sender: UIButton) {
        var move = 0;
        switch sender {
        case s1:
            move = 1;
            break;
        case s2:
            move = 2;
            break;
        case s3:
            move = 3;
            break;
        case s4:
            move = 4;
            break;
        case s5:
            move = 5;
            break;
        case s6:
            move = 6;
            break;
        case s7:
            move = 7;
            break;
        case s8:
            move = 8;
            break;
        case s9:
            move = 9;
            break;
        default:
            info.text = "not on my watch"
        }
        if isSpaceFree(pos: move){
            if mode == "Single Player" {
                info.text = "";
                playerMove(move:move);
            }
            else{
                playerMoveMulti(move: move, letter: letter)
                if letter == "X" {letter = "O"}
                else {letter = "X"}
            }
        }
        else if !gameOver{
            info.text = "That space is already occupied. Try another one"
        }
    }
    
    func changeButton(pos: Int, letter: String) {
        var move = UIButton();
        switch pos {
        case 1:
            move = s1;
            break;
        case 2:
            move = s2;
            break;
        case 3:
            move = s3;
            break;
        case 4:
            move = s4;
            break;
        case 5:
            move = s5;
            break;
        case 6:
            move = s6;
            break;
        case 7:
            move = s7;
            break;
        case 8:
            move = s8;
            break;
        case 9:
            move = s9;
            break;
        default:
            info.text = "nope";
        }
        move.setTitle(letter, for: UIControl.State.normal);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    

    func isSpaceFree(pos: Int) -> Bool {
        return (board[pos] == " ");
    }
    
    func isWinner(letter: String, board: Array<String>) -> Bool {
        return (((board[1] == letter && board[2] == letter && board[3] == letter) ||
            (board[4] == letter && board[5] == letter && board[6] == letter) ||
            (board[7] == letter && board[8] == letter && board[9] == letter) ||
            (board[1] == letter && board[4] == letter && board[7] == letter) ||
            (board[2] == letter && board[5] == letter && board[8] == letter) ||
            (board[3] == letter && board[6] == letter && board[9] == letter) ||
            (board[1] == letter && board[5] == letter && board[9] == letter) ||
            (board[3] == letter && board[5] == letter && board[7] == letter)))
    }
    
    func isBoardFull(board: Array<String>) -> Bool {
        var i = 1
        while (i < 10) {
            if (board[i] == " " ) {
                return false;
            }
            i += 1
        }
        return true;
    }
    
    func insertLetter(letter: String, pos: Int) {
        board[pos] = letter;
    }
    
    func playerMoveMulti(move:Int, letter: String) {
        var notLetter = String()
        if letter == "X" {notLetter = "O"}
        else {notLetter = "X"}
        
        if !gameOver {
            if (isWinner(letter: notLetter, board: board) == false){
                print("Player Move", move);
                insertLetter(letter: letter, pos: move);
                changeButton(pos: move, letter: letter);
            }
            
            for i in [letter, notLetter] {
                if isWinner(letter: i, board: board) {
                    winner.text = i + "'s win!"
                    gameOver = true
                }
            }
            print(letter,"is win", isWinner(letter: letter, board: board))
            print(notLetter,"is win", isWinner(letter: notLetter, board: board))
            print(board)
            if !isWinner(letter: letter, board: board) && !isWinner(letter: notLetter, board: board) && isBoardFull(board: board) {
                winner.text = "It's a tie"
                gameOver = true;
            }
            
            
        }
        if gameOver {
            info.text = "Press the button below to play again";
            restart.setTitle("RESTART", for: UIControl.State.normal);
        }
    }
    
    func playerMove(move: Int) {
        if !gameOver {
            if isBoardFull(board: board) == false {
                print("Player Move", move);
                if (isWinner(letter: "O", board: board) == false){
                    print("Player Move", move);
                    insertLetter(letter: "X", pos: move);
                    changeButton(pos: move, letter: "X");
                }
                
                if isWinner(letter: "X", board: board) == false {
                    let compMoveValue = compMove(board: board);
                    print("Comp Move: ", compMoveValue);
                    if compMoveValue == 0 {
                        winner.text = "It's a tie!";
                        gameOver = true;
                    }
                    else {
                        insertLetter(letter: "O", pos: compMoveValue);
                        changeButton(pos: compMoveValue, letter: "O");
                    }
                }
                    
                if isWinner(letter: "O", board: board) {
                    winner.text = "You Lose!";
                    gameOver = true;
                }
                if isWinner(letter: "X", board: board) {
                    winner.text = "You Win!";
                    gameOver = true;
                }
                
            }
        
        }
        if gameOver {
            info.text = "Press the button below to play again";
            restart.setTitle("RESTART", for: UIControl.State.normal);
        }
        
    }
    
    func compMove(board: Array<String>) -> Int{
        var possibleMoves = [Int]();
        
        var i = 1;
        while (i < 10) {
            if (board[i] == " ") {
                possibleMoves.append(i);
                print("pm", i);
            }
            i += 1;
        }
        
        
        var move = 0;
        
        print("l", level);
        switch level {
        case "Easy":
            if possibleMoves.count > 0 {
                move = selectRandom(arr: possibleMoves);
            }
            break;
        case "Medium":
            //checking if either letter can win
            for letter in ["O", "X"] {
                for i in possibleMoves {
                    var boardCopy = board;
                    boardCopy[i] = letter;
                    if (isWinner(letter: letter, board: boardCopy)) {
                        move = i;
                        print("this is the move");
                        return move;
                    }
                }
            }
            if possibleMoves.count > 0 {
                move = selectRandom(arr: possibleMoves);
            }
            break;
        case "Difficult":
            //checking if either letter can win
            for letter in ["O", "X"] {
                for i in possibleMoves {
                    var boardCopy = board;
                    boardCopy[i] = letter;
                    if (isWinner(letter: letter, board: boardCopy)) {
                        move = i;
                        print("this is the move");
                        return move;
                    }
                }
            }
            
            if (board[5] == " ") {
                move = 5;
                return move;
            }
            
            var cornersOpen = [Int]();
            for pm in possibleMoves {
                for i in [1,3,7,9] {
                    if pm == i {
                        cornersOpen.append(i);
                        print("corners", i);
                    }
                }
            }
            
            print(cornersOpen);
            
            if cornersOpen.count > 0 {
                move = selectRandom(arr: cornersOpen);
                return move;
            }
            
            var edgesOpen = [Int]();
            for pm in possibleMoves {
                for i in [2,4,6,8] {
                    if pm == i {
                        edgesOpen.append(i);
                    }
                }
            }
            if edgesOpen.count > 0 {
                move = selectRandom(arr: edgesOpen);
                return move;
            }
            break;
        default:
            print("oops");
            
        }
        return move;
    }
    
    func selectRandom(arr: Array<Int>) -> Int{
        let range = arr.count;
        print("range", range);
        let number = Int.random(in: 1 ... range)
        return arr[number - 1];
    }
}

