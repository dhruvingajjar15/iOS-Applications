//
//  Event.swift
//  focusFirebaseChallenge
//
//  Created by Dhruvin Gajjar on 7/13/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import Foundation
import UIKit

class Event:NSObject, NSCoding {
    //Properties
    var notification: UILocalNotification
    var name: String
    var price: String
    var address: String
    var date: NSDate
    //var image: String
    
    //Archive paths for persistent Data
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("events")
    
    //enum for property keys
    struct PropertyKey {
        static let nameKey = "name"
        static let priceKey = "price"
        static let addressKey = "address"
        static let notificationKey = "notifications"
        //static let imageKey = "image"
        static let dateKey = "date"
    }
    
    //Initializer
    init(name: String, price: String, address: String, date: NSDate, notification: UILocalNotification) {
        self.name = name
        self.price = price
        self.address = address
        self.date = date
        self.notification = notification
        //self.image = image
        
        super.init()
    }
    
    //Destructor
    deinit {
        //cancel notification
        UIApplication.shared.cancelLocalNotification(self.notification)
    }
    
    //NSCodingProtocol
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(price, forKey: PropertyKey.priceKey)
        aCoder.encode(address, forKey: PropertyKey.addressKey)
        aCoder.encode(date, forKey: PropertyKey.dateKey)
        aCoder.encode(notification, forKey: PropertyKey.notificationKey)
        //aCoder.encode(image, forKey: PropertyKey.imageKey)
    }
    
    //Required means any subclasses are required to have the same initializer
    //Convenience means it handles if we want to pass a different set of parameter
    required convenience init(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        let price = aDecoder.decodeObject(forKey: PropertyKey.priceKey) as! String
        let address = aDecoder.decodeObject(forKey: PropertyKey.addressKey) as! String
        let date = aDecoder.decodeObject(forKey: PropertyKey.dateKey) as! NSDate
        let notification = aDecoder.decodeObject(forKey: PropertyKey.notificationKey) as! UILocalNotification
        //let image = aDecoder.decodeObject(forKey: PropertyKey.imageKey) as! String
        
        self.init(name: name, price: price, address: address, date: date, notification: notification)
    }
}








