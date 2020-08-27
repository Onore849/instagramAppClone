//
//  SettingsViewController.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/25.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

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

        return tableView
    }()
    
    // MARK:- display
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        tableView.delegate = self
        tableView.dataSource = self
        
        configureModels()
        
        view.addSubview(tableView)
    }
    
    
    private func configureModels() {
        
        let section = [
            
            SettingCellModel(title: "Log Out", handler: { [weak self] in
                
                self?.didTapLogOut()
                
            })
        ]
        
        data.append(section)
        
    }
    
    // logOutする処理を記述
    private func didTapLogOut() {
        
        let actionSheet = UIAlertController(title: "Log out", message: "Are you sure want to log Out?", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _  in
            
            AuthManager.shared.logOut { (success) in
                
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
            }
            
            
        }))
        
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
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
     
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 選択したrowから選択を取る
        tableView.deselectRow(at: indexPath, animated: true)
        
        // tappした時にhandlerを呼び出す: handlerにはdidtapLogOutが記述されている
        data[indexPath.section][indexPath.row].handler()
        
    }
    
    
    
    
}
