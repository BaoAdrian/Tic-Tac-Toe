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
    
    // Editable TextFields to hold players names - Will have default values
    @IBOutlet weak var playerOneTF: UITextField!
    @IBOutlet weak var playerTwoTF: UITextField!
    
    @IBOutlet weak var startBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        }
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
