//
//  ServiceClass.swift
//  Lawyer
//
//  Created by Aman Kumar on 17/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
import Reachability
import Alamofire


final class ServiceClass: SBaseService {
    //TODO: Singleton object
    static let shared = ServiceClass()
    private override init() {}
    
    public func webServiceBasicMethod(url:String, method:HTTPMethod, parameters:[String:Any]?, header:HTTPHeaders? = nil, success: @escaping (Any)-> (), failure: @escaping (Error)->()) -> Void {
        print(url)
        print(parameters as Any)
        
        
        if !NetworkState.isConnected() {
            failure(NSError(domain: ConstantTexts.Network_Error, code: 1009, userInfo: [ConstantTexts.errorMessage_Key : ConstantTexts.noInterNet]))
            return
        }
        
        
        guard let urlValue = URL(string: SBaseService().getServiceHostURL() + url) else{
            failure(NSError(domain: ConstantTexts.URL_Error, code: 400, userInfo: [ConstantTexts.errorMessage_Key : ConstantTexts.Invalid_URL]))
            return
        }
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 300
        
        print(urlValue)
        
        manager.request(urlValue, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: header).validate().responseJSON { response in
            
            switch (response.result){
            case .success(let value):
                success(value)
                
            case .failure(let error):
                failure(error)
            }
            
        }
        
        
    }
}
