//
//  BookingDeleteVC+MethodExtension.swift
//  BU
//
//  Created by Aman Kumar on 23/01/21.
//

import Foundation
import UIKit
extension BookingDeleteVC{
    //TODO: Init values
    internal func initValues(){
        self.initialSetup()
    }
    
    //TODO: IntialSetup
    private func initialSetup(){
        if self.customMethodManager == nil {
            self.customMethodManager = CustomMethodClass.shared
        }
        
        self.registerNib()
    }
    
    
    //TODO: register nib file
    private func registerNib(){
        self.tblList.register(nib: BookingTableViewCell.className)
        self.tblList.addSubview(self.refreshControl)
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
            /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
        }
    }
}



//MARK: - Extension web services
extension BookingDeleteVC{
    //MARK: - Web services
    //TODO: Signup Service
    internal func hitgetOrderList(){
        
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
        ServiceClass.shared.webServiceBasicMethod(url: SAuthApi.booking_lists, method: .post, parameters: parameters, header: nil, success: { (result) in
            UtilityHelper.sharedInstance.hideActivityIndicator()
            if let result_Dict = result as? NSDictionary{
                if let code = result_Dict.value(forKey: "status") as? Int{
                    if code == 200{
                        print(result_Dict)
                        if let bookingsArray = result_Dict.value(forKey: "response") as? NSArray{
                            if self.bookingVM == nil{
                                self.bookingVM = BookingsVM.shared
                                if let allBookings = self.bookingVM?.prepareDataSource(with: bookingsArray){
                                    self.cancelled_Bookings = allBookings.1
                                    
                                }
                            }else{
                                if let allBookings = self.bookingVM?.prepareDataSource(with: bookingsArray){
                                    self.cancelled_Bookings = allBookings.1
                                    
                                }
                            }
                            print(self.cancelled_Bookings?.numberOfRowsInSection(0))
                            self.cancelled_Bookings?.numberOfRowsInSection(0)
                            DispatchQueue.main.async {
                                self.tblList.reloadData()
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
            UtilityHelper.sharedInstance.hideActivityIndicator()
            if let errorString = (error as NSError).userInfo[ConstantTexts.errorMessage_Key] as? String{
                self.customMethodManager?.showAlert(errorString, okButtonTitle: ConstantTexts.OkBT, target: self)
            }else{
                self.customMethodManager?.showAlert(ConstantTexts.errorMessage, okButtonTitle: ConstantTexts.OkBT, target: self)
                
            }
        }
    }

}
