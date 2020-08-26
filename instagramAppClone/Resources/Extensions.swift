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

extension String {
    
    func safeDatabaseKey() -> String {
        
        return self.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
        
    }
    
}



struct layor {
    
    static let cornerRadius: CGFloat = 8.0
    
}

// commonly passWord & usernameEmail TextField
class userTextField: UITextField {
    
    // textFieldに対する共通の設定, staticは必須
    static func textFieldSetting(placeholder: String, returnKeyType: UIReturnKeyType) -> UITextField {
        
        let field = UITextField()
        field.returnKeyType = returnKeyType
        
        field.placeholder = placeholder
        // textField内のinnnerのpadding-leftを操作
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        
        // タイプした最初の文字が大文字になるのを防ぐ
        field.autocapitalizationType = .none
        
        // textの自動補完機能をオフにする
        field.autocorrectionType = .no
        
        // UITextFieldがUIViewよりも大きくなった時に文字が反映されない
        field.layer.masksToBounds = true
        
        field.layer.cornerRadius = layor.cornerRadius
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        field.backgroundColor = .secondarySystemBackground
        
        if returnKeyType == .continue {
            
            field.isSecureTextEntry = true
            
        }
        
        return field
        
    }
    
}


// commonly button
class buttonObject: UIButton {
    // staticは必須
    static func objectButtonSetting(titleString: String, titleColor: UIColor, backgroundColor: UIColor) -> UIButton {
        
        let button = UIButton()
        
        button.setTitle(titleString, for: .normal)
        
        button.layer.masksToBounds = true
        button.layer.cornerRadius = layor.cornerRadius
        
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)

        return button
    }
    
    
}
