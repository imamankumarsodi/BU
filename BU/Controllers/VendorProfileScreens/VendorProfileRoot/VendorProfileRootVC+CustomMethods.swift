//
//  VendorProfileRootVC+CustomMethods.swift
//  BU
//
//  Created by Aman Kumar on 21/01/21.
//

import Foundation
import UIKit

extension VendorProfileRootVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = true
        super.setupNavigationBarTitle(AppColor.header_color,false,headerTitle, AppColor.whiteColor, leftBarButtonsType: [.back], rightBarButtonsType: [.notification])
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
        
        if let info = self.info{
            self.setName("\(info.first_name) \(info.last_name)", "\(self.profession)")
            self.setPrice(Int(info.price) ?? 0)
            self.setDistance(Int(info.distance) ?? 0)
            self.setRating("\(info.rating)", Int(info.rating_count) ?? 0 )
            self.customMethodManager?.setImage(imageView: self.imgProfile, url: info.avatar)
            
        }
        
        
        
        self.hitgetServiceProviderDetailsById(provider_id: self.provider_id, service_id: self.service_id)
        
        
       
    }
    
    //TODO: Show sekeleton animation
    internal func showAnimation(){
        DispatchQueue.main.async {
            self.lblTitle.showAnimatedSkeleton()
            self.btnAboutRef.showAnimatedSkeleton()
            self.btnReviewRef.showAnimatedSkeleton()
            self.btnMessageRef.showAnimatedSkeleton()
            self.scrollView.showAnimatedSkeleton()
            
            self.imgProfile.showAnimatedSkeleton()
            
            self.viewPrice.showAnimatedSkeleton()
            self.imgPrice.showAnimatedSkeleton()
            self.lblPrice.showAnimatedSkeleton()
            

            self.viewDistence.showAnimatedSkeleton()
            self.imgDistence.showAnimatedSkeleton()
            self.lblDistance.showAnimatedSkeleton()

            
            self.viewRate.showAnimatedSkeleton()
            self.imgRate.showAnimatedSkeleton()
            self.lblRating.showAnimatedSkeleton()
            self.viewLine.showAnimatedSkeleton()
            
            self.btnHireNowRef.showAnimatedSkeleton()
            
        }
    }
    
    //TODO: Show all fields
    internal func hideAnimation(){
        DispatchQueue.main.async {

            self.lblTitle.hideSkeleton()
            self.btnAboutRef.hideSkeleton()
            self.btnReviewRef.hideSkeleton()
            self.btnMessageRef.hideSkeleton()
            self.scrollView.hideSkeleton()
            
            self.imgProfile.hideSkeleton()
            
            self.viewPrice.hideSkeleton()
            self.imgPrice.hideSkeleton()
            self.lblPrice.hideSkeleton()
            

            self.viewDistence.hideSkeleton()
            self.imgDistence.hideSkeleton()
            self.lblDistance.hideSkeleton()

            
            self.viewRate.hideSkeleton()
            self.imgRate.hideSkeleton()
            self.lblRating.hideSkeleton()
            self.viewLine.hideSkeleton()
            
            self.btnHireNowRef.hideSkeleton()
            
        }
        
        
    }
    
    
    //TODO: Set name
    internal func setName(_ name:String,_ profession:String){
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 2 // Whatever line spacing you want in points
        
        let myMutableString = NSMutableAttributedString()
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: name, font: AppFont.Medium.size(AppFontName.Montserrat, size: 14), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\n\(profession)", font: AppFont.Regular.size(AppFontName.Montserrat, size: 12), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        self.lblTitle.attributedText = myMutableString
    }
    
    
    //TODO: Set price
    internal func setPrice(_ price:Int){
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 2 // Whatever line spacing you want in points
        
        let myMutableString = NSMutableAttributedString()
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(ConstantTexts.CurLT)\(ConstantTexts.HyphenLT)\(price)", font: AppFont.Medium.size(AppFontName.Montserrat, size: 12), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\n\(ConstantTexts.PerDayLT)", font: AppFont.Regular.size(AppFontName.Montserrat, size: 10), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        self.lblPrice.attributedText = myMutableString
    }
    
    
    //TODO: Set price
    internal func setDistance(_ distance:Int){
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 2 // Whatever line spacing you want in points
        
        let myMutableString = NSMutableAttributedString()
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(distance)", font: AppFont.Medium.size(AppFontName.Montserrat, size: 12), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\n\(ConstantTexts.KmAwayLT)", font: AppFont.Regular.size(AppFontName.Montserrat, size: 10), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        self.lblDistance.attributedText = myMutableString
    }
    
    //TODO: Set price
    internal func setRating(_ rating:String,_ ratedBy:Int){
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 2 // Whatever line spacing you want in points
        
        let myMutableString = NSMutableAttributedString()
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\(rating)", font: AppFont.Medium.size(AppFontName.Montserrat, size: 12), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        myMutableString.append(self.customMethodManager?.provideSimpleAttributedText(text: "\n\(ConstantTexts.RatedByLT) \(ratedBy)", font: AppFont.Regular.size(AppFontName.Montserrat, size: 10), color: AppColor.header_color) ?? NSMutableAttributedString())
        
        // *** Apply attribute to string ***
        myMutableString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, myMutableString.length))
        // *** Set Attributed String to your label ***
        self.lblRating.attributedText = myMutableString
    }
    
    
    
   
}




//MARK: - Extension web services
extension VendorProfileRootVC{
    //MARK: - Web services
    //TODO: Signup Service
    internal func hitgetServiceProviderDetailsById(provider_id:String,service_id:String){
        
        if !NetworkState.isConnected() {
            customMethodManager?.showAlert(ConstantTexts.noInterNet, okButtonTitle: ConstantTexts.OkBT, target: nil)
            return
        }
        
        let parameters = [Api_keys_model.provider_id:"\(provider_id)",
                          Api_keys_model.service_id:"\(service_id)"] as [String:AnyObject]
        
        self.showAnimation()
        ServiceClass.shared.webServiceBasicMethod(url: SAuthApi.provider_profile, method: .post, parameters: parameters, header: nil, success: { (result) in
            self.hideAnimation()
            if let result_Dict = result as? NSDictionary{
                if let code = result_Dict.value(forKey: "status") as? Int{
                    if code == 200{
                        print(result_Dict)
                        
                        if let responseDict = result_Dict.value(forKey: "response") as? NSDictionary{
                            var desc:String = String()
                            if let description = responseDict.value(forKey: "description") as? String{
                                desc = description
                            }
                            
                            
                            var reviews:ProviderListViewModel?
                            
                            if let reviewsArr = responseDict.value(forKey: "reviews") as? NSArray{
                                var providerVM = SearchVM.shared
                                reviews = providerVM.prepareDataSource(with: reviewsArr)
                                
                                
                            }
                            
                            if let reviewsObj = reviews{
                                self.loadScrollViewWithcontroller(desc:desc,reviews:reviewsObj)
                            }
                            
                            
                        }
                        
                        
                       
                    }else{
                        if let message = result_Dict.value(forKey: "message") as? String{
                            self.customMethodManager?.showAlert(message, okButtonTitle: ConstantTexts.OkBT, target: self)
                        }
                    }
                }
            }
            
        }) {(error) in
            self.hideAnimation()
            if let errorString = (error as NSError).userInfo[ConstantTexts.errorMessage_Key] as? String{
                self.customMethodManager?.showAlert(errorString, okButtonTitle: ConstantTexts.OkBT, target: self)
            }else{
                self.customMethodManager?.showAlert(ConstantTexts.errorMessage, okButtonTitle: ConstantTexts.OkBT, target: self)
                
            }
        }
    }
    
    
    //TODO: Hit user address service
    internal func hitUser_addressService(){
        
        if !NetworkState.isConnected() {
            customMethodManager?.showAlert(ConstantTexts.noInterNet, okButtonTitle: ConstantTexts.OkBT, target: nil)
            return
        }
        
        
        guard let user = customMethodManager?.getUser(entity: "User_Data") else{
            print("No user found...")
            return
        }
        
        
        let parameters = [Api_keys_model.user_id:user.id] as [String:AnyObject]
        
        UtilityHelper.sharedInstance.showActivityIndicator(color: AppColor.header_color)
        ServiceClass.shared.webServiceBasicMethod(url: SAuthApi.user_address, method: .post, parameters: parameters, header: nil, success: { (result) in
            UtilityHelper.sharedInstance.hideActivityIndicator()
            if let result_Dict = result as? NSDictionary{
                if let code = result_Dict.value(forKey: "status") as? Int{
                    if code == 200{
                        print(result_Dict)
                            
                            if let responseArray = result_Dict.value(forKey: "response") as? NSArray{
                                if responseArray.count > 0{
                                    var addresses:[AddressDataModel] = [AddressDataModel]()
                                    for item in responseArray{
                                        if let itemDict = item as? NSDictionary{
                                            var address = AddressDataModel(address_type: String(), email: String(), first_name: String(), house_no: String(), id: String(), last_name: String(), locality: String(), mobile: String(), picture: String(), pincode: String(), state_id: String(), statename: String())
                                            
                                            
                                            if let address_type = itemDict.value(forKey: "address_type") as? Int{
                                                
                                                address.address_type = address_type == 1 ? ConstantTexts.HomeLT : ConstantTexts.OfficeLT
                                                
                                               
                                            }
                                            
                                            if let address_type = itemDict.value(forKey: "address_type") as? String{
                                                address.address_type = address_type == "1" ? ConstantTexts.HomeLT : ConstantTexts.OfficeLT
                                            }
                                            
                                            if let email = itemDict.value(forKey: "email") as? String{
                                                address.email = "\(email)"
                                            }
                                            
                                            if let first_name = itemDict.value(forKey: "first_name") as? String{
                                                address.first_name = "\(first_name)"
                                            }
                                            
                                            if let house_no = itemDict.value(forKey: "house_no") as? String{
                                                address.house_no = "\(house_no)"
                                            }
                                            
                                            if let id = itemDict.value(forKey: "id") as? String{
                                                address.id = "\(id)"
                                            }
                                            
                                            if let id = itemDict.value(forKey: "id") as? Int{
                                                address.id = "\(id)"
                                            }
                                            
                                            if let last_name = itemDict.value(forKey: "last_name") as? String{
                                                address.last_name = "\(last_name)"
                                            }
                                            
                                            if let locality = itemDict.value(forKey: "locality") as? String{
                                                address.locality = "\(locality)"
                                            }
                                            
                                            if let mobile = itemDict.value(forKey: "mobile") as? String{
                                                address.mobile = "\(mobile)"
                                            }
                                            
                                            if let picture = itemDict.value(forKey: "picture") as? String{
                                                address.picture = "\(picture)"
                                            }
                                            
                                            if let pincode = itemDict.value(forKey: "pincode") as? String{
                                                address.pincode = "\(pincode)"
                                            }
                                            
                                            if let state_id = itemDict.value(forKey: "state_id") as? String{
                                                address.state_id = "\(state_id)"
                                            }
                                            
                                            if let statename = itemDict.value(forKey: "statename") as? String{
                                                address.statename = "\(statename)"
                                            }
                                            
                                            
                                            addresses.append(address)
                                        }
                                    }
                                    
                                    let vc = AppStoryboard.vendorProfileSB.instantiateViewController(withIdentifier: ShowAddessPopupVC.className) as! ShowAddessPopupVC
                                    vc.addresses = addresses
                                    vc.address_id = addresses.last?.id ?? String()
                                    vc.service_id = self.service_id
                                    vc.provider_id = self.provider_id
                                    vc.amount = self.info?.price ?? String()
                                    vc.callBack = {
                                        self.navigationController?.popToRootViewController(animated: true)
                                        self.tabBarController?.selectedIndex = 1
                                    }
                                    self.navigationController?.present(vc, animated: true, completion: nil)
                                    
                                }else{
                                    self.customMethodManager?.showAlertWithCancel(title: ConstantTexts.AppName, message: ConstantTexts.EnterAddressALERT, btnOkTitle: ConstantTexts.OkBT, btnCancelTitle: ConstantTexts.CancelBT, callBack: { (ok) in
                                        if ok{
                                            let vc = AppStoryboard.profileSB.instantiateViewController(withIdentifier: VendorMangeAddressVC.className) as! VendorMangeAddressVC
                                            self.navigationController?.pushViewController(vc, animated: true)
                                        }
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


