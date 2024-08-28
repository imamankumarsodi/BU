//
//  SBaseTableViewCell.swift
//  BU
//
//  Created by Aman Kumar on 17/01/21.
//


import UIKit
import SkyFloatingLabelTextField

class Auth_TextField_TableViewCell: SBaseTableViewCell {
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var textFieldFloating: SkyFloatingLabelTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.textFieldFloating.titleFormatter = { $0 }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    
    //MARK: - User Define Functions
    //TODO: Config TableViewCell
    
    public func configure(with info: DataStoreStruct_ViewModel) {
        self.textFieldFloating.placeholder = info.placeholder
        self.textFieldFloating.title = info.title
        
        switch info.type{
        case .PhoneNumber:
            textFieldFloating.maxLength = 10
            textFieldFloating.keyboardType = .numberPad
            textFieldFloating.isSecureTextEntry = false
            textFieldFloating.autocapitalizationType = .none
            
            
        case .FullName:
            textFieldFloating.maxLength = 30
            textFieldFloating.keyboardType = .namePhonePad
            textFieldFloating.isSecureTextEntry = false
            textFieldFloating.autocapitalizationType = .words
            
            
        case .Email:
            textFieldFloating.maxLength = 30
            textFieldFloating.keyboardType = .emailAddress
            textFieldFloating.isSecureTextEntry = false
            textFieldFloating.autocapitalizationType = .none
            
            
        case .OTP:
            textFieldFloating.maxLength = 6
            textFieldFloating.keyboardType = .numberPad
            textFieldFloating.isSecureTextEntry = false
            textFieldFloating.autocapitalizationType = .none
            
        case .Comment:
            textFieldFloating.maxLength = 200
            textFieldFloating.keyboardType = .default
            textFieldFloating.isSecureTextEntry = false
            textFieldFloating.autocapitalizationType = .words
            
        default :
            return
        }
        
    }

}
