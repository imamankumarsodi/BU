//
//  VendorReviewVC+CustomMethodExtension.swift
//  BU
//
//  Created by Aman Kumar on 22/01/21.
//

import Foundation
import UIKit
extension VendorReviewVC{
    //TODO: Init values
    internal func initValues(){
        self.initialSetup()
    }
    
    //TODO: IntialSetup
    private func initialSetup(){
        if self.customMethodManager == nil {
            self.customMethodManager = CustomMethodClass.shared
        }
        
        if self.providerVM == nil {
            self.providerVM = SearchVM.shared
        }
        
        self.registerNib()
    }
    
    
    //TODO: register nib file
    private func registerNib(){
        self.tblList.register(nib: VendorReviewCell.className)
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
            self.tblList.addSubview(self.refreshControl)
            /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
        }
        
        self.hitGetReviews(provider_id: self.provider_id, service_id: self.service_id)
    }
    
    
    //TODO: Reload collection view
    internal func reloadTableView(){
        DispatchQueue.main.async {
            self.tblList.reloadData()
        }
    }
    
}



//MARK: - Extension web services
extension VendorReviewVC{
    //MARK: - Web services
    //TODO: Signup Service
    internal func hitGetReviews(provider_id:String,service_id:String){
        
        if !NetworkState.isConnected() {
            customMethodManager?.showAlert(ConstantTexts.noInterNet, okButtonTitle: ConstantTexts.OkBT, target: nil)
            return
        }
        
        
        let parameters = [Api_keys_model.provider_id:"\(provider_id)",
                          Api_keys_model.service_id:"\(service_id)"] as [String:AnyObject]
        
        UtilityHelper.sharedInstance.showActivityIndicator(color: AppColor.header_color)
        ServiceClass.shared.webServiceBasicMethod(url: SAuthApi.provider_profile, method: .post, parameters: parameters, header: nil, success: { (result) in
            UtilityHelper.sharedInstance.hideActivityIndicator()
            if let result_Dict = result as? NSDictionary{
                if let code = result_Dict.value(forKey: "status") as? Int{
                    if code == 200{
                        print(result_Dict)
                        DispatchQueue.main.async {
                            if let isAddedSubview = self.customMethodManager?.isSubviewAdded(parentView: self.tblList, childView: self.errorView){
                                if isAddedSubview{
                                    self.customMethodManager?.removeSubView(childView: self.errorView)
                                }
                            }
                        }
                        if let responseArray = result_Dict.value(forKey: "response") as? NSDictionary{
                            
                            if let reviewsArr = responseArray.value(forKey: "reviews") as? NSArray{
                                print(responseArray)
                                if  self.reviews == nil{
                                       self.reviews = self.providerVM?.prepareDataSource(with: reviewsArr)
                                }else{
                                    if let providers = self.providerVM?.prepareDataSource(with: reviewsArr).providers{
                                        self.reviews?.providers = providers
                                    }
                                }
                                
                                
                                //For checking pagination...
                                if let count = self.reviews?.providers.count{
                                    if count == 0{
                                        
                                        DispatchQueue.main.async {
                                            if let isAddedSubview = self.customMethodManager?.isSubviewAdded(parentView: self.tblList, childView: self.errorView){
                                                if !isAddedSubview{
                                                    self.customMethodManager?.setupError(chidView: self.errorView, message: ConstantTexts.NoDataFoundALERT, callback: {
                                                        self.self.customMethodManager?.showLottieAnimation(self.errorView.viewLottie, ConstantTexts.EmptyBoxNew, .loop)
                                                    })
                                                    
                                                    self.customMethodManager?.addSubView(parentView: self.tblList, childView: self.errorView)
                                                }
                                            }
                                        }
                                        
                                        
                                    }
                                }
                                
                                self.reloadTableView()
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
            
            if let count = self.reviews?.providers.count{
                if count > 0{
                    self.self.reviews?.providers.removeAll()
                }
            }
            
            self.reloadTableView()
            
            UtilityHelper.sharedInstance.hideActivityIndicator()
            
            if let _ = (error as NSError).userInfo[ConstantTexts.errorMessage_Key] as? String{
                
                let errorCode = (error as NSError).code
                if let animationDetail = self.customMethodManager?.getAnimationNameAndMessage(errorCode: errorCode){
                    DispatchQueue.main.async {
                        if let isAddedSubview = self.customMethodManager?.isSubviewAdded(parentView: self.tblList, childView: self.errorView){
                            if isAddedSubview{
                                
                                self.customMethodManager?.setupError(chidView: self.errorView, message: animationDetail.1,callback: {
                                    self.self.customMethodManager?.showLottieAnimation(self.errorView.viewLottie, animationDetail.0, .loop)
                                })
                                
                            }else{
                                self.customMethodManager?.setupError(chidView: self.errorView, message: animationDetail.1,callback: {
                                    self.self.customMethodManager?.showLottieAnimation(self.errorView.viewLottie, animationDetail.0, .loop)
                                })
                                
                                self.customMethodManager?.addSubView(parentView: self.tblList, childView: self.errorView)
                            }
                        }
                    }
                    
                }
                
            }else{
                DispatchQueue.main.async {
                    if let isAddedSubview = self.customMethodManager?.isSubviewAdded(parentView: self.tblList, childView: self.errorView){
                        if isAddedSubview{
                            
                            self.customMethodManager?.setupError(chidView: self.errorView, message: ConstantTexts.errorMessage, callback: {
                                self.self.customMethodManager?.showLottieAnimation(self.errorView.viewLottie, ConstantTexts.SomeThingWentWrong, .loop)
                            })
                            
                        }else{
                            self.customMethodManager?.setupError(chidView: self.errorView, message: ConstantTexts.errorMessage, callback: {
                                self.self.customMethodManager?.showLottieAnimation(self.errorView.viewLottie, ConstantTexts.SomeThingWentWrong, .loop)
                            })
                            
                            self.customMethodManager?.addSubView(parentView: self.tblList, childView: self.errorView)
                        }
                    }
                }
            }
        }
    }
}
