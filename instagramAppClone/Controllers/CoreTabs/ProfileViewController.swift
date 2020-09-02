//
//  ProfileViewController.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/25.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

/// profile view controller
final class ProfileViewController: UIViewController {

    // collection Viewの設定
    private var collectionView: UICollectionView?
    
    private var userPosts = [UserPost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureNavigationBar()
        
        
        // collectionViewの設定
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
        let size = (view.width - 4)/3
        layout.itemSize = CGSize(width: size, height: size)
        
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        collectionView?.backgroundColor = .orange
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        guard let collectionView = collectionView else {
            
            return
            
        }
        
        view.addSubview(collectionView)
    }
    

    private func configureNavigationBar() {
     
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSettingButton))
        navigationItem.rightBarButtonItem?.tintColor = .systemGreen
        
    }
    
    @objc private func didTapSettingButton() {
        
        let vc = SettingsViewController()
        vc.title = "Settings"
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // 最初のsectionはcollectionViewを表示させない
        if section == 0 {
            return 0
            
        }
        
        // それ移行にcollectionViewを設定する
        return 30
        
        // return userPosts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        // let model = userPosts[indexPath.row]
        
        // cell.configure(with: model)
        
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        // get the model and open post controller
        // let model = userPost[indexPath.row]
        
        let vc = PostViewController()
        vc.title = "Post"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard kind == UICollectionView.elementKindSectionHeader else {
            // footer
            return UICollectionReusableView()
            
        }
        
        if indexPath.section == 1{
            
            // tabs header
            let tabControlHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileTabsCollectionReusableView.identifier , for: indexPath) as! ProfileTabsCollectionReusableView
            
            return tabControlHeader
            
        }
        
        let profileHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileInfoHeaderCollectionReusableView.identifier, for: indexPath) as! ProfileInfoHeaderCollectionReusableView
        
        profileHeader.delegate = self
        
        return profileHeader
        
    }
    
    // collectionView、headerのサイズの設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize(width: collectionView.width, height: collectionView.height/3)
        }
        
        // Size of section tabs
        return CGSize(width: collectionView.width, height: 65)
    }

}

// MARK:- ProfileInfoHeaderCollectionReusableViewDelegate

extension ProfileViewController: ProfileInfoHeaderCollectionReusableViewDelegate {
    func profileHeaderDidTapPostsButton(_ header: ProfileInfoHeaderCollectionReusableView) {
        // scroll to the posts
        collectionView?.scrollToItem(at: IndexPath(row: 0, section: 1), at: .top, animated: true)
    }
    
    func profileHeaderDidTapfollowersButton(_ header: ProfileInfoHeaderCollectionReusableView) {
        let vc = ListViewController()
        vc.title = "followers"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func profileHeaderDidTapfollowingButton(_ header: ProfileInfoHeaderCollectionReusableView) {
        let vc = ListViewController()
        vc.title = "following"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func profileHeaderDidTapEditYourProfileButton(_ header: ProfileInfoHeaderCollectionReusableView) {
        let vc = EditProfileViewController()
        vc.title = "Edit Profile"
        present(UINavigationController(rootViewController: vc), animated: true)
    }
    
    
    
}
