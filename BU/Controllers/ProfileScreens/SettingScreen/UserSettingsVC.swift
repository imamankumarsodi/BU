//
//  UserSettingsVC.swift
//  BU
//
//  Created by Aman Kumar on 23/01/21.
//

import UIKit

class UserSettingsVC: BaseViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tblSetting: UITableView!
    @IBOutlet weak var lblDetail: UILabel!
    
    @IBOutlet weak var imgViewProfile: UIImageView!
    @IBOutlet weak var btnEditProfileRef: UIButton!
    
        //MARK: - Variables
    internal var customMethodManager:CustomMethodProtocol?
    internal var settingsVM: CategoryListModeling?
    internal var settingsListVM:CategoryListViewModel?
    
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
        
        
    }
    
    //TODO: Implementation viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navSetup()
        self.initValues()
    }
    
    @IBAction func btnEditProfileTapped(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: EditUserProfileVC.className) as! EditUserProfileVC
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
   
}
