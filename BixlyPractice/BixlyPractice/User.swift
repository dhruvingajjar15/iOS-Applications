//
//  User.swift
//  BixlyPractice
//
//  Created by Dhruvin Gajjar on 7/28/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import Foundation


class User {
    
   private var _username : String!
   private var _password: String!
   private var _token: String!
    
    //static let testUserInstance = User(username: "", password: "", token: "")
    
    var username: String {
        return _username
    }
    
    var password: String {
        return _password
    }
    
    var token: String {
        return _token
    }
    
    func setUsername(userName: String) -> Void {
        self._username = userName
    }
    
    func setPassword(password: String) -> Void {
        self._password = password
    }
    
    func setToken(token: String) -> Void {
        self._token = token
    }
    
    init() {}
    
    /*private init() {}*/
    
    /*init(username: String, password: String, token: String) {
        self._username = username
        self._password = password
        self._token = token
    }*/
    
}
