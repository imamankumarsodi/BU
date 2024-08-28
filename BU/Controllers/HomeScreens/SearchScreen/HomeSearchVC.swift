//
//  HomeSearchVC.swift
//  BU
//
//  Created by Aman Kumar on 20/01/21.
//

import UIKit

class HomeSearchVC: BaseViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTbl: UITableView!
    //MARK: - Variables
    internal var customMethodManager:CustomMethodProtocol?
    
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

}
