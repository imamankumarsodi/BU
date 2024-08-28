//
//  HomeSearchVC+ExtensionMethod.swift
//  BU
//
//  Created by Aman Kumar on 20/01/21.
//

import Foundation
import UIKit
extension HomeSearchVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = true
        super.setupNavigationBarTitle(AppColor.header_color,false,ConstantTexts.empty, AppColor.whiteColor, leftBarButtonsType: [.back], rightBarButtonsType: [])
        super.isHiddenNavigationBar(false)
    }
    
    
    //TODO: Init values
    internal func initValues(){
        if self.customMethodManager == nil {
            self.customMethodManager = CustomMethodClass.shared
        }
        
        self.initialSetup()
    }
    
    //TODO: IntialSetup
    private func initialSetup(){
        self.searchBar.backgroundImage = UIImage()
        self.searchBar.searchTextField.font = AppFont.Regular.size(AppFontName.Montserrat, size: 14)
        self.customMethodManager?.provideCornerBorderTo(self.searchBar, 1, UIColor.lightGray)
        self.customMethodManager?.provideCornerRadiusTo(self.searchBar, self.searchBar.frame.size.height/2, [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMaxYCorner])
        self.searchBar.searchTextField.backgroundColor = AppColor.whiteColor
        
        self.registerNib()
    }
    
    
    //TODO: register nib file
    private func registerNib(){
        self.searchTbl.register(nib: SearchTableViewCell.className)
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
            /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
        }
    }
    
}
