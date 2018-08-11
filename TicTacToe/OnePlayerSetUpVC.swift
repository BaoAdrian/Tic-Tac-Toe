//
//  OnePlayerSetUpVC.swift
//  TicTacToe
//
//  Created by Adrian Bao on 8/10/18.
//  Copyright © 2018 Adrian Bao. All rights reserved.
//

import UIKit

class OnePlayerSetUpVC: UIViewController {

    let PLAYER_ONE : String = "Player 1"
    
    var playerOneName : String = ""
    
    @IBOutlet weak var playerOneTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func startBtnPressed(_ sender: UIButton) {
        // Following if-lets protects against user defaulting names
        if let name = playerOneTF.text, !name.isEmpty {
            self.playerOneName = name
        } else {
            self.playerOneName = PLAYER_ONE
        }
        
        performSegue(withIdentifier: "goToOnePlayerGameVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOnePlayerGameVC" {
            let destinationVC = segue.destination as! OnePlayerGameVC
            
            destinationVC.playerOneName = self.playerOneName
        }
    }
    
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   

}
