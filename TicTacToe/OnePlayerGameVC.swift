//
//  OnePlayerGameVC.swift
//  TicTacToe
//
//  Created by Adrian Bao on 8/10/18.
//  Copyright © 2018 Adrian Bao. All rights reserved.
//

import UIKit

class OnePlayerGameVC: UIViewController {
    
    let playerOneIcon : String = "TTT_Icons_X.png"
    let computerIcon : String = "TTT_Icons_O.png"

    var playerOneName : String = ""
    
    var playerOneScore : Int = 0
    var computerScore : Int = 0
    
    var board = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var isActive = true
    var activePlayer = 1
    
    let winningLines = [
        [0,1,2], [3,4,5], [6,7,8], // Rows
        [0,3,6], [1,4,7], [2,5,8], // Columns
        [0,4,8], [6,4,2] // Diagonals
    ]
    
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var computerLabel: UILabel!
    
    // Establish AI for Computer
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateHeader()
    }
    
    
    @IBAction func resetBtnPressed(_ sender: UIButton) {
        playerOneScore = 0
        computerScore = 0
        clearBoard()
        updateHeader()
    }
    
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func btnPressed(_ sender: AnyObject) {
        if board[sender.tag - 1] == 0 && isActive == true {
            // Set board to update to whichever active player selected place on board
            board[sender.tag - 1] = activePlayer
            if activePlayer == 1 {
                sender.setImage(UIImage(named: playerOneIcon), for: .normal)
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: computerIcon), for: .normal)
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
                    // Computer Wins
                    computerScore += 1
                    showPopUpMessage(declaredWinner: "Computer wins!")
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
    
    
    
    func clearBoard() {
        board = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        isActive = true
        activePlayer = 1
        
        for i in 1...9 {
            let btn = view.viewWithTag(i) as! UIButton
            btn.setImage(nil, for: UIControlState())
        }
    }
    
    
    func updateHeader() {
        playerOneLabel.text = "\(playerOneName)" + ": " + "\(playerOneScore)"
        computerLabel.text = "Computer: " + "\(computerScore)"
    }
    
    
    func showPopUpMessage(declaredWinner : String) {
        let alert = UIAlertController(title: "Results", message: declaredWinner, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { action in
            self.clearBoard()
        }))
        
        self.present(alert, animated: true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
