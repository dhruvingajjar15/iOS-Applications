//
//  UserManager.swift
//  BixlyPractice
//
//  Created by Dhruvin Gajjar on 7/28/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import Foundation


class UserManager {
    
    static let userInstance = UserManager()
    
    var _user = User()
    
    
    private init() { }

    var getUser: User {
        return _user
    }
    
    func setUser( user: User) -> Void {
        self._user = user
    }
    
}
