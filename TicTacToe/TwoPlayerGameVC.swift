//
//  twoPlayerGameVC.swift
//  TicTacToe
//
//  Created by Adrian Bao on 8/8/18.
//  Copyright © 2018 Adrian Bao. All rights reserved.
//

import UIKit

class TwoPlayerGameVC: UIViewController, UpdatePlayerNamesDelegate {

    // Player Name Text Fields
    @IBOutlet weak var playerOneLabel: UILabel!
    @IBOutlet weak var playerTwoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    func setPlayerNames(playerOne: String, playerTwo: String) {
        playerOneLabel.text = playerOne
        playerTwoLabel.text = playerTwo
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
