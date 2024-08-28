//
//  BookingDepenedencyInjection.swift
//  BU
//
//  Created by Aman Kumar on 09/02/21.
//

import Foundation
protocol BookingDepenedencyInjection {
    //TODO: Prepare data static source implementations
    func prepareDataSource(with array: NSArray) -> (BookingListViewModel,BookingListViewModel,BookingListViewModel)
    
}
