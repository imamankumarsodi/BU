//
//  FAQ_VC.swift
//  Lawyer
//
//  Created by Aman Kumar on 09/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import UIKit

class FAQ_VC: BaseViewController {

    //MARK: - Variables
    internal var faqView: FAQView!
    internal var faqVM: FAQ_DataModeling?
    
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

}
