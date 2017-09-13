//
//  AddEventVC.swift
//  focusFirebaseChallenge
//
//  Created by Dhruvin Gajjar on 7/13/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import UIKit
import Firebase

class AddEventVC: UIViewController, UITextFieldDelegate {

    var refEvents: DatabaseReference!
    
    var event: Event? = nil
    var titleText = "Add Event"
    var indexPathForEvent: IndexPath? = nil
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var imageDisplay: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refEvents = Database.database().reference().child("events")
        
        titleLbl.text = titleText
        self.nameTextField.delegate = self
        self.priceTextField.delegate = self
        self.addressTextField.delegate = self
        //set current date and time as minimum date for the picker
        datePicker.minimumDate = NSDate() as Date
        datePicker.locale = NSLocale.current
        /*
        if let event = event {
            nameTextField.text = event.name
            priceTextField.text = event.price
            addressTextField.text = event.address
        }*/
        
        
    }
    @IBAction func save(_ sender: UIBarButtonItem) {
        addEvents()
    }
    
    func addEvents() {
        let key = refEvents.childByAutoId().key
        
        let events = ["id": key, "eventName": nameTextField.text! as String, "eventPrice": priceTextField.text! as String, "eventAddress": addressTextField.text! as String]
        
        refEvents.child(key).setValue(events)
        titleLbl.text = "Event Added"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkName() {
        //Disable save button if text field is empty
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
        
    }
    
    func checkDate() {
        //Disable save button if the date in the date picker has passed
        if NSDate().earlierDate(datePicker.date) == datePicker.date {
            saveButton.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkName()
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        navigationItem.title = nameTextField.text
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        checkDate()
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if saveButton === sender as AnyObject?{
            let name = nameTextField.text
            var date = datePicker.date
            let dateInterval = floor(date.timeIntervalSinceReferenceDate/60) * 60 //Time in minutes
            date = NSDate(timeIntervalSinceReferenceDate: dateInterval) as Date
            let price = priceTextField.text
            let address = addressTextField.text
            //imageview not set yet
            
            //build a notification to pass to system
            let notification = UILocalNotification()
            notification.alertTitle = "Event"
            notification.alertBody = "Don't forget to \(name!)!"
            notification.fireDate = date
            notification.soundName = UILocalNotificationDefaultSoundName
            
            UIApplication.shared.scheduleLocalNotification(notification)
            
            event = Event(name: name!, price: price!, address: address!, date: date as NSDate, notification: notification)
        }
        
        
    }
 

}
