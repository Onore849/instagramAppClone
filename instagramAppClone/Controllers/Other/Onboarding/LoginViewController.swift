//
//  LoginViewController.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/25.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    struct Constants {
        
        // privacyButton & termsButtonの共通設定
        static func CommonButtonSetting(title: String) -> UIButton {
            
            let button = UIButton()
            
            button.setTitle(title, for: .normal)
            button.setTitleColor(.secondaryLabel, for: .normal)
            
            return button
            
        }
        
    }
    
 
    
    // MARK:- Outletの作成
    
    // create textField
    private let usernameEmailTextField: UITextField = {
        
        userTextField.textFieldSetting(placeholder: "Username or Email" , returnKeyType: .next)
        
    }()
    
    private let passwordTextField: UITextField = {
        
        userTextField.textFieldSetting(placeholder: "password", returnKeyType: .continue)
        
    }()
    
    // create headerView
    private let headerView: UIView = {
        
        let header = UIView()
        
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        
        // headerに背景画像を追加
        header.addSubview(backgroundImageView)
       
        return header
    }()
    
    // create Button
    private let loginButton: UIButton = {
        
        let button = UIButton()
        
        button.setTitle("Log In", for: .normal)
        
        button.layer.masksToBounds = true
        button.layer.cornerRadius = userTextField.layor.cornerRadius
        
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        
        return button
    }()
    
    private let createAccountButton: UIButton = {
            
        Constants.CommonButtonSetting(title: "New User? Create an Account")

    }()
    
    private let termsButton: UIButton = {
        
        Constants.CommonButtonSetting(title: "Terms of Serviced")
        
    }()
    
    private let privacyButton: UIButton = {
        
        Constants.CommonButtonSetting(title: "Privacy Policy")
        
    }()

    // MARK:- display
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubViews()
        
        tappedActions()
        
        view.backgroundColor = .systemBackground

        
    }
    
    // partsの位置指定
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.width,
            height: view.height/3
        )
        
        configureHeaderView()
        
        usernameEmailTextField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 40,
            width: view.frame.width - 50,
            height: 52
        )
        
        passwordTextField.frame = CGRect(
            x: 25,
            y: usernameEmailTextField.bottom + 10,
            width: view.frame.width - 50,
            height: 52)
        
        loginButton.frame = CGRect(
            x: 25,
            y: passwordTextField.bottom + 10,
            width: view.width - 50,
            height: 52
        )
        
        createAccountButton.frame = CGRect(
            x: 20,
            y: loginButton.bottom + 10,
            width: view.width - 40,
            height: 50
        )
        
        termsButton.frame = CGRect(
            x: 20,
            y: view.height - view.safeAreaInsets.bottom - 100,
            width: view.width - 40,
            height: 50
        )
        
        privacyButton.frame = CGRect(
            x: 20,
            y: termsButton.bottom,
            width: view.width - 40,
            height: 50
        )
        
        
    }
    
    // MARK:- outletをviewに追加する
    private func addSubViews() {
        
        view.addSubview(headerView)
        
        view.addSubview(usernameEmailTextField)
        view.addSubview(passwordTextField)
        
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        
        
    }
    
    // MARK:- 各構成要素の細かい設定
    private func configureHeaderView() {
        
        // headerView内に存在するsubViewsの数が1以外ならerror
        guard headerView.subviews.count == 1 else {
            
            print(headerView.subviews.count)
            return
            
        }
        
        // 追加したbackgroundImageViewを変数に入れている/ 入らなければエラー
        guard let backgroundView = headerView.subviews.first else {
         
            return
            
        }
        
        // headerView.boundsとすることで、headerViewの大きさに合わせて背景が指定される
        backgroundView.frame = headerView.bounds
        
        // logoの作成
        let imageLogo = UIImageView(image: UIImage(named: "logo3"))
        headerView.addSubview(imageLogo)
        
        imageLogo.contentMode = .scaleAspectFit
        
        // logoの位置
        imageLogo.frame = CGRect(
            x: headerView.width/4,
            y: view.safeAreaInsets.top,
            width: headerView.width/2,
            height: headerView.height - view.safeAreaInsets.top
        )
        
    }
    
    // MARK:- タップしたときの処理のまとめ
    private func tappedActions() {
        
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccountButton), for: .touchUpInside)
        
        termsButton.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
        
        
    }
    
    // tapped loginButton : ログインする
    @objc private func didTapLoginButton() {
        
        passwordTextField.resignFirstResponder()
        usernameEmailTextField.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailTextField.text, !usernameEmail.isEmpty,
            let passWord = passwordTextField.text, !passWord.isEmpty else {
                
                return
                
        }
        
        // login function
        var username: String?
        var email: String?
        
        if usernameEmail.contains("@"), usernameEmail.contains(".") {
            // email
            email = usernameEmail
        } else {
            // username
            username = usernameEmail
        }
        
        AuthManager.shared.loginUser(username: username, email: email, passWord: passWord) { ( success ) in
            
            DispatchQueue.main.async {
                
                if success {
                    // User logged In
                    self.dismiss(animated: true, completion: nil)
                    
                }
                else {
                    
                    // alertの表示
                    let alert = UIAlertController(title: "Log In Error", message: "we were unable to log you in", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    
                    self.present(alert, animated: true)
                    
                }
            }
        }
        
        
    }
    
    // tapped createAccountButton: 新規登録ページヘの移行
    @objc private func didTapCreateAccountButton() {
        
        let vc = RegistrationViewController()
        
        vc.title = "Create Account"
        
        present(UINavigationController(rootViewController: vc), animated: true)
        
    }
    
    // tapped termsButton : search terms br safari
    @objc func didTapTermsButton() {
        
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {
            
            return
        }
        
        let vc = SFSafariViewController(url: url)
        
        present(vc, animated: true)
        
        
    }
    
    // tapped privacyButton : search privacy Policy by safari
    @objc func didTapPrivacyButton() {
        
        guard let url = URL(string: "https://help.instagram.com/196883487377501/?hel-") else {
            
            return
            
        }
        
        let vc = SFSafariViewController(url: url)
        
        present(vc, animated: true)
        
        
    }
    
    
}

// MARK:- textFieldタップ時のキーボードの挙動
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == usernameEmailTextField {
            
            passwordTextField.becomeFirstResponder()
            
        }
        else if textField == passwordTextField {
            
            didTapLoginButton()
            
        }
        
        return true
        
    }
    
    
}
