//
//  ViewController.swift
//  sphereSwiftChallenge
//
//  Created by Dhruvin Gajjar on 7/17/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var streetAddress: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zipcode: UITextField!
    
    var details = [Details]()
    
    
    @IBAction func clickToJSON(_ sender: Any) {
        if firstName.text != "", lastName.text != "", streetAddress.text != "", city.text != "", state.text != "", zipcode.text != "" {
            let dic = Details(firstName: firstName.text!, lastName: lastName.text!, streetAddress: streetAddress.text!, city: city.text!, state: state.text!, zipcode: zipcode.text!)
            let json = dic.convertToDictionary()
            
            if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                let jsonText = String(data: jsonData, encoding: .utf8)
                print("Details \(jsonText!)")
            }
        }
    }
    
    let location = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemark, error) in
            if error != nil {
                print("There was an error")
            }
            else {
                if let place = placemark?[0] {
                    
                    if let checker = place.region {
                    
                        self.city.text = "\(place.locality!)"
                        self.state.text = "\(place.administrativeArea!)"
                        self.zipcode.text = "\(place.postalCode!)"
                    }
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        location.delegate = self
        location.desiredAccuracy = kCLLocationAccuracyBest
        location.requestWhenInUseAuthorization()
        location.startUpdatingLocation()
        
    }
    
}

