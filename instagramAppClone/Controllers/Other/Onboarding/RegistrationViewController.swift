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
    
    // button
    private let registerButton: UIButton = {
        
        buttonObject.objectButtonSetting(titleString: "New resigter", titleColor: .white, backgroundColor: .systemBlue)
        
    }()
    
    // MARK:- display
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
        
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        addSubViews()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        usernameTextField.frame = CGRect(x: 25, y: view.safeAreaInsets.top + 20, width: view.width - 50, height: 52)
        emailTextField.frame = CGRect(x: 25, y: usernameTextField.bottom + 10, width: view.width - 50, height: 52)
        passwordTextField.frame = CGRect(x: 25, y: emailTextField.bottom + 10, width: view.width - 50, height: 52)
        
        registerButton.frame = CGRect(x: 25, y: passwordTextField.bottom + 10, width: view.width - 50, height: 52)
        
        
    }
    
    // MARK:- add outlet to view
    
    private func addSubViews() {
        
        view.addSubview(usernameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        
        view.addSubview(registerButton)
        
    }
    
    // MARK:- tapped function
    
    @objc func didTapRegisterButton() {
        
        usernameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        
        
        
    }
    
    
}

// MARK: - keybord behavior

extension RegistrationViewController: UITextFieldDelegate {
    
    // return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == usernameTextField {
            
            // 自動的にemailTextFieldでキーボードが開く
            emailTextField.becomeFirstResponder()
            
            
        }
        else if textField == emailTextField {
            
            passwordTextField.becomeFirstResponder()
            
        }
        else {
            
            didTapRegisterButton()
            
        }
        
        
        return true
        
    }
    
}
