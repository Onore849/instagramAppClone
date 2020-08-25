//
//  Extensions.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/25.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK:- CGFloat：よく使う値
    public var width: CGFloat {
        
        return frame.size.width
        
    }
    
    public var height: CGFloat {
        
        return frame.size.height
        
    }
    
    public var top: CGFloat {
        
        return frame.origin.y
        
    }
    
    public var bottom: CGFloat {
        
        return top + height
        
    }
    
    public var left: CGFloat {
        
        return frame.origin.x
        
    }
    
    public var right: CGFloat {
        
        return left + width
    }
    
}

