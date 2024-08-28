//
//  UnderConstructionVC+CustomMethodsExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 08/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
extension UnderConstructionVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = true
        super.setupNavigationBarTitle(AppColor.header_color,false,ConstantTexts.UnerConstructionTitle, AppColor.whiteColor, leftBarButtonsType: [.back], rightBarButtonsType: [.empty])
        super.isHiddenNavigationBar(false)
        
    }
    
    
    //TODO: Init values
    internal func initValues(){
        if customMethodManager == nil {
            customMethodManager = CustomMethodClass.shared
        }
        
        initialSetup()
    }
    
    
    //TODO: Intial setup implementation
    private func initialSetup(){
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 2 // Whatever line spacing you want in points
        
        let myMutableString = NSMutableAttributedString()
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: ConstantTexts.UnderConstruction_LT, font: AppFont.Bold.size(AppFontName.Montserrat, size: 18), color: AppColor.errorColor) ?? NSMutableAttributedString())
        myMutableString.append(customMethodManager?.provideSimpleAttributedText(text: "\n\(ConstantTexts.WeBackSoon_LT)", font: AppFont.SemiBold.size(AppFontName.Montserrat, size: 14), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        
        self.descLabel.numberOfLines = 0
        self.descLabel.attributedText = myMutableString
        
        self.customMethodManager?.showLottieAnimation(self.animationView, ConstantTexts.Construction, .loop)
        
    }
    
    
    
}
