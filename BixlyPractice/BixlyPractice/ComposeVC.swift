//
//  ComposeVC.swift
//  BixlyPractice
//
//  Created by Dhruvin Gajjar on 8/2/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import UIKit
import Alamofire

class ComposeVC: UIViewController, UITextFieldDelegate {
    
    var testUser: UserManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTextField.delegate = self
        self.titleTextField.delegate = self
        self.composeMsgTextView.delegate = self as? UITextViewDelegate

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)

        
    }
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var composeMsgTextView: UITextView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sendMsgBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        sendMsg()
    }
    

    func sendMsg() {
        let parameter = ["title": titleTextField.text!, "body": composeMsgTextView.text!,"receiver": emailTextField.text!]
            Alamofire.request("https://iostest.bixly.com/messages/",method: .post, parameters: parameter, encoding: URLEncoding.default).responseJSON { response in
                //UserManager.userInstance.getUser
                let results = response.result
                if let dict = results.value as? Dictionary<String,AnyObject> {
                    print(dict)
                    if let data = dict["data"] as? String {
                        print(data)
                    }
                }
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

