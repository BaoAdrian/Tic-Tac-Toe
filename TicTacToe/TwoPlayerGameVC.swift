//
//  TwoPlayerGameVC.swift
//  TicTacToe
//
//  Created by Adrian Bao on 8/8/18.
//  Copyright © 2018 Adrian Bao. All rights reserved.
//

import UIKit

class TwoPlayerGameVC: UIViewController {
    
    let DEFAULT_FIRST_PLAYER : Int = 1
    
    let playerOneIcon : String = "TTT_Icons_X.png"
    let playerTwoIcon : String = "TTT_Icons_O.png"
    
    // Default to have player one go first
    var activePlayer : Int = 0
    var playerToGoFirst : Int = 0
    
    // 0 - inactive
    var board = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var isActive = true
    
    let winningLines = [
        [0,1,2], [3,4,5], [6,7,8], // Rows
        [0,3,6], [1,4,7], [2,5,8], // Columns
        [0,4,8], [6,4,2] // Diagonals
    ]

    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    
    var playerOneName : String = ""
    var playerTwoName : String = ""
    
    var playerOneScore : Int = 0
    var playerTwoScore : Int = 0
    
    // Buttons assigned with tags as follows
    /*
            |       |
        1   |   2   |   3
     -------|-------|-------
        4   |   5   |   6
     -------|-------|-------
        7   |   8   |   9
            |       |
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        determineFirstMove()
        updateHeader()
    }
    
    // When a section (button) is pressed, sets Icon image and updates active player
    @IBAction func btnPressed(_ sender: AnyObject) {
        
        if board[sender.tag - 1] == 0 && isActive == true {
            // Set board to update to whichever active player selected place on board
            board[sender.tag - 1] = activePlayer
            if activePlayer == 1 {
                sender.setImage(UIImage(named: playerOneIcon), for: .normal)
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: playerTwoIcon), for: .normal)
                activePlayer = 1
            }
        }
        
        // Check if board has a winner
        for line in winningLines {
            if board[line[0]] != 0 && board[line[0]] == board[line[1]] && board[line[1]] == board[line[2]] {
                // Winner, make game inactive, declare a winner
                isActive = false
                if board[line[0]] == 1 {
                    // Player one wins
                    playerOneScore += 1
                    showPopUpMessage(declaredWinner: "\(playerOneName)" + " wins!")
                    updateHeader()
                    
                } else {
                    // Player two wins
                    playerTwoScore += 1
                    showPopUpMessage(declaredWinner: "\(playerTwoName)" + " wins!")
                    updateHeader()
                }
            }
        }
        
        isActive = false
        
        for i in board {
            if i == 0 {
                isActive = true
                break
            }
        }
        
        if isActive == false {
            // Tie occurred
            showPopUpMessage(declaredWinner: "It's a tie!")
        }
    }
    
    
    func determineFirstMove() {
        if playerToGoFirst != 1 && playerToGoFirst != 2 {
            activePlayer = DEFAULT_FIRST_PLAYER
        } else {
            activePlayer = playerToGoFirst
        }
    }
    
    func updateHeader() {
        playerOneLabel.text = "\(playerOneName)" + ": " + "\(playerOneScore)"
        playerTwoLabel.text = "\(playerTwoName)" + ": " + "\(playerTwoScore)"
    }
    
    
    
    // Back Button Methods
    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    
    // Reset Button Methods
    @IBAction func resetBtnPressed(_ sender: AnyObject) {
        playerOneScore = 0
        playerTwoScore = 0
        clearBoard()
        showToast(message: "Game Reset!")
        updateHeader()
    }
    
    func showPopUpMessage(declaredWinner : String) {
        let alert = UIAlertController(title: "Results", message: declaredWinner, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { action in
            self.clearBoard()
        }))
        
        self.present(alert, animated: true)
    }
    
    func clearBoard() {
        board = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        isActive = true
        
        for i in 1...9 {
            let btn = view.viewWithTag(i) as! UIButton
            btn.setImage(nil, for: UIControlState())
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Helvetica Neue", size: 16.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }


}
