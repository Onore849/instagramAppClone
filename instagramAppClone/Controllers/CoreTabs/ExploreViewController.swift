//
//  ExploreViewController.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/25.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {
    
    // MARK:- Outlet
    private let searchBar: UISearchBar = {
        
        let searchBar = UISearchBar()
        
        searchBar.backgroundColor = .secondarySystemBackground
        
        return searchBar
        
    }()
    
    private var collectionView: UICollectionView?

    // MARK: - display
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.topItem?.titleView = searchBar
        
        
        // layoutの設定をviewDidLoad内に入れたいので、ここにcollectionViewについて書き込む
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        // ここの値をいじってみる
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
       
        // .addSubViewにoptional型は使えない
        guard let collectionView = collectionView else {
            
            return
            
        }
        
        view.addSubview(collectionView)
        
        
    }
    
}

// MARK:- extension: collectionViewDelegate, CollectionViewDatasource, CollectionViewDelegateFlowLayout
extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 0
            
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
        
    }
    
    
    
    
    
    
}
