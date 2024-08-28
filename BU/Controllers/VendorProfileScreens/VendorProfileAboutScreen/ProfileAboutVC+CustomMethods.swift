//
//  ProfileAboutVC+CustomMethods.swift
//  BU
//
//  Created by Aman Kumar on 24/01/21.
//

import Foundation
import UIKit

extension ProfileAboutVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = true
        super.isHiddenNavigationBar(false)
        if self.isComingFromUserProfile{
            super.setupNavigationBarTitle(AppColor.whiteColor,false,self.headerTitle, AppColor.header_color, leftBarButtonsType: [.backBlack], rightBarButtonsType: [.empty])
        }else{
            super.setupNavigationBarTitle(AppColor.header_color,false,self.headerTitle, AppColor.whiteColor, leftBarButtonsType: [.back], rightBarButtonsType: [.notification])
            self.txtViewAbout.text = desc
        }

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
        if isComingFromUserProfile{
            self.hitAboutService()
        }
        
    }
    

}


//MARK: - Extension web services
extension ProfileAboutVC{
    //MARK: - Web services
    //TODO: Check mobile number existense in database
    private func hitAboutService(){
        
        if !NetworkState.isConnected() {
            customMethodManager?.showAlert(ConstantTexts.noInterNet, okButtonTitle: ConstantTexts.OkBT, target: nil)
            return
        }
        
    
        
        UtilityHelper.sharedInstance.showActivityIndicator(color: AppColor.header_color)
        ServiceClass.shared.webServiceBasicMethod(url: SAuthApi.about, method: .post, parameters: nil, header: nil, success: { (result) in
            UtilityHelper.sharedInstance.hideActivityIndicator()
            if let result_Dict = result as? NSDictionary{
                if let code = result_Dict.value(forKey: "status") as? Int{
                    if code == 200{
                       
                        if let array = result_Dict.value(forKey: "response") as? NSArray{
                            for item in array{
                                if let itemDict = item as? NSDictionary{
                                    if let value = itemDict.value(forKey: "value") as? String{
                                        self.txtViewAbout.text = self.txtViewAbout.text! + " " + value
                                    }
                                }
                            }
                        }
                        
                    }else{
                        if let message = result_Dict.value(forKey: "message") as? String{
                            self.customMethodManager?.showAlert(message, okButtonTitle: ConstantTexts.OkBT, target: self)
                        }
                    }
                }
            }
            
        }) { (error) in
            print(error)
            UtilityHelper.sharedInstance.hideActivityIndicator()
            if let errorString = (error as NSError).userInfo[ConstantTexts.errorMessage_Key] as? String{
                self.customMethodManager?.showAlert(errorString, okButtonTitle: ConstantTexts.OkBT, target: self)
            }else{
                self.customMethodManager?.showAlert(ConstantTexts.errorMessage, okButtonTitle: ConstantTexts.OkBT, target: self)
                
            }
        }
    }
    
    
    private func hitSocialLoginService(user:UserDataModel){
        if !NetworkState.isConnected() {
            customMethodManager?.showAlert(ConstantTexts.noInterNet, okButtonTitle: ConstantTexts.OkBT, target: nil)
            return
        }
        
        guard let FirebaseId = USER_DEFAULTS.value(forKey: ConstantTexts.deviceToken) as? String else {
            print("No FirebaseId found...")
            return
        }
        
        
        let parameters = [Api_keys_model.social_unique_id:user.social_unique_id,
                          Api_keys_model.login_by:user.login_by,
                          Api_keys_model.first_name:user.first_name,
                          Api_keys_model.last_name:user.last_name,
                          Api_keys_model.email:user.email,
                          Api_keys_model.mobile:user.mobile,
                          Api_keys_model.device_type:user.device_type,
                          Api_keys_model.device_token:FirebaseId,
                          Api_keys_model.device_id:FirebaseId] as [String:AnyObject]
        
        UtilityHelper.sharedInstance.showActivityIndicator(color: AppColor.header_color)
        ServiceClass.shared.webServiceBasicMethod(url: SAuthApi.social_login, method: .post, parameters: parameters, header: nil, success: { (result) in
            UtilityHelper.sharedInstance.hideActivityIndicator()
            if let result_Dict = result as? NSDictionary{
                if let code = result_Dict.value(forKey: "status") as? Int{
                    if code == 200{
                        
                        print(result_Dict)
                        if let responseDict = result_Dict.value(forKey: "response") as? NSDictionary{
                            
                            
                            if let userData = self.customMethodManager?.getUserModelFromApi(responseDict: responseDict){
                                self.customMethodManager?.saveDataToLocal_DB(userData: userData, callBack: {
                                    let vc = AppStoryboard.tabBarSB.instantiateViewController(withIdentifier: TabBarVC.className) as! TabBarVC
                                    UIApplication.shared.windows.first?.rootViewController = vc
                                    UIApplication.shared.windows.first?.makeKeyAndVisible()
                                })
                            }
                            
                            
                        }
                    }else{
                        
                        if let message = result_Dict.value(forKey: "message") as? String{
                            self.customMethodManager?.showAlert(message, okButtonTitle: ConstantTexts.OkBT, target: self)
                        }
                    }
                }
            }
            
        }) { (error) in
            print(error)
            UtilityHelper.sharedInstance.hideActivityIndicator()
            if let errorString = (error as NSError).userInfo[ConstantTexts.errorMessage_Key] as? String{
                self.customMethodManager?.showAlert(errorString, okButtonTitle: ConstantTexts.OkBT, target: self)
            }else{
                self.customMethodManager?.showAlert(ConstantTexts.errorMessage, okButtonTitle: ConstantTexts.OkBT, target: self)
                
            }
        }
    }
    
}
