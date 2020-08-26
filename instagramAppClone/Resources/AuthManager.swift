//
//  AuthManager.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/26.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import FirebaseAuth

// MARK:- public
public class AuthManager {
    
    static let shared = AuthManager()
    
    // create new user funcion
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping ((Bool) -> Void)) {
        
        /*
         - check if username is available
         - check if email is available
         */
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { ( canCreate ) in
            
            if canCreate {
                
                /*
                 - Create Account
                 - Insert acount to dataase
                 */
                
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    
                    guard error != nil, result != nil else {
                        
                        completion(false)
                        return
                        
                    }
                    
                    // Insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { (inserted) in
                        
                        if inserted {
                            
                            // Firebase auth could not create account
                            completion(true)
                            
                            return
                            
                        }
                        else {
                            
                            // Failed to insert to database
                            completion(false)
                            
                            return
                            
                        }
                    }
                    
                }
                
                
            }
            else {
                
                // either username or email does not exist
                completion(false)
                
            }
            
        }
        
        
    }
    
    
    // login function
    public func loginUser(username: String?, email: String?, passWord: String, completion: @escaping ((Bool) -> Void)) {
        
        // オプショナルバインディング: emailが存在するのなら
        if let email = email {
            
            // email Log In
            Auth.auth().signIn(withEmail: email, password: passWord) { (authResult, error) in
                
                guard authResult != nil, error == nil else {
                    // error がある時
                    completion(false)
                    return
                    
                }
                
                // error が無い時の処理
                completion(true)
                
            }
            
        } else if let username = username {
            
            // username Log In
            print(username)
            
            
        }
        
        
        
        
    }
    
    
}
