//
//  AddPlayerVC.swift
//  focusSwiftChallenge
//
//  Created by Dhruvin Gajjar on 7/12/17.
//  Copyright © 2017 Dhruvi Gajjar. All rights reserved.
//

import UIKit
import CoreData

class AddPlayerVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var countryText: UITextField!
    @IBOutlet weak var heightText: UITextField!
    @IBOutlet weak var weightText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var titleLbl: UILabel!
    
    var player: NSManagedObject? = nil
    var indexPathForPlayer: IndexPath? = nil
    let pickerView = UIPickerView()
    var titleText = "Add Player Details"
    var country = ["🇫🇷", "🇩🇪", "🇺🇸", "🇪🇸", "🇦🇺"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        countryText.inputView = pickerView
        titleLbl.text = titleText
        if let player = self.player {
            nameText.text = player.value(forKey: "name") as? String
            countryText.text = player.value(forKey: "country") as? String
            ageText.text = player.value(forKey: "age") as? String
            heightText.text = player.value(forKey: "height") as? String
            weightText.text = player.value(forKey: "weight") as? String
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.nameText.resignFirstResponder()
        self.heightText.resignFirstResponder()
        self.weightText.resignFirstResponder()
        self.ageText.resignFirstResponder()
        self.countryText.resignFirstResponder()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return country.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return country[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryText.text = country[row]
        self.view.endEditing(false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindToPlayerList", sender: self)
    }
    
    
    @IBAction func closeButton(_ sender: UIButton) {
        nameText.text = nil
        countryText.text = nil
        ageText.text = nil
        heightText.text = nil
        weightText.text = nil
        
        performSegue(withIdentifier: "unwindToPlayerList", sender: self)
    }
    
    
}
