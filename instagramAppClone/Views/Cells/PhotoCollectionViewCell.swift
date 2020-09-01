//
//  PhotoCollectionViewCell.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/31.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotoCollectionViewCell"
    
    private let photoImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
        
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoImageView.frame = contentView.bounds
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        photoImageView.image = nil
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(photoImageView)
        contentView.clipsToBounds = true
        
        //　カーソルがあたったときに読み上げてくれる処理
        accessibilityLabel = "user post image"
        // ユーザが操作するためのヒントを指定してくれる
        accessibilityHint = "Double-tap to open post"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: String) {
        
        
    }
    
    public func configure(debug imageName: String) {
        photoImageView.image = UIImage(named: imageName)
        
    }
}
