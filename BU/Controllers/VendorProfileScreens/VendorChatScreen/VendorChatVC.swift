//
//  VendorChatVC.swift
//  BU
//
//  Created by Aman Kumar on 22/01/21.
//

import UIKit

class VendorChatVC: BaseViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var tblChat: UITableView!
    
    //MARK: - View life cycle methods
    //TODO: Implementation viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initValues()
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
