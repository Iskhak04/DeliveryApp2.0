//
//  UserData.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 19/11/22.
//

import KeychainSwift

class UserData {
    static let shared = UserData()
    
    var email = UserDefaults.standard
    var password = KeychainSwift()
    
    private init() {
        
    }
}
