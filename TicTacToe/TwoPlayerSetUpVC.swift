//
//  TwoPlayerSetUpVC.swift
//  TicTacToe
//
//  Created by Adrian Bao on 8/8/18.
//  Copyright © 2018 Adrian Bao. All rights reserved.
//

import UIKit



class TwoPlayerSetUpVC: UIViewController {
    
    let PLAYER_ONE : String = "Player 1"
    let PLAYER_TWO : String = "Player 2"

    var playerOneName : String = ""
    var playerTwoName : String = ""
    
    // Tag the first player
    var playerToGoFirst : Int = 0
    
    @IBOutlet weak var playerOneTF: UITextField!
    @IBOutlet weak var playerTwoTF: UITextField!
    
    // Tagged 1 and 2
    @IBOutlet weak var iconX: UIButton!
    @IBOutlet weak var iconO: UIButton!
    
    // Default has x moving first, if false, O moves first
    var xIsSelected : Bool = false
    var oIsSelected : Bool = false
    
    @IBOutlet weak var startBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func startBtnPressed(_ sender: Any) {
        
        // Following if-lets protects against user defaulting names
        if let name = playerOneTF.text, !name.isEmpty {
            self.playerOneName = name
        } else {
            self.playerOneName = PLAYER_ONE
        }
        
        if let name = playerTwoTF.text, !name.isEmpty {
            self.playerTwoName = name
        } else {
            self.playerTwoName = PLAYER_TWO
        }
        
        performSegue(withIdentifier: "goToTwoPlayerGameVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTwoPlayerGameVC" {
            let destinationVC = segue.destination as! TwoPlayerGameVC
            
            destinationVC.playerOneName = self.playerOneName
            destinationVC.playerTwoName  = self.playerTwoName
            
            destinationVC.playerToGoFirst = self.playerToGoFirst
        }
    }
    
    // Work in progress
    @IBAction func iconBtnPressed(_ sender: UIButton) {
        
        if sender.isSelected == false {
            
            // Not currently selected, find which one is pressed and update image
            sender.isSelected = true // Now selected
            if sender.tag == 1 {
                // X has been selected
                playerToGoFirst = 1
                sender.setImage(UIImage(named: "TTT_Icon_X_Selected.png"), for: .normal)
            } else if sender.tag == 2 {
                // O has been selected
                playerToGoFirst = 2
                sender.setImage(UIImage(named: "TTT_Icon_O_Selected.png"), for: .normal)
            }
            
        } else if sender.isSelected == true {
            
            // Currently selected, find which one is pressed and update image
            sender.isSelected = false // No longer selected
            if sender.tag == 1 {
                // X has been deselected
                sender.setImage(UIImage(named: "TTT_Icon_X_No_BG.png"), for: .normal)
            } else if sender.tag == 2 {
                // O has been deselected
                sender.setImage(UIImage(named: "TTT_Icon_O_No_BG.png"), for: .normal)
            }
            
        }
        
        // Work in progress to not allow user to select both at the same time - it's a mess atm
//        if xIsSelected == false && oIsSelected == false {
//            // None currently selected, OK to assign a selected image
//            if sender.isSelected == false {
//                sender.isSelected = true
//                if sender.tag == 1 {
//                    xIsSelected = true
//                    sender.setImage(UIImage(named: "TTT_Icon_X_Selected.png"), for: UIControlState.normal)
//                } else if sender.tag == 2 {
//                    oIsSelected = true
//                    sender.setImage(UIImage(named: "TTT_Icon_O_Selected.png"), for: UIControlState.normal)
//                }
//            } else {
//                sender.isSelected = false
//                if sender.tag == 1 {
//                    xIsSelected = false
//                    sender.setImage(UIImage(named: "TTT_Icon_X_No_BG.png"), for: UIControlState.normal)
//                } else if sender.tag == 2 {
//                    oIsSelected = false
//                    sender.setImage(UIImage(named: "TTT_Icon_O_No_BG.png"), for: UIControlState.normal)
//                }
//            }
//        } else if xIsSelected == true && oIsSelected == false {
//            if sender.isSelected == false {
//                sender.isSelected = true
//                if sender.tag == 1 {
//                    xIsSelected = true
//                    sender.setImage(UIImage(named: "TTT_Icon_X_No_BG.png"), for: UIControlState.normal)
//                } else if sender.tag == 2 {
//                    // Do nothing since the X is already selected
//                }
//            } else if sender.isSelected == false {
//                sender.isSelected = false
//                if sender.tag == 1 {
//                    xIsSelected = false
//                    sender.setImage(UIImage(named: "TTT_Icon_X_No_BG.png"), for: UIControlState.normal)
//                } else if sender.tag == 2 {
//                    oIsSelected = false
//                    sender.setImage(UIImage(named: "TTT_Icon_O_No_BG.png"), for: UIControlState.normal)
//                }
//            }
//        }
        
        
        
        
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
