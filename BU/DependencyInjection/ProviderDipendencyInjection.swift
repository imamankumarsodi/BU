//
//  ProviderDipendencyInjection.swift
//  BU
//
//  Created by Aman Kumar on 01/02/21.
//

import Foundation
protocol ProviderDipendencyInjection {
    //TODO: Prepare data static source implementation
    func prepareDataSource(with array: NSArray) -> ProviderListViewModel
    
}
