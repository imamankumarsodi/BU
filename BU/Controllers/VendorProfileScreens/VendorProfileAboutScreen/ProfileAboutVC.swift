//
//  ProfileAboutVC.swift
//  BU
//
//  Created by Aman Kumar on 22/01/21.
//

import UIKit


class ProfileAboutVC: BaseViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var txtViewAbout: UITextView!
    
    //MARK: - Variables
    internal var customMethodManager:CustomMethodProtocol?
    internal var isComingFromUserProfile:Bool = Bool()
    internal var desc:String = String()
    internal var headerTitle:String = String()
    //MARK: - View life cycle methods
    //TODO: Implementation viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
       // self.initValues()
        print(desc)
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
