//
//  TwoPlayerGameVC.swift
//  TicTacToe
//
//  Created by Adrian Bao on 8/8/18.
//  Copyright © 2018 Adrian Bao. All rights reserved.
//

import UIKit

class TwoPlayerGameVC: UIViewController {

    // Player Name Text Fields
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    
    var playerOneName : String = ""
    var playerTwoName : String = ""
    
    var playerOneScore : Int = 0
    var playerTwoScore : Int = 0
    
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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goBackToTwoPlayersSetUpVC" {
//            // No necessary processes, Xcode performs segue
//        }
//    }
    
    
    
    // Undo Button Methods
    
    
    
    
    // Reset Button Methods
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
