//
//  PersonDetails.swift
//  sphereSwiftChallenge
//
//  Created by Dhruvin Gajjar on 7/17/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import Foundation
import UIKit

class Details: NSObject {
    
    //Properties
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipcode: String
    
    //Enum for property keys
    struct PropertyKey {
        static let firstNameKey = "firstName"
        static let lastNameKey = "lastName"
        static let streetAddressKey = "streetAddress"
        static let cityKey = "city"
        static let stateKey = "state"
        static let zipcodeKey = "zipcode"
    }
    
    //Initializer
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipcode: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipcode = zipcode
        
        super.init()
    }

    func convertToDictionary() -> [String : String] {
        let dic: [String : String] = ["firstName": self.firstName, "lastName": self.lastName, "streetAddress": self.streetAddress, "city": self.city, "state": self.state, "zipcode": self.zipcode]
        return dic
    }
    
}
