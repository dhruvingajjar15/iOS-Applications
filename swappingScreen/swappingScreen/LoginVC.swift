//
//  ViewController.swift
//  swappingScreen
//
//  Created by Gajjar, Dhruvin Pankajkumar on 3/16/17.
//  Copyright © 2017 Gajjar, Dhruvin Pankajkumar. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func loginNow(_ sender: Any) {
        
        if (userNameText.text?.isEmpty)! || (passwordText.text?.isEmpty)! {
            let alert = UIAlertController(title: "Login Error", message: "Please enter your username and password to login", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameText.delegate = self
        passwordText.delegate = self
        
    }

    

}

