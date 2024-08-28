//
//  VendorReviewVC+TableViewExtension.swift
//  BU
//
//  Created by Aman Kumar on 22/01/21.
//

import Foundation
import UIKit

//MARK: - UITableViewDataSource extension
extension VendorReviewVC:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return (self.reviews == nil) ? 0 : self.reviews?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reviews?.numberOfRowsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VendorReviewCell.className, for: indexPath) as? VendorReviewCell else {
            fatalError(ConstantTexts.unexpectedIndexPath)
        }
        
        guard let info = reviews?.providerAtIndex(indexPath.row) else {
            fatalError(ConstantTexts.noDataIndexPath)
        }
        
        cell.configure(with: info)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tblList.cellForRow(at: indexPath) as? VendorReviewCell{
            UIView.animate(withDuration: 0.1,
                           animations: {
                            cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                           },
                           completion: { _ in
                            UIView.animate(withDuration: 0.1) {
                                cell.transform = CGAffineTransform.identity
                               /* let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: SearchListVC.className) as! SearchListVC
                                self.navigationController?.pushViewController(vc, animated: true) */
                            }
                           })
        }
        
    }
    
    
}


//MARK: - UITableViewDelegate extension
extension VendorReviewVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // fetch the animation from the TableAnimation enum and initialze the TableViewAnimator class
        let animation = currentTableAnimation.getAnimation()
        let animator = TableViewAnimator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
    
    
}

