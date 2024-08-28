//
//  HomeSearchVC+TableViewExtension.swift
//  BU
//
//  Created by Aman Kumar on 21/01/21.
//

import Foundation
import UIKit
//MARK: - UITableViewDataSource extension
extension HomeSearchVC:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.className, for: indexPath) as? SearchTableViewCell else {
            fatalError(ConstantTexts.unexpectedIndexPath)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = searchTbl.cellForRow(at: indexPath) as? SearchTableViewCell{
            UIView.animate(withDuration: 0.1,
                           animations: {
                            cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                           },
                           completion: { _ in
                            UIView.animate(withDuration: 0.1) {
                                cell.transform = CGAffineTransform.identity
                                let vc = AppStoryboard.homeSB.instantiateViewController(withIdentifier: SearchListVC.className) as! SearchListVC
                                self.navigationController?.pushViewController(vc, animated: true)
                            }
                           })
        }
        
    }
    
    
}



//MARK: - UITableViewDelegate extension
extension HomeSearchVC:UITableViewDelegate{
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

