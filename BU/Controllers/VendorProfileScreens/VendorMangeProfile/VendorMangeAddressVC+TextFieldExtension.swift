//
//  VendorMangeAddressVC+TextFieldExtension.swift
//  BU
//
//  Created by Aman Kumar on 24/01/21.
//

import Foundation
import UIKit
//MARK: - UITextFieldDelegate extension
extension VendorMangeAddressVC:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let currentIndexPath = customMethodManager?.getIndexPathFor(view: textField, tableView: self.manageTable) else { return true }
        let lastRowIndex = self.manageTable.numberOfRows(inSection: 0) - 1
        if currentIndexPath.row != lastRowIndex {
            let nextIndexPath = IndexPath(row: currentIndexPath.row + 1, section: 0)
            while nextIndexPath.row <= lastRowIndex {
                if let nextCell = self.manageTable.cellForRow(at: nextIndexPath) as? AddressTableViewCell {
                    self.manageTable.scrollToRow(at: nextIndexPath, at: .middle, animated: true)
                    nextCell.txtField?.returnKeyType = .next
                    if nextIndexPath.row == lastRowIndex {
                        nextCell.txtField?.returnKeyType = .done
                    }
                    nextCell.txtField?.becomeFirstResponder()
                    break
                }
            }
            textField.resignFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        let str = textField.text as String?
        if let index = customMethodManager?.getIndexPathFor(view: textField, tableView: self.manageTable) {
            if str?.count == 0 {
                
                self.addressDataListVM?.dataStoreStructAtIndex(index.row).dataStoreStruct.value = String()
            }
            else{
                self.addressDataListVM?.dataStoreStructAtIndex(index.row).dataStoreStruct.value = str ?? String()
            }
        }
    }
    
}
