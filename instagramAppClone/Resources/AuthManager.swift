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
