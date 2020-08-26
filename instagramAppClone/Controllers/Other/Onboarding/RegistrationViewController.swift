//
//  RegistrationViewController.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/25.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    // MARK:- Outlet
    private let usernameTextField: UITextField = {
       
        userTextField.textFieldSetting(placeholder: "username...", returnKeyType: .next)
        
    }()
    
    private let emailTextField: UITextField = {
        
        userTextField.textFieldSetting(placeholder: "email...", returnKeyType: .next)
        
    }()
    
    private let passwordTextField: UITextField = {
        
        userTextField.textFieldSetting(placeholder: "password", returnKeyType: .continue)
        
    }()

    
    // MARK:- display
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        addSubViews()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        usernameTextField.frame = CGRect(x: 25, y: view.safeAreaInsets.top + 20, width: view.width - 50, height: 52)
        emailTextField.frame = CGRect(x: 25, y: usernameTextField.bottom + 10, width: view.width - 50, height: 52)
        passwordTextField.frame = CGRect(x: 25, y: emailTextField.bottom + 10, width: view.width - 50, height: 52)
        
        
    }
    
    // MARK:- add outlet to view
    
    private func addSubViews() {
        
        view.addSubview(usernameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        
    }
    
    // MARK:- tapped function

}

// MARK: - keybord behavior
