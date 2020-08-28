//
//  IGFeedPostTableViewCell.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/28.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

class IGFeedPostTableViewCell: UITableViewCell {
    
    static let identifier = "IGFeedPostTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // customCellの細かい設定
    public func configure() {
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
