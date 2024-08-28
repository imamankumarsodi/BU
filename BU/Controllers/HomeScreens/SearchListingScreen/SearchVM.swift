//
//  SearchVM.swift
//  BU
//
//  Created by Aman Kumar on 01/02/21.
//

import Foundation
import UIKit
class SearchVM: ProviderDipendencyInjection {
    
    //TODO: Singleton object
    static let shared = SearchVM()
    private init() {}
    
    
    func prepareDataSource(with array: NSArray) -> ProviderListViewModel{
        var providers = [ProvideModel]()
        for item in array{
            if let itemDict = item as? NSDictionary{
                var provider = ProvideModel(id: String(), first_name: String(), last_name: String(), email: String(), mobile: String(), avatar: String(), description: String(), rating: String(), status: String(), latitude: String(), longitude: String(), rating_count: String(), otp: String(), distance: String(), price: String())
                if let id = itemDict.value(forKey: "id") as? String{
                    provider.id = id
                }
                
                if let id = itemDict.value(forKey: "id") as? Int{
                    provider.id = "\(id)"
                }
                
                
                if let user_id = itemDict.value(forKey: "user_id") as? String{
                    provider.id = user_id
                }
                
                if let user_id = itemDict.value(forKey: "user_id") as? Int{
                    provider.id = "\(user_id)"
                }
                
                
                if let first_name = itemDict.value(forKey: "first_name") as? String{
                    provider.first_name = "\(first_name)"
                }
                
                if let last_name = itemDict.value(forKey: "last_name") as? String{
                    provider.last_name = "\(last_name)"
                }
                
                if let email = itemDict.value(forKey: "email") as? String{
                    provider.email = "\(email)"
                }
                
                if let mobile = itemDict.value(forKey: "mobile") as? String{
                    provider.mobile = "\(mobile)"
                }
                
                if let mobile = itemDict.value(forKey: "mobile") as? Int{
                    provider.mobile = "\(mobile)"
                }
                
                if let avatar = itemDict.value(forKey: "avatar") as? String{
                    provider.avatar = "\(avatar)"
                }
                
                if let picture = itemDict.value(forKey: "picture") as? String{
                    provider.avatar = "\(picture)"
                }
                
                
                if let description = itemDict.value(forKey: "description") as? String{
                    provider.description = "\(description)"
                }
                
                if let review = itemDict.value(forKey: "review") as? String{
                    provider.description = "\(review)"
                }
                
                if let status = itemDict.value(forKey: "status") as? String{
                    provider.status = "\(status)"
                }
                
                if let latitude = itemDict.value(forKey: "latitude") as? String{
                    provider.latitude = "\(latitude)"
                }
                
                if let latitude = itemDict.value(forKey: "latitude") as? Double{
                    provider.latitude = "\(latitude)"
                }
                
                if let longitude = itemDict.value(forKey: "longitude") as? String{
                    provider.longitude = "\(longitude)"
                }
                
                if let longitude = itemDict.value(forKey: "longitude") as? Double{
                    provider.longitude = "\(longitude)"
                }
                
                
                if let rating_count = itemDict.value(forKey: "rating_count") as? Int{
                    provider.rating_count = "\(rating_count)"
                }
                
                
                if let rating_count = itemDict.value(forKey: "rating_count") as? String{
                    provider.rating_count = "\(rating_count)"
                }
                
                if let rating_count = itemDict.value(forKey: "rating_count") as? Double{
                    provider.rating_count = "\(rating_count)"
                }
                
                
                if let rating = itemDict.value(forKey: "rating") as? Int{
                    provider.rating = "\(rating)"
                }
                
                
                if let rating = itemDict.value(forKey: "rating") as? String{
                    provider.rating = "\(rating)"
                }
                
                if let rating = itemDict.value(forKey: "rating") as? Double{
                    provider.rating = "\(rating)"
                }
                
                
                if let distance = itemDict.value(forKey: "distance") as? Int{
                    provider.distance = "\(distance)"
                }
                
                
                if let distance = itemDict.value(forKey: "distance") as? String{
                    provider.distance = "\(distance)"
                }
                
                if let distance = itemDict.value(forKey: "distance") as? Double{
                    provider.distance = "\(distance)"
                }
                
                
                if let price = itemDict.value(forKey: "price") as? Int{
                    provider.price = "\(price)"
                }
                
                
                if let price = itemDict.value(forKey: "price") as? String{
                    provider.price = "\(price)"
                }
                
                if let price = itemDict.value(forKey: "price") as? Double{
                    provider.price = "\(price)"
                }
                
                providers.append(provider)
                
            }
        }
        return ProviderListViewModel(providers)
    }
}
