//
//  BookingDataViewModel.swift
//  BU
//
//  Created by Aman Kumar on 09/02/21.
//

import Foundation
//TODO: Parent view model for showing list of category
struct BookingListViewModel {
    var bookings:[BookingDataModel]
}



extension BookingListViewModel{
    var numberOfSections:Int{
        return 1
    }
    
    
    public func numberOfRowsInSection(_ section:Int) -> Int{
        return self.bookings.count
    }
    
    
    public func bookingAt(_ index:Int) -> BookingDataViewModel{
        return BookingDataViewModel(booking: self.bookings[index])
    }
    
}


//TODO: Child view model for showing a single category
struct BookingDataViewModel {
     let booking:BookingDataModel
}

extension BookingDataViewModel{
    init(_ booking:BookingDataModel) {
        self.booking = booking
    }
}


extension BookingDataViewModel{
    
  
    var booking_date:String{
        return self.booking.booking_date
    }
    
    
    var first_name:String{
        return self.booking.first_name
    }
    
    var last_name:String{
        return self.booking.last_name
    }
    
    
    var id:String{
        return self.booking.id
    }
    
    var provider_id:String{
        return self.booking.provider_id
        
    }
    
    
    var rating:String{
        return self.booking.rating
    }
    
    
    var service_id:String{
        return self.booking.service_id
    }
    
    var status:String{
        return self.booking.status
    }
    
    
    
    var service_name:String{
        return self.booking.service_name
    }
    
    
    var user_id:String{
        return self.booking.user_id
    }

    
}
