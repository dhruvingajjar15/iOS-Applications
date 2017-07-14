//
//  ArtistModel.swift
//  FIRDBExample
//
//  Created by Dhruvin Gajjar on 7/14/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import Foundation

class artistModel {
    var id: String?
    var name: String?
    var genre: String?
    
    init(id: String?, name: String?, genre: String?) {
        self.id = id
        self.name = name
        self.genre = genre
    }
}
