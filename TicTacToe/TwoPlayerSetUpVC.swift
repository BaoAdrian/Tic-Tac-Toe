//
//  TwoPlayerSetUpVC.swift
//  TicTacToe
//
//  Created by Adrian Bao on 8/8/18.
//  Copyright © 2018 Adrian Bao. All rights reserved.
//

import UIKit

protocol UpdatePlayerNamesDelegate {
    func setPlayerNames(playerOne : String, playerTwo : String)
}

class TwoPlayerSetUpVC: UIViewController {
    
    let PLAYER_ONE : String = "Player 1"
    let PLAYER_TWO : String = "Player 2"

    var delegate : UpdatePlayerNamesDelegate?
    
    // Editable TextFields to hold players names - Will have default values
    @IBOutlet weak var playerOneTF: UITextField!
    @IBOutlet weak var playerTwoTF: UITextField!
    
    var playerOneName : String = ""
    var playerTwoName : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    


    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
        if let name = playerOneTF.text {
            self.playerOneName = name
        } else {
            self.playerOneName = PLAYER_ONE
        }
        
        if let name = playerTwoTF.text {
            self.playerTwoName = name
        } else {
            self.playerTwoName = PLAYER_TWO
        }
        
        delegate?.setPlayerNames(playerOne: playerOneName, playerTwo: playerTwoName)
        
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
