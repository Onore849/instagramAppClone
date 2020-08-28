//
//  SettingsViewController.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/25.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit
import SafariServices

struct SettingCellModel {
    
    let title: String
    // イベントが始まったらプログラムが行う処理: この場合はVoid型を返す,戻り値がない
    let handler: (() -> Void)
    
}

final class SettingsViewController: UIViewController {
    
    private var data = [[SettingCellModel]]()
    
    //MARK:-  Outlet
    private let tableView: UITableView = {
        
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        return tableView
    }()
    
    // MARK:- display
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureModels()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        
    }
    
    
    private func configureModels() {
        
        data.append([
            
            SettingCellModel(title: "Edit Profile" ){ [ weak self ] in
                
                self?.didTapEditProfile()

            },
            
            SettingCellModel(title: "Invite Friends" ){ [ weak self ] in
                
                self?.didInviteFriends()

            },
            
            SettingCellModel(title: "Save Original Posts" ){ [ weak self ] in
                
                self?.didTapSaveOriginalPosts()

            }
            
        
        ])
        
        data.append([
            
            SettingCellModel(title: "Terms of Services") { [ weak self ] in
                
                self?.openURL(type: .terms)
                
            },
            
            SettingCellModel(title: "Privacy Polocy") { [ weak self ] in
                
                self?.openURL(type: .privacy)
                
            },
            
            SettingCellModel(title: "Help / FeedBack") { [ weak self ] in
                
                self?.openURL(type: .help)
                
            },
            
            
        ])
        
        data.append([
            
            SettingCellModel(title: "Log Out", handler: { [weak self] in
                
                self?.didTapLogOut()
                
            })
        ])
        
    }

    
    //MARK:-  configureModelsのデータをタップした時の処理
    private func didTapEditProfile() {
        
    }
    
    private func didInviteFriends() {
        // show share sheet to invite friends
        
    }
    
    private func didTapSaveOriginalPosts() {
        
        let vc = EditProfileViewController()
        vc.title = "edit profile"
        
        let navVC = UINavigationController(rootViewController: vc)
        
        present(navVC, animated: true)
        
    }
    
    enum SettingsURLType {
        
        case terms, privacy, help
    
    }
    
    private func openURL(type: SettingsURLType) {
        
        let urlString: String
        
        switch type {
        case .terms:
            urlString = "https://help.instagram.com/581066165581870"
        case .privacy:
            urlString = "https://help.instagram.com/196883487377501/?hel-"
        case .help:
            urlString = "https://help.instagram.com/"
        }
        
        // urlStringをキャストしたときにoptional型になるのでoptionalバインディングでアンラップする
        guard let url = URL(string: urlString) else {
            
            return
        }
        // optional型だと引数に取れない
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
        
    }
    
    // logOutする処理を記述
    private func didTapLogOut() {
        
        let actionSheet = UIAlertController(title: "Log out", message: "Are you sure want to log Out?", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _  in
            
            AuthManager.shared.logOut(completion: {(success) in
                
                DispatchQueue.main.async {
                    
                    if success {
                        // present log in
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            
                            self.navigationController?.popViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                            
                        }
                        
                    }
                    else {
                        
                        // ptrogramの実行を止めて、print()を行う
                        fatalError("Could not log out user")
                        
                    }
                }
            })
            
            
        }))
        
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        
        present(actionSheet, animated: true)
    }
    
}

// MARK:- tableView more detail
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        // dataの中の[SettingCellModel]の数が入る
        return data.count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // data>[section]内の要素の数を返す
        return data[section].count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       
        // dataが二重配列となっているため、このような表記となる
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
     
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 選択したrowから選択を取る
        tableView.deselectRow(at: indexPath, animated: true)
        
        // tappした時にhandlerを呼び出す: handlerにはdidtapLogOutが記述されている
        data[indexPath.section][indexPath.row].handler()
        
    }
    
    
    
    
}
