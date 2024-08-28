//
//  VendorMangeAddressVC.swift
//  BU
//
//  Created by Aman Kumar on 24/01/21.
//

import UIKit
import DropDown

class VendorMangeAddressVC: BaseViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var manageTable: UITableView!
    
    //MARK: - Variables
    internal var customMethodManager:CustomMethodProtocol?
    internal var addressDataModel: DataStoreStructListModeling?
    internal var stateCityDataModelVM: StateCityDepnendencyInjection?
    internal var addressDataListVM:DataStoreStruct_List_ViewModel?
    
    
    internal var addressStateListVM:StateCityListViewModel?
    internal var states:[String] = [String]()
    internal var state_id:String = String()
    
    internal var addressCityListVM:StateCityListViewModel?
    internal var cities:[String] = [String]()
    internal var city_id:String = String()
    
    internal var isComingFromProfile:Bool = Bool()
    

    
    let footer: SignupFooterView  = Bundle.main.loadNibNamed(SignupFooterView.className, owner: self, options: nil)?.last as! SignupFooterView
    
    //MARK: - variables for the animate tableview
    internal var animationName = String()
    
    /// an enum of type TableAnimation - determines the animation to be applied to the tableViewCells
    internal var currentTableAnimation: TableAnimation = .fadeIn(duration: 0.85, delay: 0.03) {
        didSet {
            self.animationName = currentTableAnimation.getTitle()
        }
    }
    internal var animationDuration: TimeInterval = 0.85
    internal var delay: TimeInterval = 0.05
    
    
    internal let dropDown = DropDown()
    
    //MARK: - View life cycle methods
    //TODO: Implementation viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.initValues()
    }
    
    //TODO: Implementation viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navSetup()
    }
    
    
    //MARK: - Actions, Gestures, Selectors
    //TODO: Actions
    
    @objc func btnbtnContinueTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.footer.btnContinueRef.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.footer.btnContinueRef.transform = CGAffineTransform.identity
                            self.isValidate()
                        }
                       })
        
    }
    
    
    @objc  func btnCountryTapped(_ sender: UIButton) {
        
        let indexPath:IndexPath = IndexPath(row: sender.tag, section: 0)
        if let cell = manageTable.cellForRow(at: indexPath) as? AddressTableViewCell{
            
            if sender.tag == 0{
                
                self.customMethodManager?.openDownOnViewBottomDirection(dropDown: self.dropDown, array: [ConstantTexts.Address_TypeLT,ConstantTexts.HomeLT,ConstantTexts.OfficeLT], anchor: cell.btnSelected, callBack: { (dropDown) in
                    
                    dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                        print("Selected item: \(item) at index: \(index)")
                        
                        if item == ConstantTexts.Address_TypeLT{
                            cell.txtField.text = ConstantTexts.empty
                            self.addressDataListVM?.dataStoreStructs[sender.tag].value = ConstantTexts.empty
                        }else{
                            cell.txtField.text = item.trimmingCharacters(in: .whitespacesAndNewlines)
                            self.addressDataListVM?.dataStoreStructs[sender.tag].value = item.trimmingCharacters(in: .whitespacesAndNewlines)
                        }
                    }
                })
            }else if sender.tag == 3{
                
                self.customMethodManager?.openDownOnViewBottomDirection(dropDown: self.dropDown, array: self.states, anchor: cell.btnSelected, callBack: { (dropDown) in
                    
                    dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                        print("Selected item: \(item) at index: \(index)")
                        
                        if item == ConstantTexts.State_PH{
                            cell.txtField.text = ConstantTexts.empty
                            self.addressDataListVM?.dataStoreStructs[sender.tag].value = ConstantTexts.empty
                            self.state_id = ConstantTexts.empty
                            
                        }else{
                            cell.txtField.text = item.trimmingCharacters(in: .whitespacesAndNewlines)
                            self.addressDataListVM?.dataStoreStructs[sender.tag].value = item.trimmingCharacters(in: .whitespacesAndNewlines)
                            self.state_id = self.addressStateListVM?.itemAtIndex(index).id ?? ConstantTexts.empty
                            self.hitgetCities(id: self.addressStateListVM?.itemAtIndex(index).id ?? ConstantTexts.empty)
                        }
                    }
                })
            }else{
                
                if self.addressDataListVM?.dataStoreStructs[sender.tag - 1].value.trimmingCharacters(in: .whitespacesAndNewlines) != ConstantTexts.empty{
                    
                    
                    
                    self.customMethodManager?.openDownOnViewBottomDirection(dropDown: self.dropDown, array: self.cities, anchor: cell.btnSelected, callBack: { (dropDown) in
                        
                        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                            print("Selected item: \(item) at index: \(index)")
                            
                            if item == ConstantTexts.City_PH{
                                cell.txtField.text = ConstantTexts.empty
                                self.addressDataListVM?.dataStoreStructs[sender.tag].value = ConstantTexts.empty
                                self.city_id = ConstantTexts.empty
                            }else{
                                cell.txtField.text = item.trimmingCharacters(in: .whitespacesAndNewlines)
                                self.addressDataListVM?.dataStoreStructs[sender.tag].value = item.trimmingCharacters(in: .whitespacesAndNewlines)
                                
                                self.city_id = self.addressCityListVM?.itemAtIndex(index).id ?? ConstantTexts.empty
                                
                            }
                        }
                    })
                }else{
                    
                    let indexPath = IndexPath(row: sender.tag - 1, section: 0)
                    if let cell = self.manageTable.cellForRow(at: indexPath) as? AddressTableViewCell{
                        self.customMethodManager?.showToolTip(msg: ConstantTexts.SelectStateFirstALERT, anchorView: cell.txtField, sourceView: self.view)
                    }

                    
                   
                }

            }
        }
    }
    
}
