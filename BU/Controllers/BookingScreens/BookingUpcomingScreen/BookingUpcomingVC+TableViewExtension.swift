//
//  BookingUpcomingVC+TableViewExtension.swift
//  BU
//
//  Created by Aman Kumar on 23/01/21.
//

import Foundation
import UIKit

//MARK: - UITableViewDataSource extension
extension BookingUpcomingVC:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return (self.upcoming_Bookings == nil) ? 0 : self.upcoming_Bookings?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.upcoming_Bookings?.numberOfRowsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookingNewTableViewCell.className, for: indexPath) as? BookingNewTableViewCell else {
            fatalError(ConstantTexts.unexpectedIndexPath)
        }
        guard let info = upcoming_Bookings?.bookingAt(indexPath.row) else {
            fatalError(ConstantTexts.noDataIndexPath)
        }
        cell.configureForUpcoming(with: info)
        cell.btnCancelRef.tag = indexPath.row
        cell.btnCancelRef.addTarget(self, action: #selector(btnCancelTapped), for: .touchUpInside)
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
extension BookingUpcomingVC:UITableViewDelegate{
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

