//
//  ProfileTabsCollectionReusableView.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/31.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

class ProfileTabsCollectionReusableView: UICollectionReusableView {
        
    static let identifier = "ProfileTabsCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
