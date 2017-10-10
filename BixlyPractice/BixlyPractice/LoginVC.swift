//
//  LoginVC.swift
//  BixlyPractice
//
//  Created by Dhruvin Gajjar on 7/27/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import UIKit
import Alamofire

class LoginVC: UIViewController, UITextFieldDelegate {
    
    var testUser = User()
    var newUser = User()

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameText.delegate = self
        self.passwordText.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    func loginAuth() -> Bool {
        
        let parameter = ["username": usernameText.text!, "password" : passwordText.text!]
        
        Alamofire.request("https://iostest.bixly.com/api-token-auth/",method: .post, parameters: parameter, encoding: URLEncoding.default).responseJSON { response in
            print("Success: \(response.result.isSuccess)")
            print("Response String: \(String(describing: response.result.value)))")
            let result = response.result
            if let dict = result.value as? Dictionary<String,AnyObject> {
                if let token = dict["token"] as? String {
                    self.testUser.setToken(token: token)
                    print(self.testUser.token)
                }
                else if let array = dict["non_field_errors"] as? [String] {
                    if let errToken = array[0] as? String {
                        self.testUser.setToken(token: errToken)
                        print(self.testUser.token)
                    }
                }
            }
            
            
            
            self.testUser.setUsername(userName: self.usernameText.text!)
            self.testUser.setPassword(password: self.passwordText.text!)
            
            UserManager.userInstance.setUser(user: self.testUser)
            
            //Setting the value
            UserDefaults.standard.set(self.testUser.username, forKey: "username")
            UserDefaults.standard.synchronize() //With this the value get save on device
            UserDefaults.standard.set(self.testUser.password, forKey: "password")
            UserDefaults.standard.synchronize() //With this the value get save on device
            UserDefaults.standard.set(self.testUser.token, forKey: "token")
            UserDefaults.standard.synchronize()//With this the value get save on device
            
            
            
            //getting the value
            
            /*let usernameDefault = UserDefaults.standard
            let userNameDefault = usernameDefault.value(forKey: "username")!
            self.newUser.setUsername(userName: "\(userNameDefault)")
            print("\(String(describing: userNameDefault))")
            let passwordDefault = UserDefaults.standard
            let passWordDefault = passwordDefault.value(forKey: "password")!
            self.newUser.setPassword(password: "\(passWordDefault)")
            print("\(String(describing: passWordDefault))")
            let tokenDefault = UserDefaults.standard
            let tokeNDefault = tokenDefault.value(forKey: "token")!
            self.newUser.setToken(token: tokeNDefault as! String)
            print("\(String(describing: tokeNDefault))")
            
            let newUsrName = self.newUser.username
            let newPswd = self.newUser.password
            let newTokn = self.newUser.token
            print("\(newUsrName)", "\(newPswd)", "\(newTokn)")*/

            
            
            
            if let httpError = response.result.error {
                let statusCode = httpError.localizedDescription
                print(statusCode)
            }else {
                let statusCode = (response.response?.statusCode)!
                print(statusCode)
                
            }
            
        }
        return false
        
    }

    
    @IBAction func loginBtn(_ sender: UIButton) {
        
        
        if usernameText.text! != "" && passwordText.text! != "" {
            if loginAuth() == false {
                let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let rootVC = mainStoryBoard.instantiateViewController(withIdentifier: "tabBar") as! MainVC
                UIApplication.shared.keyWindow?.rootViewController = rootVC
                
            }else {
                /*let alert = UIAlertController(title: "Alert", message: "Please enter valid username or password", preferredStyle: UIAlertControllerStyle.alert)
                let dismiss = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) {(action: UIAlertAction!) in print("Ok button pressed")}
                alert.addAction(dismiss)
                self.present(alert, animated: true, completion: nil)*/
                print("This shit is going to else Why you do this to me")

            }
        }
        
        /*else if {
            let alert = UIAlertController(title: "Alert", message: "Please enter valid username or password", preferredStyle: UIAlertControllerStyle.alert)
            let dismiss = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) {(action: UIAlertAction!) in print("Ok button pressed")}
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        }*/
        else {
            let alert = UIAlertController(title: "Alert", message: "Please enter your username or password", preferredStyle: UIAlertControllerStyle.alert)
            let dismiss = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) {(action: UIAlertAction!) in print("Ok button pressed")}
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        }
    }

    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    
    
}

