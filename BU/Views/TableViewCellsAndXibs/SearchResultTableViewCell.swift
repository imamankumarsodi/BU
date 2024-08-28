//
//  SearchResultTableViewCell.swift
//  BU
//
//  Created by Aman Kumar on 21/01/21.
//

import UIKit

class SearchResultTableViewCell: SBaseTableViewCell {
   
    
    //MARK: - IBOutlets
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
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        
        let myMutableString = NSMutableAttributedString()
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(info.first_name) \(info.last_name)", font: AppFont.Bold.size(AppFontName.Montserrat, size: 16), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\n\(info.description)", font: AppFont.SemiBold.size(AppFontName.Montserrat, size: 14), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\n\(ConstantTexts.CurLT)\(ConstantTexts.HyphenLT)\(info.price)\(ConstantTexts.PerDayLT)", font: AppFont.Regular.size(AppFontName.Montserrat, size: 12), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\n\(info.distance) \(ConstantTexts.KmAwayLT)", font: AppFont.Regular.size(AppFontName.Montserrat, size: 10), color: AppColor.app_blue_color) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        self.lblDetail.attributedText = myMutableString
        self.lblRating.text = "(\(info.rating))"
        self.customMethodManager?.setImage(imageView: self.imgViewVendor, url: info.avatar)
    }
    
}
