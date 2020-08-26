//
//  DatabaseManager.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/26.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import FirebaseDatabase

// MARK:- public
public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    /// check if username and email is available
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        
        completion(true)
        
    }
    
    /// Inserts new User data and email  to database
    
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        
        // ここで[.], [@]を[-]に置き換えている
        let key = email.safeDatabaseKey()
        
        database.child(key).setValue(["username": username]) { error, _ in
            
            if error == nil {
                
                completion(true)
                return
                
            }
            else {
                
                completion(false)
                return 
            }
            
        }
        
        
        
        
    }
}
