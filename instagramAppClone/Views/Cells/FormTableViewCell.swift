//
//  FormTableViewCell.swift
//  instagramAppClone
//
//  Created by 野澤拓己 on 2020/08/31.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import UIKit

// protocolを宣言してEditProfilFormModelにFormTableViewCellの設定を適用する
protocol FormTableViewCellDelegate: AnyObject {
    
    func formTableViewCell(_ cell: FormTableViewCell, didUpdateField updateModel: EditProfileFormModel?)
}


class FormTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    static let identifier = "FormTableViewCell"
    
    private var model: EditProfileFormModel?
    
    // EditProfileFormModelに送るdelegateを設定
    public weak var delegate: FormTableViewCellDelegate?

    // MARK:- Outlet
    private let formLabel: UILabel = {
        
        let label = UILabel()
        
        label.textColor = .label
        label.numberOfLines = 1
        
        return label
    }()
    
    private let field: UITextField = {
        
        let field = UITextField()
        field.returnKeyType = .done
        
        return field
        
    }()
    
    // MARK:- Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        clipsToBounds = true
        
        contentView.addSubview(formLabel)
        contentView.addSubview(field)
        
        field.delegate = self
        
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        formLabel.text = nil
        field.placeholder = nil
        field.text = nil
        
    }
    
    public func configure(with model: EditProfileFormModel) {
        
        self.model = model
        formLabel.text = model.label
        field.placeholder = model.placeholder
        field.text = model.value
        
    }
    // MARK: - frame
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Assign frames
        formLabel.frame = CGRect(x: 20, y: 0, width: contentView.width - 10 - formLabel.width, height: contentView.height)
        formLabel.frame = CGRect(x: formLabel.right + 5, y: 0, width: contentView.width - 10 - formLabel.width, height: contentView.height)
    }
    
    // MARK:- keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        model?.value = textField.text
        guard let model = model else {
            
            return true
        }
        
        textField.resignFirstResponder()
        
        delegate?.formTableViewCell(self, didUpdateField: model)
        
        return true
        
    }
    
    

}
