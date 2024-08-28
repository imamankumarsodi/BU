//
//  ContactUsVC.swift
//  Lawyer
//
//  Created by Aman Kumar on 09/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class ContactUsVC: BaseViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var imgHeader: UIImageView!
    @IBOutlet weak var lblMail: UILabel!
    @IBOutlet weak var lblContact: UILabel!
    @IBOutlet weak var lblInstruction: UILabel!
    @IBOutlet weak var contactUsTable: UITableView!
    @IBOutlet weak var btnCallBackRef: UIButton!
    
    //MARK: - Variables
    internal var customMethodManager:CustomMethodProtocol?
    internal var contactUsListModel: DataStoreStructListModeling?
    internal var dataListVM:DataStoreStruct_List_ViewModel?
    
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
    
    
    //MARK: - View life cycle methods
    //TODO: Implementation viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initValues()
    }
    
    //TODO: Implementation viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navSetup()
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    //MARK: - Actions, Gestures, Selectors
    
    //TODO: Selectors
    //Calls this function when the tap is recognized.
    
    
    
    //TODO: Actions
    @IBAction func btnCallBackTapped(_ sender: Any) {
           UIView.animate(withDuration: 0.1,
           animations: {
               self.customMethodManager?.provideShadowAndCornerRadius(self.btnCallBackRef, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.header_color, 0, 0, 0, 0, 0, AppColor.clearColor)
               self.btnCallBackRef.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
           },
           completion: { _ in
               UIView.animate(withDuration: 0.1) {
                   self.customMethodManager?.provideShadowAndCornerRadius(self.btnCallBackRef, 2, [.layerMinXMinYCorner, .layerMaxXMaxYCorner,.layerMaxXMinYCorner, .layerMinXMaxYCorner], AppColor.header_color, -1, 1, 1, 3, 0, AppColor.clearColor)
                   self.btnCallBackRef.transform = CGAffineTransform.identity
                   self.isValidate()
               }
           })
    
       }
}
