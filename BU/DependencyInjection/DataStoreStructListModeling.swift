//
//  DataStoreStructListModeling.swift
//  BU
//
//  Created by Aman Kumar on 17/01/21.
//

import Foundation
protocol DataStoreStructListModeling {
    
    //TODO: Init values implementation
    func initValue()
    
    //TODO: Prepare data source implementation
    func prepareDataSource() -> DataStoreStruct_List_ViewModel
    
    func prepareDataSourceNew(item:AddressDataModel) -> DataStoreStruct_List_ViewModel
    
    //TODO: Validate fields implementation
    func validateFields(dataStore: DataStoreStruct_List_ViewModel, validHandler: @escaping ( String, Bool,Int,Int) -> Void)
 
}


extension DataStoreStructListModeling{
    func prepareDataSourceNew(item:AddressDataModel) -> DataStoreStruct_List_ViewModel{
        return DataStoreStruct_List_ViewModel([DataStoreStruct]())
    }
}
