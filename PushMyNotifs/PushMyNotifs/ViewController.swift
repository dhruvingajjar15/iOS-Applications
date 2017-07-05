//
//  ViewController.swift
//  pushmynotifs
//
//  Created by Dhruvin Gajjar on 7/5/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import UIKit
import Firebase
import FirebaseInstanceID
import FirebaseMessaging

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            Messaging.messaging().subscribe(toTopic: "/topics/news")
        
    }

   


}

