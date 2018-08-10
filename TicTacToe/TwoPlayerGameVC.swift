//
//  TwoPlayerGameVC.swift
//  TicTacToe
//
//  Created by Adrian Bao on 8/8/18.
//  Copyright © 2018 Adrian Bao. All rights reserved.
//

import UIKit

class TwoPlayerGameVC: UIViewController {
    
    let playerOneIcon : String = "TTT_Icons_X.png"
    let playerTwoIcon : String = "TTT_Icons_O.png"
    
    var activePlayer : Int = 1
    
    // 0 makes the individual piece inactive, subject to change
    var board = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var isActive = true // If game is active or not (winner not yet declared)

    // Player Name Text Fields
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    
    
    var playerOneName : String = ""
    var playerTwoName : String = ""
    
    var playerOneScore : Int = 0
    var playerTwoScore : Int = 0
    
    // Counter variable since we don't need to search for a winning move until the fifth move
    var moveNumber : Int = 0
    
    // IBOutlets following the following format
    /*
            |       |
        0   |   1   |   2
     -------|-------|-------
        3   |   4   |   5
     -------|-------|-------
        6   |   7   |   8
            |       |
    */
    // Each button has tag set to their respective position
    
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
                    // X Wins
                    playerOneScore += 1
                    updateHeader()
                    showToast(message: "\(playerOneName)" + " wins!")
                } else {
                    // O Wins
                    playerTwoScore += 1
                    updateHeader()
                    showToast(message: "\(playerTwoName)" + " wins!")
                }
            }
        }
    }
    
    
    func updateHeader() {
        playerOneLabel.text = "\(playerOneName)" + ": " + "\(playerOneScore)"
        playerTwoLabel.text = "\(playerTwoName)" + ": " + "\(playerTwoScore)"
    }
    
    
    // Shows notification of winner
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Helvetica Neue", size: 18.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 5.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    
    // Winning combinations
    let winningLines = [
        [0,1,2], [3,4,5], [6,7,8], // Rows
        [0,3,6], [1,4,7], [2,5,8], // Columns
        [0,4,8], [6,4,2] // Diagonals
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateHeader()
        
        
        
    }
    
    // Back Button Methods
    @IBAction func backBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goBackToTwoPlayersSetUpVC", sender: self)
    }

    
    // Reset Button Methods
    @IBAction func resetBtnPressed(_ sender: AnyObject) {
        // Reset board
        board = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        isActive = true
        activePlayer = 1
        
        for i in 1...9 {
            let btn = view.viewWithTag(i) as! UIButton
            btn.setImage(nil, for: UIControlState())
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
