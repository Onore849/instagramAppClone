//
//  LoginViewController.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/25.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    struct Constants {
        
        // staticはインスタンス()を使わなくても呼び出すことができる
        static let cornerRadius: CGFloat = 8.0
        
        static func textFieldSetting(placeholder: String, returnKeyType: UIReturnKeyType) -> UITextField {
            
            let field = UITextField()
             field.returnKeyType = returnKeyType
             
             field.placeholder = placeholder
             // textField内のinnnerのpadding-leftを操作
             field.leftViewMode = .always
             field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
             
             // タイプした最初の文字が大文字になるのを防ぐ
             field.autocapitalizationType = .none
             
             // textの自動補完機能をオフにする
             field.autocorrectionType = .no
             
             // UITextFieldがUIViewよりも大きくなった時に文字が反映されない
             field.layer.masksToBounds = true
             
             field.layer.cornerRadius = Constants.cornerRadius
             field.layer.borderWidth = 1.0
             field.layer.borderColor = UIColor.secondaryLabel.cgColor
             
             field.backgroundColor = .secondarySystemBackground
             
             return field
            
        }
        
    }
    
 
    
    // MARK:- Outletの作成
    
    // create textField
    private let usernameEmailTextField: UITextField = {
        
        Constants.textFieldSetting(placeholder: "Username or Email....", returnKeyType: .next)
        
    }()
    
    private let passwordTextField: UITextField = {
        
        Constants.textFieldSetting(placeholder: "Password.....", returnKeyType: .continue)
        
    }()
    
    

    // MARK:- display
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        
        view.backgroundColor = .systemBackground

        
    }
    
    // partsの位置指定
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        usernameEmailTextField.frame = CGRect(
            x: 25,
            y: 100,
            width: view.frame.width - 50,
            height: 52
        )
        
        passwordTextField.frame = CGRect(
            x: 25,
            y: usernameEmailTextField.bottom + 10,
            width: view.frame.width - 50,
            height: 52)
        
        
    }
    
    
    // MARK:- outletをviewに追加する
    private func addSubViews() {
        
        view.addSubview(usernameEmailTextField)
        view.addSubview(passwordTextField)
        
        
    }
    


}
