//
//  HomeViewController.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/25.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handleNotAutenticated()
    }
    
    private func handleNotAutenticated() {
        
        if Auth.auth().currentUser == nil {
            
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            
            present(loginVC, animated: false)
            
        }
        
        
    }
    



}
