//
//  VendorReviewCell.swift
//  BU
//
//  Created by Aman Kumar on 22/01/21.
//

import UIKit

class VendorReviewCell: SBaseTableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var imgViewVendor: UIImageView!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var imgRate: UIImageView!
    
    //MARK: - Variables
    internal var customMethodManager:CustomMethodProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if self.customMethodManager == nil {
            self.customMethodManager = CustomMethodClass.shared
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Custom methods
    //TDOD: Configure with
    internal func configure(with info: ProviderViewModel){
        
        self.lblName.text = "\(info.first_name) \(info.last_name)"
        self.lblDetail.text = info.description
        self.lblRating.text = "(\(info.rating))"
        self.customMethodManager?.setImage(imageView: self.imgViewVendor, url: info.avatar)
    }
    
}
