//
//  DatabaseManager.swift
//  DeliveryApp2.0
//
//  Created by Iskhak Zhutanov on 30/11/22.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    private init() {
        
    }
}

extension DatabaseManager {
    
    public func safeEmail(email: String) -> String {
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        
        return safeEmail
    }
    
    public func userExists(email: String, completion: @escaping ((Bool) -> Void)) {
        
        database.child(safeEmail(email: email)).observeSingleEvent(of: .value) { snapshot in
            guard snapshot.value as? String != nil else {
                completion(false)
                return
            }
            
            completion(true)
        }
    }
    
    public func addNewUser(email: String, name: String) {
        database.child(safeEmail(email: email)).setValue(["first_name": name])
    }
}
