//
//  HomeScreenVC.swift
//  TicTacToe
//
//  Created by Adrian Bao on 8/7/18.
//  Copyright © 2018 Adrian Bao. All rights reserved.
//

import UIKit

class HomeScreenVC: UIViewController {

    
    @IBOutlet weak var pvpButton: UIButton!
    @IBOutlet weak var pvcButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make adjustments to button
        pvpButton.layer.cornerRadius = 6
        
        pvcButton.layer.cornerRadius = 6
        
        
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

