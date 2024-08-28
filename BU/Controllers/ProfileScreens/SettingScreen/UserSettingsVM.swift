//
//  UserSettingsVM.swift
//  BU
//
//  Created by Aman Kumar on 23/01/21.
//

import Foundation
import UIKit
class UserSettingsVM: CategoryListModeling {
    
    //TODO: Singleton object
    static let shared = UserSettingsVM()
    private init() {}
    
    //TODO: Prepare data source implementation
    func prepareDataSourceStatic() -> CategoryListViewModel {
        let categories = [Category(id: String(), image: #imageLiteral(resourceName: "add-location-point"), title: ConstantTexts.ManageAddressLT, Url: String()),
                          Category(id: String(),image: #imageLiteral(resourceName: "contact"), title: ConstantTexts.ContactLT, Url: String()),
                          Category(id: String(),image: #imageLiteral(resourceName: "about"), title: ConstantTexts.AboutUsLT, Url: String()),
                          Category(id: String(),image: #imageLiteral(resourceName: "faq"), title: ConstantTexts.FAQsLT, Url: String()),
                          Category(id: String(),image: #imageLiteral(resourceName: "insurance"), title: ConstantTexts.PrivacyAndPolLT, Url: String()),
                          Category(id: String(),image: #imageLiteral(resourceName: "privacy-policy"), title: ConstantTexts.TermAndCondLT, Url: String()),
                          Category(id: String(),image: #imageLiteral(resourceName: "log-out"), title: ConstantTexts.LogOutLT, Url: String())]
        
        return CategoryListViewModel(categories: categories)
    }
    
}
