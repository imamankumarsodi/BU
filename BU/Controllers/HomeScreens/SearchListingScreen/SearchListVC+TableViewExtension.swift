//
//  SearchListVC+TableViewExtension.swift
//  BU
//
//  Created by Aman Kumar on 21/01/21.
//

import Foundation
import UIKit
//MARK: - UITableViewDataSource extension
extension SearchListVC:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return (self.providerListModels == nil) ? 0 : self.providerListModels?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.providerListModels?.numberOfRowsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.className, for: indexPath) as? SearchResultTableViewCell else {
            fatalError(ConstantTexts.unexpectedIndexPath)
        }
        guard let info = providerListModels?.providerAtIndex(indexPath.row) else {
            fatalError(ConstantTexts.noDataIndexPath)
        }
        
        cell.configure(with: info)
        return cell
    }
}



//MARK: - UITableViewDelegate extension
extension SearchListVC:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tblList.cellForRow(at: indexPath) as? SearchResultTableViewCell{
            UIView.animate(withDuration: 0.1,
                           animations: {
                            cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                           },
                           completion: { _ in
                            UIView.animate(withDuration: 0.1) {
                                cell.transform = CGAffineTransform.identity
                                let vc = AppStoryboard.vendorProfileSB.instantiateViewController(withIdentifier: VendorProfileRootVC.className) as! VendorProfileRootVC
                                vc.service_id = self.service_id
                                if let provider_id = self.providerListModels?.providerAtIndex(indexPath.row).id as? String{
                                    vc.provider_id = provider_id
                                    
                                    
                                }
                                
                                var fullName: String = String()
                                
                                if let firstName = self.providerListModels?.providerAtIndex(indexPath.row).first_name as? String{
                                    fullName = firstName
                                    
                                    
                                }
                                
                                if let lastName = self.providerListModels?.providerAtIndex(indexPath.row).last_name as? String{
                                    fullName = "\(fullName) \(lastName)\(ConstantTexts.Abbervarion_LT)"                                    
                                }
                                vc.headerTitle = fullName
                                vc.info = self.providerListModels?.providerAtIndex(indexPath.row)
                                self.navigationController?.pushViewController(vc, animated: true)
                            }
                           })
        }
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // fetch the animation from the TableAnimation enum and initialze the TableViewAnimator class
        let animation = currentTableAnimation.getAnimation()
        let animator = TableViewAnimator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
    
    
}

