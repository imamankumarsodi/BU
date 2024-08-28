//
//  UserSettingsVC+CustomMethodExtension.swift
//  BU
//
//  Created by Aman Kumar on 23/01/21.
//

import Foundation
import UIKit
import SkeletonView
extension UserSettingsVC{
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = false
        super.setupNavigationBarTitle(AppColor.header_color,false,ConstantTexts.ProfileLT, AppColor.whiteColor, leftBarButtonsType: [.empty], rightBarButtonsType: [.notification])
        super.isHiddenNavigationBar(false)
    }
    
    //TODO: Init values
    internal func initValues(){
        if self.customMethodManager == nil {
            self.customMethodManager = CustomMethodClass.shared
        }
        
        if self.settingsVM == nil {
            self.settingsVM = UserSettingsVM.shared
        }
        
        if  self.settingsListVM == nil{
            self.settingsListVM = self.settingsVM?.prepareDataSourceStatic()
        }
        
        
        self.initialSetup()
    }
    
    //TODO: IntialSetup
    private func initialSetup(){
        
        
        guard let user = customMethodManager?.getUser(entity: "User_Data") else{
            print("No user found...")
            return
        }
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        
        let myMutableString = NSMutableAttributedString()
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(user.first_name) \(user.last_name)", font: AppFont.SemiBold.size(AppFontName.Montserrat, size: 14), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\n\(user.email)", font: AppFont.Regular.size(AppFontName.Montserrat, size: 12), color: .darkGray) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\n\(ConstantTexts.C_CodeLT)\(ConstantTexts.HyphenLT)\(user.mobile)", font: AppFont.Medium.size(AppFontName.Montserrat, size: 12), color: .darkGray) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        self.lblDetail.attributedText = myMutableString
        self.customMethodManager?.setImage(imageView: self.imgViewProfile, url: user.picture)
        self.customMethodManager?.provideCornerRadiusTo(self.tblSetting, 20, [.layerMinXMinYCorner,.layerMaxXMinYCorner])
        self.registerNib()
    }
    
    
    //TODO: Show sekeleton animation
    internal func showAnimation(){
        DispatchQueue.main.async {
        self.tblSetting.showAnimatedSkeleton()
        self.lblDetail.showAnimatedSkeleton()
        self.imgViewProfile.showAnimatedSkeleton()
        self.btnEditProfileRef.showAnimatedSkeleton()
        }
    }
    
    //TODO: Show all fields
    internal func hideAnimation(){
        DispatchQueue.main.async {
            self.tblSetting.hideSkeleton()
            self.lblDetail.hideSkeleton()
            self.imgViewProfile.hideSkeleton()
            self.btnEditProfileRef.hideSkeleton()
        }
        
        
    }
    
    
    
    //TODO: register nib file
    private func registerNib(){
        self.tblSetting.register(nib: ProfileTableViewCell.className)
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
            /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
        }
    }
    
    
    //TODO: Perform table actions
    internal func perforAction(Index:Int){
        switch Index{
        
        
        case 0:
            
            let vc = AppStoryboard.profileSB.instantiateViewController(withIdentifier: VendorMangeAddressVC.className) as! VendorMangeAddressVC
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            let vc = AppStoryboard.profileSB.instantiateViewController(withIdentifier: ContactUsVC.className) as! ContactUsVC
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = AppStoryboard.vendorProfileSB.instantiateViewController(withIdentifier: ProfileAboutVC.className) as! ProfileAboutVC
            vc.isComingFromUserProfile = true
            vc.headerTitle = ConstantTexts.AboutUsLT
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = AppStoryboard.profileSB.instantiateViewController(withIdentifier: FAQ_VC.className) as! FAQ_VC
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 4:
            let vc = AppStoryboard.profileSB.instantiateViewController(withIdentifier: UnderConstructionVC.className) as! UnderConstructionVC
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 5:
            let vc = AppStoryboard.profileSB.instantiateViewController(withIdentifier: UnderConstructionVC.className) as! UnderConstructionVC
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        default:
            self.customMethodManager?.showAlertWithCancel(title: ConstantTexts.AppName, message: ConstantTexts.WantToLogoutALERT, btnOkTitle: ConstantTexts.OkBT, btnCancelTitle: ConstantTexts.CancelBT, callBack: { (status) in
                if status{
                    self.hitLogOutService()
                    
                }
            })
        }
    }
    
    
    
}


//MARK: - Extension web services
extension UserSettingsVC{
    
    //MARK: - Web services
    //TODO: Signup Service
    private func hitLogOutService(){
        
        if !NetworkState.isConnected() {
            customMethodManager?.showAlert(ConstantTexts.noInterNet, okButtonTitle: ConstantTexts.OkBT, target: nil)
            return
        }
        
        guard let user = customMethodManager?.getUser(entity: "User_Data") else{
            print("No user found...")
            return
        }
        let parameters = [Api_keys_model.id:user.id] as [String:AnyObject]
        self.showAnimation()
        ServiceClass.shared.webServiceBasicMethod(url: SAuthApi.logout, method: .post, parameters: parameters, header: nil, success: { (result) in
            self.hideAnimation()
            if let result_Dict = result as? NSDictionary{
                if let message = result_Dict.value(forKey: "message") as? String{
                    if message == "Logged out Successfully"{
                        print(result_Dict)
                        self.customMethodManager?.deleteAllData(entity: "User_Data", success: {
                            super.moveToNextViewCViaRoot(name: ConstantTexts.AuthSBT, withIdentifier: LoginVC.className)
                        })
                    }else{
                        if let message = result_Dict.value(forKey: "message") as? String{
                            self.customMethodManager?.showAlert(message, okButtonTitle: ConstantTexts.OkBT, target: self)
                        }
                    }
                }
            }
            
        }) { (error) in
            print(error)
            self.hideAnimation()
            if let errorString = (error as NSError).userInfo[ConstantTexts.errorMessage_Key] as? String{
                self.customMethodManager?.showAlert(errorString, okButtonTitle: ConstantTexts.OkBT, target: self)
            }else{
                self.customMethodManager?.showAlert(ConstantTexts.errorMessage, okButtonTitle: ConstantTexts.OkBT, target: self)
            }
        }
    }
}
