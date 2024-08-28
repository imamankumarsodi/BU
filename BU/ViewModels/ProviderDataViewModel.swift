//
//  ProviderDataViewModel.swift
//  BU
//
//  Created by Aman Kumar on 01/02/21.
//

import Foundation

//TODO: Parent view model for showing list of category
struct ProviderListViewModel {
    
    var providers:[ProvideModel]
    
}

extension ProviderListViewModel{
    init(_ providers:[ProvideModel]) {
        self.providers = providers
    }
}

extension ProviderListViewModel{
    var numberOfSections:Int{
        return 1
    }
    
    
    public func numberOfRowsInSection(_ section:Int) -> Int{
        return self.providers.count
    }
    
    
    public func providerAtIndex(_ index:Int) -> ProviderViewModel{
        return ProviderViewModel(self.providers[index])
    }
    
}


//TODO: Child view model for showing a single category
struct ProviderViewModel {
    private let provider:ProvideModel
}

extension ProviderViewModel{
    init(_ provider:ProvideModel) {
        self.provider = provider
    }
}


extension ProviderViewModel{
  
    var id:String{
        return self.provider.id
    }
    
    
    var first_name:String{
        return self.provider.first_name
    }
    
    var last_name:String{
        return self.provider.last_name
    }
    
    var email:String{
        return self.provider.email
    }
    
    
    var mobile:String{
        return self.provider.mobile
    }
    
    var avatar:String{
        return self.provider.avatar
    }
    
    
    
    var description:String{
        return self.provider.description
    }
    
    
    var rating:String{
        return self.provider.rating
    }
    
    var status:String{
        return self.provider.status
    }
    
    var latitude:String{
        return self.provider.latitude
    }
    
    
    var longitude:String{
        return self.provider.longitude
    }
    
    var rating_count:String{
        return self.provider.rating_count
    }
    
    var otp:String{
        return self.provider.otp
    }

    var distance:String{
        return self.provider.distance
    }
    
    var price:String{
        return self.provider.price
    }
    
  /*  var Description:String{
        return self.category.Description
    }
    
    var expertiseId:String{
        return self.category.ExpertiseId
    } */
    
}
