//
//  EditProfileViewController.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/25.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit


struct EditProfileFormModel {
    
    let label: String
    let placeholder: String
    var value: String?
    
}

final class EditProfileViewController: UIViewController {
    
    private var models = [[EditProfileFormModel]]()
    
    // MARK:- Outlet
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: FormTableViewCell.identifier)
        
        return tableView
    }()

    // MARK:- Display
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableHeaderView = createTableHeaderView()
        
        configureModels()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        
        view.backgroundColor = .systemBackground
        
        navigationItem.leftBarButtonItem?.tintColor = .systemGreen
        navigationItem.rightBarButtonItem?.tintColor = .systemGreen
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(didTapCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    private func configureModels() {
        
        // name, username, bio
        let section1Labels = ["Name", "Username","Bio"]
        var section1 = [EditProfileFormModel]()
        
        for label in section1Labels {
            
            let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)....", value: nil)
            
            section1.append(model)
        }
        models.append(section1)
        
        // email, phone, gender
        let section2Labels = ["Email", "Phone", "Gender"]
        var section2 = [EditProfileFormModel]()
        
        for label in section2Labels {
            
            let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)....", value: nil)
            
            section2.append(model)
        }
        models.append(section2)
    }
    
    private func createTableHeaderView() -> UIView {
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height/4).integral)
        let size = header.height/1.5
        // size決め、難しい
        let profilePhotoButton = UIButton(frame: CGRect(x: (header.width - size)/2, y: (header.height - size)/2, width: size, height: size))
        
        header.addSubview(profilePhotoButton)
        
        // profilePhotoButton: layout
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.layer.cornerRadius = size/2
        profilePhotoButton.layer.borderWidth = 1
        profilePhotoButton.tintColor = .systemGreen
        profilePhotoButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        
        profilePhotoButton.addTarget(self, action: #selector(didtapProfilePhotoButton), for: .touchUpInside)
        profilePhotoButton.setBackgroundImage(UIImage(systemName: "person.circle"), for: .normal)
        
        return header
    }
    
    // MARK:- Action
    
    @objc private func didtapProfilePhotoButton() {

    }
    
    @objc private func didTapCancel() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc private func didTapSave() {
        
        dismiss(animated: true, completion: nil)
    }
    
    // change profile picture
    @objc private func didTapChangeProfilePicture() {
        
        let actionSheet = UIAlertController(title: "Profile Picture", message: "Change Profile", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { ( _ ) in
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Choose from Library", style: .default, handler: { ( _ ) in
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true)
        
    }
    
}

// MARK:- extension tableView
extension EditProfileViewController: UITableViewDelegate, UITableViewDataSource, FormTableViewCellDelegate {
    func formTableViewCell(_ cell: FormTableViewCell, didUpdateField updateModel: EditProfileFormModel?) {
        
        // update the model
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let model = models[indexPath.section][indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell.identifier, for: indexPath) as! FormTableViewCell
        
        cell.configure(with: model)
        cell.delegate = self
        
        cell.textLabel?.text = model.label

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        guard section == 1 else {
            
            return nil
        }
        
        return "Private Information"
        
    }
    
    
}
