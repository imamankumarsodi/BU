//
//  SearchListVC.swift
//  BU
//
//  Created by Aman Kumar on 21/01/21.
//

import UIKit

class SearchListVC: BaseViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tblList: UITableView!
    //MARK: - Variables
    internal var customMethodManager:CustomMethodProtocol?
    
    internal var providerVM: ProviderDipendencyInjection?
    internal var providerListModels:ProviderListViewModel?
    internal var profession:String = String()

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
    
    //MARK: - Variables for Api
    internal var headerTitle:String = String()
    internal var service_id:String = String()
    internal var lati:String = String()
    internal var longi:String = String()
    internal let errorView: ErrorView  = Bundle.main.loadNibNamed(ErrorView.className, owner: self, options: nil)?.first as! ErrorView
    
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = AppColor.app_theame_color
        
        return refreshControl
    }()
    
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
    
    
    
    //TODO: Selectors
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.hitgetCategoriesServiceById(lat:self.lati,long:self.longi)
        refreshControl.endRefreshing()
        
    }

}
