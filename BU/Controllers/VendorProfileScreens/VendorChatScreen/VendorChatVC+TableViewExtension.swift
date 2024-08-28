//
//  VendorChatVC+TableViewExtension.swift
//  BU
//
//  Created by Aman Kumar on 22/01/21.
//

import Foundation
import UIKit

//MARK: - UITableViewDataSource extension
extension VendorChatVC:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row%2 == 0{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: GreenMessageTableViewCell.className, for: indexPath) as? GreenMessageTableViewCell else {
                fatalError(ConstantTexts.unexpectedIndexPath)
            }
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BlueMessageTableViewCell.className, for: indexPath) as? BlueMessageTableViewCell else {
                fatalError(ConstantTexts.unexpectedIndexPath)
            }
            return cell
        }
        
        
    }
    
    
    
}


//MARK: - UITableViewDelegate extension
extension VendorChatVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

