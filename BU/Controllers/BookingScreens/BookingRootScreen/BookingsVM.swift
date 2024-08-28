//
//  BookingsVM.swift
//  BU
//
//  Created by Aman Kumar on 09/02/21.
//

import Foundation
import UIKit
class BookingsVM: BookingDepenedencyInjection {
    
    static let shared = BookingsVM()
    private init() {}
    
    func prepareDataSource(with array: NSArray) -> (BookingListViewModel, BookingListViewModel, BookingListViewModel) {
        
        var upComingBookings:[BookingDataModel] = [BookingDataModel]()
        var cancelledBookings:[BookingDataModel] = [BookingDataModel]()
        var completedBookings:[BookingDataModel] = [BookingDataModel]()
        
        for item in array{
            if let itemDict = item as? NSDictionary{
                var booking = BookingDataModel(booking_date: String(), first_name: String(), id: String(), last_name: String(), provider_id: String(), rating: String(), service_id: String(), service_name: String(), status: String(), user_id: String())
                
                if let booking_date = itemDict.value(forKey: "booking_date") as? String{
                    booking.booking_date = "\(booking_date)"
                }
                
                if let first_name = itemDict.value(forKey: "first_name") as? String{
                    booking.first_name = "\(first_name)"
                }
                
                if let id = itemDict.value(forKey: "id") as? String{
                    booking.id = "\(id)"
                }
                
                
                if let id = itemDict.value(forKey: "id") as? Int{
                    booking.id = "\(id)"
                }
                
                if let last_name = itemDict.value(forKey: "last_name") as? String{
                    booking.last_name = "\(last_name)"
                }
                
                if let provider_id = itemDict.value(forKey: "provider_id") as? String{
                    booking.provider_id = "\(provider_id)"
                }
                
                
                if let provider_id = itemDict.value(forKey: "provider_id") as? Int{
                    booking.provider_id = "\(provider_id)"
                }
                
                
                if let rating = itemDict.value(forKey: "rating") as? String{
                    booking.rating = "\(rating)"
                }
                
                
                if let rating = itemDict.value(forKey: "rating") as? Int{
                    booking.rating = "\(rating)"
                }
                
                
                if let service_id = itemDict.value(forKey: "service_id") as? String{
                    booking.service_id = "\(service_id)"
                }
                
                
                if let service_id = itemDict.value(forKey: "service_id") as? Int{
                    booking.service_id = "\(service_id)"
                }
                
                if let service_name = itemDict.value(forKey: "service_name") as? String{
                    booking.service_name = "\(service_name)"
                }
                
                
                if let user_id = itemDict.value(forKey: "user_id") as? Int{
                    booking.user_id = "\(user_id)"
                }
                
                if let user_id = itemDict.value(forKey: "user_id") as? String{
                    booking.user_id = "\(user_id)"
                }
                
                if let status = itemDict.value(forKey: "status") as? String{
                    booking.status = "\(status)"
                }
                
                if booking.status == "Completed"{
                    completedBookings.append(booking)
                    
                }else if booking.status == "Cancelled"{
                    cancelledBookings.append(booking)
                }else{
                    upComingBookings.append(booking)
                }
                
                
            }
        }
        
        return (BookingListViewModel(bookings: upComingBookings),BookingListViewModel(bookings: cancelledBookings),BookingListViewModel(bookings: completedBookings))
    }
    
    
}
