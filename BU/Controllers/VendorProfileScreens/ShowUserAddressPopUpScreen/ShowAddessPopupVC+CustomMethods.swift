//
//  ShowAddessPopupVC+CustomMethods.swift
//  BU
//
//  Created by Aman Kumar on 09/02/21.
//

import Foundation
import UIKit
extension ShowAddessPopupVC{
    //TODO: Navigation setup implenemtation
    internal func navSetup(){
        self.tabBarController?.tabBar.isHidden = true
        super.setupNavigationBarTitle(AppColor.header_color,false," \(ConstantTexts.ManageAddressTitle)", AppColor.whiteColor, leftBarButtonsType: [.back], rightBarButtonsType: [.notification])
        super.isHiddenNavigationBar(false)
    }
    
    
    //TODO: Init values
    internal func initValues(){
        if self.customMethodManager == nil {
            self.customMethodManager = CustomMethodClass.shared
        }
        
        if self.addressDataModel == nil {
            self.addressDataModel = ShowAddessPopupVM.shared
        }
        
        if self.stateCityDataModelVM == nil{
            self.stateCityDataModelVM = ShowAddessPopupVM.shared
        }
        
       
        
        
        
        
        self.initialSetup()
    }
    
    //TODO: IntialSetup
    private func initialSetup(){
        self.footer.btnUpdateRef.addTarget(self, action: #selector(btnUpDateTapped), for: .touchUpInside)
        
        self.footer.btnContinueRef.addTarget(self, action: #selector(btnContiueTapped), for: .touchUpInside)
        
        self.registerNib()
    }
    
    
    //TODO: register nib file
    private func registerNib(){
        self.manageTable.register(nib: AddressTableViewCell.className)
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.currentTableAnimation =  TableAnimation.fadeIn(duration: self.animationDuration, delay: self.delay)
            /* self.currentTableAnimation = TableAnimation.moveUpWithFade(rowHeight: 60,duration: self.animationDuration, delay: self.delay) */
        }
        if  self.addressDataListVM == nil{
            
            if let address = self.addresses.first{
                print(address.address_type)
                self.addressDataListVM = self.addressDataModel?.prepareDataSourceNew(item: address)
            }
            
        }
        self.manageTable.reloadData()
        self.hitgetStates()
    }
    
    //TODO: Show sekeleton animation
    internal func showAnimation(){
        DispatchQueue.main.async {
            self.manageTable.showAnimatedSkeleton()
            self.footer.btnContinueRef.showAnimatedSkeleton()
        }
    }
    
    //TODO: Show all fields
    internal func hideAnimation(){
        DispatchQueue.main.async {

            self.manageTable.hideSkeleton()
            self.footer.btnContinueRef.hideSkeleton()
            
        }
        
        
    }

    
    
    //TODO: setup validation
    internal func isValidate(){
        super.dismissKeyboard()
        if let dataListVM_T = self.addressDataListVM{
            self.addressDataModel?.validateFields(dataStore: dataListVM_T, validHandler: { (strMsg, status, row, section) in
                if status{
                self.hitAddAddressService()
                    
                }else{
                    let indexPath = IndexPath(row: row, section: section)
                    self.manageTable.scrollToRow(at: indexPath,
                                                   at: .top,
                                                   animated: true)
                    if let cell = self.manageTable.cellForRow(at: indexPath) as? AddressTableViewCell{
                        self.customMethodManager?.showToolTip(msg: strMsg, anchorView: cell.txtField, sourceView: self.view)
                        if row != 0 || row != 3 || row != 4{
                            cell.txtField.becomeFirstResponder()
                        }
                        
                    }
                }
            })
        }
    }
    
    //TODO: Show blurr view
    internal func rateUs() {
        self.viewDateBg.isHidden = false
        UIView.animate(withDuration: 0.3, animations: {
            self.viewDateBg.alpha = 1
        }) { (status) in
            self.viewDateBg.alpha = 1
        }
        
    }
    
    
    //TODO: Implementation hide blur view
    internal func hideBlurView(){
        UIView.animate(withDuration: 0.3, animations: {
            self.viewDateBg.alpha = 0
        }) { (status) in
            self.viewDateBg.alpha = 0
            self.viewDateBg.isHidden = true
        }
        
    }
    
    //TODO: Implementation successfully hide blur view
    internal func hideSuccessfullyBlurView(){
        UIView.animate(withDuration: 0.3, animations: {
            self.viewDateBg.alpha = 0
        }) { (status) in
            self.viewDateBg.alpha = 0
            self.viewDateBg.isHidden = true
            let date = self.datePicker.date
            let dateFormatter = DateFormatter()
            // Set Date Format
            dateFormatter.dateFormat = "YYYY-MM-dd"
            // Convert Date to String
            let dateStr = dateFormatter.string(from: date)
            self.hitHireService(date: dateStr)
            
        }
        
    }
    
    
}


//MARK: - Extension web services
extension ShowAddessPopupVC{
    //MARK: - Web services
    //TODO: State list Service
    internal func hitgetStates(){
        
        if !NetworkState.isConnected() {
            customMethodManager?.showAlert(ConstantTexts.noInterNet, okButtonTitle: ConstantTexts.OkBT, target: nil)
            return
        }
        self.showAnimation()
        ServiceClass.shared.webServiceBasicMethod(url: SAuthApi.user_state, method: .post, parameters: nil, header: nil, success: { (result) in
            self.hideAnimation()
            if let result_Dict = result as? NSDictionary{
                if let code = result_Dict.value(forKey: "status") as? Int{
                    if code == 200{
                        print(result_Dict)
                        if let array = result_Dict.value(forKey: "response") as? NSArray{
                            
                            if let stateItems = self.stateCityDataModelVM?.prepareDataSourceState(with: array).0{
                                self.addressStateListVM = stateItems
                            }
                            
                            if let stateItemStrings = self.stateCityDataModelVM?.prepareDataSourceState(with: array).1{
                                self.states = stateItemStrings
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
    
    
    //TODO: State list Service
    internal func hitgetCities(id:String){
        
        if !NetworkState.isConnected() {
            customMethodManager?.showAlert(ConstantTexts.noInterNet, okButtonTitle: ConstantTexts.OkBT, target: nil)
            return
        }
        
        let parameters = [Api_keys_model.state_id:id] as [String:AnyObject]
        
        UtilityHelper.sharedInstance.showActivityIndicator(color: AppColor.header_color)
        ServiceClass.shared.webServiceBasicMethod(url: SAuthApi.user_city, method: .post, parameters: parameters, header: nil, success: { (result) in
            UtilityHelper.sharedInstance.hideActivityIndicator()
            if let result_Dict = result as? NSDictionary{
                if let code = result_Dict.value(forKey: "status") as? Int{
                    if code == 200{
                        print(result_Dict)
                        if let array = result_Dict.value(forKey: "response") as? NSArray{
                            
                            if let cityItems = self.stateCityDataModelVM?.prepareDataSourceCity(with: array).0{
                                self.addressCityListVM = cityItems
                            }
                            
                            if let cityItemStrings = self.stateCityDataModelVM?.prepareDataSourceCity(with: array).1{
                                self.cities = cityItemStrings
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
                                    //yaha booking ki api hit karni hai...
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
    
    
    
    //TODO: Hit user address service
    internal func hitAddAddressService(){
        
        if !NetworkState.isConnected() {
            customMethodManager?.showAlert(ConstantTexts.noInterNet, okButtonTitle: ConstantTexts.OkBT, target: nil)
            return
        }
        
        
        guard let user = customMethodManager?.getUser(entity: "User_Data") else{
            print("No user found...")
            return
        }
        
        
        let address_type = self.addressDataListVM?.dataStoreStructAtIndex(0).value == ConstantTexts.HomeLT ? "1" : "2"
    
        let parameters = [Api_keys_model.user_id:user.id,
                          Api_keys_model.address_type:address_type,
                          Api_keys_model.address:self.addressDataListVM?.dataStoreStructAtIndex(1).value,
                          Api_keys_model.locality:self.addressDataListVM?.dataStoreStructAtIndex(2).value,
                          Api_keys_model.state_id:self.state_id,
                          Api_keys_model.city_id:self.city_id,
                          Api_keys_model.pincode:self.addressDataListVM?.dataStoreStructAtIndex(5).value] as [String:AnyObject]
        
        UtilityHelper.sharedInstance.showActivityIndicator(color: AppColor.header_color)
        ServiceClass.shared.webServiceBasicMethod(url: SAuthApi.add_address, method: .post, parameters: parameters, header: nil, success: { (result) in
            UtilityHelper.sharedInstance.hideActivityIndicator()
            if let result_Dict = result as? NSDictionary{
                if let code = result_Dict.value(forKey: "status") as? Int{
                    if code == 200{
                        print(result_Dict)
                            
                        _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: ConstantTexts.AddressUpdateALERT, style: .success)
                        self.navigationController?.popViewController(animated: true)
                            
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
    
    
    
    //TODO: Hit Hire service
    internal func hitHireService(date:String){
        
        if !NetworkState.isConnected() {
            customMethodManager?.showAlert(ConstantTexts.noInterNet, okButtonTitle: ConstantTexts.OkBT, target: nil)
            return
        }
        
        
        guard let user = customMethodManager?.getUser(entity: "User_Data") else{
            print("No user found...")
            return
        }
       
        let parameters = [Api_keys_model.user_id:user.id,
                          Api_keys_model.service_id:self.service_id,
                          Api_keys_model.provider_id:self.provider_id,
                          Api_keys_model.service_date:date,
                          Api_keys_model.address_id:self.address_id,
                          Api_keys_model.amount:self.amount] as [String:AnyObject]
        
        UtilityHelper.sharedInstance.showActivityIndicator(color: AppColor.header_color)
        ServiceClass.shared.webServiceBasicMethod(url: SAuthApi.hire_provider, method: .post, parameters: parameters, header: nil, success: { (result) in
            UtilityHelper.sharedInstance.hideActivityIndicator()
            if let result_Dict = result as? NSDictionary{
                if let code = result_Dict.value(forKey: "status") as? Int{
                    if code == 200{
                        print(result_Dict)
                        
                        _ = SweetAlert().showAlert(ConstantTexts.AppName, subTitle: ConstantTexts.AddServiceALERT, style: .success, buttonTitle: ConstantTexts.OkBT, action: { (success) in
                            self.dismiss(animated: true) {
                                self.callBack?()
                                
                            }
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
            UtilityHelper.sharedInstance.hideActivityIndicator()
            if let errorString = (error as NSError).userInfo[ConstantTexts.errorMessage_Key] as? String{
                self.customMethodManager?.showAlert(errorString, okButtonTitle: ConstantTexts.OkBT, target: self)
            }else{
                self.customMethodManager?.showAlert(ConstantTexts.errorMessage, okButtonTitle: ConstantTexts.OkBT, target: self)
                
            }
        }
    }
    
}
