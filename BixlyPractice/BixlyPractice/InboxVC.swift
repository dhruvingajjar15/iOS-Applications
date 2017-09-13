//
//  InvoxVC.swift
//  BixlyPractice
//
//  Created by Dhruvin Gajjar on 8/2/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import UIKit
import Alamofire

class InboxVC: UIViewController {

    @IBAction func clickToComposeMsg(_ sender: Any) {
        performSegue(withIdentifier: "composeMsg", sender: self)
    }
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func loadMsg() {
        
                
        
    }
    
}
