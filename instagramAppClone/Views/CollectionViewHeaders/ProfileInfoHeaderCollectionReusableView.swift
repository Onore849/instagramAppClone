//
//  ProfileInfoHeaderCollectionReusableView.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/31.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
        
    static let identifier = "ProfileInfoHeaderCollectionViewReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBlue
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
