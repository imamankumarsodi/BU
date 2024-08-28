//
//  VendorChatVC+CustomMethodExtension.swift
//  BU
//
//  Created by Aman Kumar on 22/01/21.
//

import Foundation
import UIKit
extension VendorChatVC{
    //TODO: Init values
    internal func initValues(){
        self.initialSetup()
    }
    
    //TODO: IntialSetup
    private func initialSetup(){
        self.registerNib()
    }
    
    
    //TODO: register nib file
    private func registerNib(){
        self.tblChat.registerMultiple(nibs: [GreenMessageTableViewCell.className,BlueMessageTableViewCell.className])
    
    }
}
