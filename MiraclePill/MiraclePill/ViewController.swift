//
//  ViewController.swift
//  MiraclePill
//
//  Created by Gajjar, Dhruvin Pankajkumar on 3/14/17.
//  Copyright © 2017 Gajjar, Dhruvin Pankajkumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate  {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var statePicker: UIPickerView!
    
    @IBOutlet weak var statePickerBtn: UIButton!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var countryText: UITextField!
    
    @IBOutlet weak var zipCodeLabel: UILabel!
    
    @IBOutlet weak var zipCodeText: UITextField!
    
    @IBAction func buyNowBtn(_ sender: Any) {
        
        if (nameTextField.text?.isEmpty)! || (addressTextField.text?.isEmpty)! || (cityTextField.text?.isEmpty)! || (countryText.text?.isEmpty)! || (zipCodeText.text?.isEmpty)! {
            let alert = UIAlertController(title: "Alert", message: "Please enter all your details to continue", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
        
        for view in self.view.subviews as [UIView] {
            view.isHidden = true
            successImage.isHidden = false
        }
    }
 }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBOutlet weak var successImage: UIImageView!
    
    let states = ["Alaska", "Arkansas", "Alabama", "California", "Maine", "New York"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
        successImage.isHidden = true
        nameTextField.delegate = self
        addressTextField.delegate = self
        cityTextField.delegate = self
        countryText.delegate = self
        zipCodeText.delegate = self
        statePickerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
        countryLabel.isHidden = false
        countryText.isHidden = false
        zipCodeLabel.isHidden = false
        zipCodeText.isHidden = false
    }

    @IBAction func stateBtnPressed(_ sender: Any) {
        
        statePicker.isHidden = false
        countryLabel.isHidden = true
        countryText.isHidden = true
        zipCodeLabel.isHidden = true
        zipCodeText.isHidden = true
        
    }

}

