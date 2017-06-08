//
//  ViewController.swift
//  Beacon Demo
//
//  Created by Dhruvin on 6/7/17.
//  Copyright © 2017 Dhruvin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: Selector(("iBeaconFoundReceivedNotification:")), name: NSNotification.Name(rawValue: "iBeaconFoundReceivedNotification"), object: nil)
    }
    
    func iBeaconFoundReceivedNotification(notification: NSNotification){
        
        //Take action from notification
        if let userInfo = notification.userInfo as? Dictionary<String, AnyObject> {
            
            let major = userInfo["major"]
            let minor = userInfo["minor"]
            
            let messageInfo = "Major=\(major) Minor=\(minor)"
            
            let alert = UIAlertController(title: "iBeacon Found", message: messageInfo, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }


}

