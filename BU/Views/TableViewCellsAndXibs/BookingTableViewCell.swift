//
//  BookingTableViewCell.swift
//  BU
//
//  Created by Aman Kumar on 23/01/21.
//

import UIKit

class BookingTableViewCell: SBaseTableViewCell {
    //MARK: - IBOutlets
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var lblTimeAndStatus: UILabel!
    @IBOutlet weak var imgRate: UIImageView!
    
    //MARK: - Variables
    internal var customMethodManager:CustomMethodProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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

    
    //TDOD: Configure for upcoming
    internal func configureForCancelled(with info:BookingDataViewModel){
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        
        var myMutableString = NSMutableAttributedString()
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(info.first_name) \(info.last_name)", font: AppFont.Medium.size(AppFontName.Montserrat, size: 14), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\n\(info.service_name)", font: AppFont.Regular.size(AppFontName.Montserrat, size: 12), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        self.lblDetail.attributedText = myMutableString
        
        
        myMutableString = NSMutableAttributedString()
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(info.booking_date) •", font: AppFont.Medium.size(AppFontName.Montserrat, size: 12), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: " \(info.status)", font: AppFont.Regular.size(AppFontName.Montserrat, size: 10), color: AppColor.errorColor) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        self.lblTimeAndStatus.attributedText = myMutableString
        
    }
    
    //TDOD: Configure for upcoming
    internal func configureForCompleted(with info:BookingDataViewModel){
        self.imgRate.isHidden = false
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        
        var myMutableString = NSMutableAttributedString()
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(info.first_name) \(info.last_name)", font: AppFont.Medium.size(AppFontName.Montserrat, size: 14), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\n\(info.service_name)", font: AppFont.Regular.size(AppFontName.Montserrat, size: 12), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        self.lblDetail.attributedText = myMutableString
        
        
        myMutableString = NSMutableAttributedString()
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(info.booking_date) •", font: AppFont.Medium.size(AppFontName.Montserrat, size: 12), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: " \(ConstantTexts.RateUsLT)", font: AppFont.Regular.size(AppFontName.Montserrat, size: 10), color: AppColor.app_pass_color) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        self.lblTimeAndStatus.attributedText = myMutableString
        
    }
    
}
