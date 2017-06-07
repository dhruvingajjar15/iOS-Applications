//
//  Location.swift
//  rainyshinycloudy
//
//  Created by Dhruvin on 6/6/17.
//  Copyright © 2017 Dhruvin. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    
}
