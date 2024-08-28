//
//  FAQ_DataModeling.swift
//  BU
//
//  Created by Aman Kumar on 24/01/21.
//

import Foundation
import Foundation
protocol FAQ_DataModeling {
    //TODO: Prepare data source implementation
    func prepareDataSource() -> [FAQItem]
    
    func prepareDataSourceWith(json:NSArray) -> [FAQItem]
}

extension FAQ_DataModeling{
    func prepareDataSourceWith(json:NSArray) -> [FAQItem]{
        return [FAQItem]()
    }
}
