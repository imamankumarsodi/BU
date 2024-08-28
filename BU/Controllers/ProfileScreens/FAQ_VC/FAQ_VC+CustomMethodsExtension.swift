//
//  FAQ_VC+CustomMethodsExtension.swift
//  Lawyer
//
//  Created by Aman Kumar on 09/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import UIKit
extension FAQ_VC{
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = true
        super.isHiddenNavigationBar(false)

        super.setupNavigationBarTitle(AppColor.header_color,false,"\(ConstantTexts.FAQsTitle)", AppColor.whiteColor, leftBarButtonsType: [.back], rightBarButtonsType: [.notification])
    }
    
    //TODO: Init values
    internal func initValues(){
        if faqVM == nil {
            faqVM = FAQ_VM.shared
        }
        
        
        initialSetup()
        
    }
    
    //TODO: Intial setup implementation
    private func initialSetup(){
        
        if let items = faqVM?.prepareDataSource(){
            faqView = FAQView(frame: view.frame, items: items)
            faqView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(faqView)
            addFaqViewConstraints()
        }
        
        
        
    }
    
    
    private func addFaqViewConstraints() {
        
        if let faqV = faqView{
            let faqViewTrailing = NSLayoutConstraint(item: faqV, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailingMargin, multiplier: 1, constant: 17)
            let faqViewLeading = NSLayoutConstraint(item: faqV, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leadingMargin, multiplier: 1, constant: -17)
            let faqViewTop = NSLayoutConstraint(item: faqV, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
            let faqViewBottom = NSLayoutConstraint(item: self.view ?? UIView(), attribute: .bottom, relatedBy: .equal, toItem: faqView, attribute: .bottom, multiplier: 1, constant: 0)
            
            NSLayoutConstraint.activate([faqViewTop, faqViewBottom, faqViewLeading, faqViewTrailing])
        }
        
        
    }
    
    
}
