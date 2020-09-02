//
//  ProfileInfoHeaderCollectionReusableView.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/31.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject {
    
    func profileHeaderDidTapPostsButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapfollowersButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapfollowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapEditYourProfileButton(_ header: ProfileInfoHeaderCollectionReusableView)
    
}

import UIKit
// finalをつけると継承されるのを防ぐことができる
final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    
    struct profieInfoHeaderSetting{
        
        static func buttonSetting(setTitle: String) -> UIButton{
            
            let button = UIButton()
            button.setTitle(setTitle, for: .normal)
            button.backgroundColor = .systemBackground
            
            return button
        }
        
        static func labelSetting(text: String, numberOfLines: Int) -> UILabel {
            
            let label = UILabel()
            label.text = text
            label.numberOfLines = numberOfLines
            label.textColor = .label
            return label
        }
        
    }
    
    public weak var delegate: ProfileInfoHeaderCollectionReusableViewDelegate?
        
    static let identifier = "ProfileInfoHeaderCollectionViewReusableView"
    
    // Create Outlet
    private let profilePhotoImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    // create buttons
    private let postButton: UIButton = {
        profieInfoHeaderSetting.buttonSetting(setTitle: "post")
    }()
    
    private let follwersButton: UIButton = {
        profieInfoHeaderSetting.buttonSetting(setTitle: "followers")
    }()
    
    private let followingBotton: UIButton = {
        profieInfoHeaderSetting.buttonSetting(setTitle: "following")
    }()
    
    private let editYourProfileButton: UIButton = {
        profieInfoHeaderSetting.buttonSetting(setTitle: "Edit your Profile")
    }()
    
    private let nameLabel: UILabel = {
        profieInfoHeaderSetting.labelSetting(text: "joe Smith", numberOfLines: 1)
    }()
    
    private let bioLabel: UILabel = {
         profieInfoHeaderSetting.labelSetting(text: "This is the first Accout", numberOfLines: 0)
    }()
    
    // MARK: - inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = true
        
        //　呼んだときの処理を書き込む
        addSubViews()
        addButtonActions()
        backgroundColor = .systemBackground
    }
    
    private func addSubViews() {
        addSubview(profilePhotoImageView)
        addSubview(postButton)
        addSubview(follwersButton)
        addSubview(followingBotton)
        addSubview(editYourProfileButton)
        addSubview(nameLabel)
        addSubview(bioLabel)
    }
    
    private func addButtonActions() {
        
        postButton.addTarget(self, action: #selector(didTapPostButton), for: .touchUpInside)
        follwersButton.addTarget(self, action: #selector(didTapfollowersButton), for: .touchUpInside)
        followingBotton.addTarget(self, action: #selector(didTapfollowingButton), for: .touchUpInside)
        editYourProfileButton.addTarget(self, action: #selector(didTapEditProfileButton), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let profilePhotoSize = width/4
        profilePhotoImageView.frame = CGRect(x: 5, y: 5, width: profilePhotoSize, height: profilePhotoSize).integral
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2
        
        let buttonHeight = profilePhotoSize/2
        let countButtonWidth = (width-10-profilePhotoSize)/3
        
        postButton.frame = CGRect(x: profilePhotoImageView.right, y: 5, width: countButtonWidth, height: buttonHeight).integral
        follwersButton.frame = CGRect(x: postButton.right, y: 5, width: countButtonWidth, height: buttonHeight).integral
        followingBotton.frame = CGRect(x: follwersButton.right, y: 5, width: countButtonWidth, height: buttonHeight).integral
        editYourProfileButton.frame = CGRect(x: profilePhotoImageView.right, y: buttonHeight + 5, width: countButtonWidth*3, height: buttonHeight).integral
        
        let bioLabelSize = bioLabel.sizeThatFits(self.frame.size)
        nameLabel.frame = CGRect(x: 5, y: editYourProfileButton.bottom, width: width-10, height: 50)
        bioLabel.frame = CGRect(x: 5, y: nameLabel.bottom, width: width-10, height: bioLabelSize.height
        )
    }
    
    // ここの処理はdelegateで送った先で書く/ delegateを用いるとここで作った関数を使うことができる
    @objc private func didTapPostButton() {
        delegate?.profileHeaderDidTapPostsButton(self)
    }
    
    @objc private func didTapfollowersButton() {
        delegate?.profileHeaderDidTapfollowersButton(self)
    }
    
    @objc private func didTapfollowingButton() {
        delegate?.profileHeaderDidTapfollowingButton(self)
    }
    
    @objc private func didTapEditProfileButton() {
        delegate?.profileHeaderDidTapEditYourProfileButton(self)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
