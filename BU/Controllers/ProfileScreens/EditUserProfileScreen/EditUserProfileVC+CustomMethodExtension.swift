//
//  EditUserProfileVC+CustomMethodExtension.swift
//  BU
//
//  Created by Aman Kumar on 09/02/21.
//

import Foundation
import UIKit
extension EditUserProfileVC{
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = true
        super.setupNavigationBarTitle(AppColor.header_color,false,ConstantTexts.EditProfileTitle, AppColor.whiteColor, leftBarButtonsType: [.back], rightBarButtonsType: [.notification])
        super.isHiddenNavigationBar(false)
    }
    
    //TODO: Init values
    internal func initValues(){
        if self.customMethodManager == nil {
            self.customMethodManager = CustomMethodClass.shared
        }
        
        if self.validationMethodManager == nil {
            self.validationMethodManager = ValidationClass.shared
        }
        
        self.txtViewMsg.font = AppFont.Italic.size(AppFontName.Montserrat, size: 15)
        self.txtViewMsg.text = ConstantTexts.WriteCommentNewPH
        self.txtViewMsg.textColor = AppColor.darkGrayColor
        self.txtViewMsg.delegate = self
        
        initialSetup()
    }
    
    
    //TODO: IntialSetup
    private func initialSetup(){
        guard let user = customMethodManager?.getUser(entity: "User_Data") else{
            print("No user found...")
            return
        }
        
        self.txtFieldFirstName.text = user.first_name
        self.txtFieldLastName.text = user.last_name
        self.txtFieldEmailAddress.text = user.email
        self.txtFieldPhoneNo.text = user.mobile
    }
    
    
    //TODO: Validate fields implementation
    internal func validateFields(validHandler: @escaping ( String,Bool,UITextField) -> Void){
        
        if !validationMethodManager!.checkEmptyField(self.txtFieldFirstName.text!.trimmingCharacters(in: .whitespaces)){
            validHandler(ConstantTexts.EnterFirstNameALERT,false,self.txtFieldFirstName)
            return
            
        }
        
        else if !validationMethodManager!.isValidFullName(self.txtFieldFirstName.text!.trimmingCharacters(in: .whitespaces)){
            
            validHandler( ConstantTexts.EnterValidFirstNameALERT, false,self.txtFieldFirstName)
            return
        }
        
        
        else if !validationMethodManager!.checkEmptyField(self.txtFieldLastName.text!.trimmingCharacters(in: .whitespaces)){
            validHandler( ConstantTexts.EnterLastNameALERT,false,self.txtFieldLastName)
            return
        }
        
        else if !validationMethodManager!.isValidFullName(self.txtFieldLastName.text!.trimmingCharacters(in: .whitespaces)){
            
            validHandler( ConstantTexts.EnterValidLastNameALERT, false,self.txtFieldLastName)
            return
        }
        
        else if !validationMethodManager!.checkEmptyField(self.txtFieldEmailAddress.text!.trimmingCharacters(in: .whitespaces)){
            validHandler( ConstantTexts.EnterEmailALERT, false,self.txtFieldEmailAddress)
            return
        }
        else if !validationMethodManager!.isValidEmail(self.txtFieldEmailAddress.text!.trimmingCharacters(in: .whitespaces)){
            validHandler( ConstantTexts.EnterValidEmailALERT, false,self.txtFieldEmailAddress)
            return
        }
        
        
        else if !validationMethodManager!.checkEmptyField(self.txtFieldPhoneNo.text!.trimmingCharacters(in: .whitespaces)) {
            validHandler( ConstantTexts.EnterMobileNumberALERT, false,self.txtFieldPhoneNo)
            return
            
        }
        else if !validationMethodManager!.isValidIndianPhoneCount(self.txtFieldPhoneNo.text!.trimmingCharacters(in: .whitespaces)){
            validHandler( ConstantTexts.EnterValidMobileNumberALERT, false,self.txtFieldPhoneNo)
            return
        }else{
            validHandler(ConstantTexts.empty, true, UITextField())
        }
 
        
    }
    
}



//MARK: - Extension web services
extension EditUserProfileVC{
    //MARK: - Web services
    //TODO: Signup Service
    internal func hitUpDateProfile(){
        
        if !NetworkState.isConnected() {
            customMethodManager?.showAlert(ConstantTexts.noInterNet, okButtonTitle: ConstantTexts.OkBT, target: nil)
            return
        }
        
        
        var user_saved = UserDataModel(access_token: String(), device_id: String(), device_token: String(), device_type: String(), email: String(), first_name: String(), full_name: String(), id: String(), last_name: String(), latitude: String(), longitude: String(), picture: String(), rating: String(), rating_count: String(), social_unique_id: String(), mobile: String(), stripe_cust_id: String(), wallet_balance: String(), login_by: String())
        
        
        guard let user = customMethodManager?.getUser(entity: "User_Data") else{
            print("No user found...")
            return
        }
        
        user_saved = user

        
        let parameters = [Api_keys_model.user_id:user.id,
                          Api_keys_model.first_name:self.txtFieldFirstName.text!.trimmingCharacters(in:.whitespacesAndNewlines),
                          Api_keys_model.last_name:self.txtFieldLastName.text!.trimmingCharacters(in:.whitespacesAndNewlines),
                          Api_keys_model.email:self.txtFieldEmailAddress.text!.trimmingCharacters(in:.whitespacesAndNewlines),
                          Api_keys_model.mobile:self.txtFieldPhoneNo.text!.trimmingCharacters(in:.whitespacesAndNewlines)] as [String:AnyObject]
        
        UtilityHelper.sharedInstance.showActivityIndicator(color: AppColor.header_color)
        ServiceClass.shared.webServiceBasicMethod(url: SAuthApi.update_profile, method: .post, parameters: parameters, header: nil, success: { (result) in
            UtilityHelper.sharedInstance.hideActivityIndicator()
            if let result_Dict = result as? NSDictionary{
                if let code = result_Dict.value(forKey: "status") as? Int{
                    if code == 200{
                        print(result_Dict)
                        
                        if let responseDict = result_Dict.value(forKey: "response") as? NSDictionary{
                            if let email = responseDict.value(forKey: "email") as? String{
                                user_saved.email = email
                            }
                            
                            if let first_name = responseDict.value(forKey: "first_name") as? String{
                                user_saved.first_name = first_name
                            }
                            
                            if let last_name = responseDict.value(forKey: "last_name") as? String{
                                user_saved.last_name = last_name
                            }
                            
                            if let mobile = responseDict.value(forKey: "mobile") as? String{
                                user_saved.mobile = mobile
                            }
                            
                            if let picture = responseDict.value(forKey: "picture") as? String{
                                user_saved.picture = picture
                            }
                            
                            self.customMethodManager?.saveDataToLocal_DB(userData: user_saved, callBack: {
                                _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: ConstantTexts.ProfileUpdateALERT, style: .success)
                                self.navigationController?.popViewController(animated: true)
                            })
                            
                        }
                        
                       

                    }else{
                        
                        
                        
                        
                        
                        if let message = result_Dict.value(forKey: "message") as? String{
                            self.customMethodManager?.showAlert(message, okButtonTitle: ConstantTexts.OkBT, target: self)
                        }
                    }
                }
            }
            
        }) {(error) in
            UtilityHelper.sharedInstance.hideActivityIndicator()
            if let errorString = (error as NSError).userInfo[ConstantTexts.errorMessage_Key] as? String{
                self.customMethodManager?.showAlert(errorString, okButtonTitle: ConstantTexts.OkBT, target: self)
            }else{
                self.customMethodManager?.showAlert(ConstantTexts.errorMessage, okButtonTitle: ConstantTexts.OkBT, target: self)
                
            }
        }
    }

}
