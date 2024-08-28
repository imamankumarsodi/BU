//
//  EditUserProfileVC.swift
//  BU
//
//  Created by Aman Kumar on 09/02/21.
//

import UIKit

class EditUserProfileVC: BaseViewController {
    
    
    @IBOutlet weak var txtFieldFirstName: UITextField!
    @IBOutlet weak var txtFieldLastName: UITextField!
    @IBOutlet weak var txtFieldEmailAddress: UITextField!
    @IBOutlet weak var txtFieldPhoneNo: UITextField!
    @IBOutlet weak var txtViewMsg: UITextView!
    @IBOutlet weak var btnSubmitRef: UIButton!


    
    //MARK: - Variables
    internal var customMethodManager:CustomMethodProtocol?
    internal var validationMethodManager:ValidationProtocol?
    
    internal var pickerToolbar: UIToolbar?
    internal var datePicker = UIDatePicker()
    
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func btnEditProfileTapped(_ sender: UIButton) {
        
            UIView.animate(withDuration: 0.1,
                           animations: {
                            self.btnSubmitRef.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                           },
                           completion: { _ in
                            UIView.animate(withDuration: 0.1) {
                                self.btnSubmitRef.transform = CGAffineTransform.identity
                                self.validateFields { (strMsg, status, view) in
                                    if status{
                                        self.hitUpDateProfile()
                                    }else{
                                        self.customMethodManager?.showToolTip(msg: strMsg, anchorView: view, sourceView: self.view)
                                        view.becomeFirstResponder()
                                    }
                                }
                            }
                           })
        }
    
    
}


