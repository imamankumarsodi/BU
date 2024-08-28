//
//  BookingRootVC+MethodExtension.swift
//  BU
//
//  Created by Aman Kumar on 23/01/21.
//

import Foundation
import UIKit

extension BookingRootVC{
    
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = false
        super.setupNavigationBarTitle(AppColor.header_color,false,ConstantTexts.BookingsLT, AppColor.whiteColor, leftBarButtonsType: [.empty], rightBarButtonsType: [.notification])
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
        self.hitgetOrderList()
        
    }


}



//MARK: - Extension web services
extension BookingRootVC{
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
                                    self.loadScrollViewWithcontroller(upcomingBookings: allBookings.0, cancelledBookings: allBookings.1, completedBookings: allBookings.2)
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
