//
//  VendorMangeAddressVC+TableViewExtension.swift
//  BU
//
//  Created by Aman Kumar on 24/01/21.
//

import Foundation
import UIKit
//MARK: - UITableViewDataSource extension
extension VendorMangeAddressVC:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return (self.addressDataListVM == nil) ? 0 : self.addressDataListVM?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.addressDataListVM?.numberOfRowsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddressTableViewCell.className, for: indexPath) as? AddressTableViewCell else {
            fatalError(ConstantTexts.unexpectedIndexPath)
        }
        cell.txtField.delegate = self
        
        guard let info = addressDataListVM?.dataStoreStructAtIndex(indexPath.row) else {
            fatalError(ConstantTexts.noDataIndexPath)
        }
        cell.configure(with: info)
        cell.btnSelected.tag = indexPath.row
        cell.btnSelected.addTarget(self, action: #selector(btnCountryTapped), for: .touchUpInside)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        self.footer.lblSignUpRef.isHidden = true
        self.footer.btnContinueRef.setTitle("\(ConstantTexts.SubmitBT)", for: .normal)
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 135
    }
    
}



//MARK: - UITableViewDelegate extension
extension VendorMangeAddressVC:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // fetch the animation from the TableAnimation enum and initialze the TableViewAnimator class
        let animation = currentTableAnimation.getAnimation()
        let animator = TableViewAnimator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
    
    
}
