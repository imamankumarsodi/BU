//
//  StateCityDepnendencyInjection.swift
//  BU
//
//  Created by Aman Kumar on 08/02/21.
//

import Foundation
protocol StateCityDepnendencyInjection {
    //TODO: Prepare data static source implementations
    func prepareDataSourceState(with array: NSArray) -> (StateCityListViewModel,[String])
    func prepareDataSourceCity(with array: NSArray) -> (StateCityListViewModel,[String])
    
}
