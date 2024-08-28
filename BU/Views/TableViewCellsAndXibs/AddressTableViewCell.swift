//
//  AddressTableViewCell.swift
//  BU
//
//  Created by Aman Kumar on 24/01/21.
//

import UIKit

class AddressTableViewCell: SBaseTableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnSelected: UIButton!
    @IBOutlet weak var txtField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //MARK: - User Define Functions
    //TODO: Config TableViewCell
    
    public func configure(with info: DataStoreStruct_ViewModel) {
        self.txtField.placeholder = info.placeholder
        self.txtField.text = info.value
        self.lblTitle.text = info.title
        
        switch info.type{
        
        case .SelectAddressType:
            txtField.maxLength = 30
            txtField.keyboardType = .default
            txtField.isSecureTextEntry = false
            txtField.autocapitalizationType = .none
            btnSelected.isHidden = false
            imgView.isHidden = false
        
        case .PhoneNumber:
            txtField.maxLength = 10
            txtField.keyboardType = .numberPad
            txtField.isSecureTextEntry = false
            txtField.autocapitalizationType = .none
            btnSelected.isHidden = true
            imgView.isHidden = true
            
            
        case .FirstName:
            txtField.maxLength = 30
            txtField.keyboardType = .namePhonePad
            txtField.isSecureTextEntry = false
            txtField.autocapitalizationType = .words
            btnSelected.isHidden = true
            imgView.isHidden = true
            
        case .LastName:
            txtField.maxLength = 30
            txtField.keyboardType = .namePhonePad
            txtField.isSecureTextEntry = false
            txtField.autocapitalizationType = .words
            btnSelected.isHidden = true
            imgView.isHidden = true
            
        case .Address:
            txtField.maxLength = 200
            txtField.keyboardType = .default
            txtField.isSecureTextEntry = false
            txtField.autocapitalizationType = .none
            btnSelected.isHidden = true
            imgView.isHidden = true
            
            
        case .Area:
            txtField.maxLength = 200
            txtField.keyboardType = .default
            txtField.isSecureTextEntry = false
            txtField.autocapitalizationType = .none
            btnSelected.isHidden = true
            imgView.isHidden = true
            
        case .State:
            txtField.maxLength = 100
            txtField.keyboardType = .default
            txtField.isSecureTextEntry = false
            txtField.autocapitalizationType = .none
            btnSelected.isHidden = false
            imgView.isHidden = false
            
        case .City:
            txtField.maxLength = 100
            txtField.keyboardType = .default
            txtField.isSecureTextEntry = false
            txtField.autocapitalizationType = .none
            btnSelected.isHidden = false
            imgView.isHidden = false
            
        case .Email:
            txtField.maxLength = 30
            txtField.keyboardType = .emailAddress
            txtField.isSecureTextEntry = false
            txtField.autocapitalizationType = .none
            btnSelected.isHidden = true
            imgView.isHidden = true
            
        case .ZipCode:
            txtField.maxLength = 5
            txtField.keyboardType = .default
            txtField.isSecureTextEntry = false
            txtField.autocapitalizationType = .none
            btnSelected.isHidden = true
            imgView.isHidden = true
       
            
        default :
            return
        }
        
    }
    
    
}
