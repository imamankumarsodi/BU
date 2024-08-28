//
//  BookingCompletedVC+UITableViewExtension.swift
//  BU
//
//  Created by Aman Kumar on 23/01/21.
//

import Foundation
import UIKit

//MARK: - UITableViewDataSource extension
extension BookingCompletedVC:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return (self.completed_Bookings == nil) ? 0 : self.completed_Bookings?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.completed_Bookings?.numberOfRowsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookingTableViewCell.className, for: indexPath) as? BookingTableViewCell else {
            fatalError(ConstantTexts.unexpectedIndexPath)
        }
        
        guard let info = completed_Bookings?.bookingAt(indexPath.row) else {
            fatalError(ConstantTexts.noDataIndexPath)
        }
        cell.configureForCompleted(with: info)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tblList.cellForRow(at: indexPath) as? BookingTableViewCell{
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
extension BookingCompletedVC:UITableViewDelegate{
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

