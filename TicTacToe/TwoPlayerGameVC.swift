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
        if activePlayer == 1 {
            sender.setImage(UIImage(named: playerOneIcon), for: .normal)
            activePlayer = 2
        } else {
            sender.setImage(UIImage(named: playerTwoIcon), for: .normal)
            activePlayer = 1
        }
    }
    
    
    // Winning combinations
    let winningLines = [
        [0,1,2], [3,4,5], [6,7,8], // Rows
        [0,3,6], [1,4,7], [2,5,8], // Columns
        [0,4,8], [6,4,2] // Diagonals
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update Labels with names passed from previous page
        playerOneLabel.text = "\(playerOneName)" + ": " + "\(playerOneScore)"
        playerTwoLabel.text = "\(playerTwoName)" + ": " + "\(playerTwoScore)"
        
        
        
    }
    
    // Back Button Methods
    @IBAction func backBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goBackToTwoPlayersSetUpVC", sender: self)
    }

    
    
    
    // Undo Button Methods
    
    
    
    
    // Reset Button Methods
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
