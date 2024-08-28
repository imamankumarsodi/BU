//
//  UINavigationBarButtonType.swift
//  BU
//
//  Created by Aman Kumar on 17/01/21.
//

import Foundation
import UIKit
//MARK: - For UINavigationBarButtonType
enum UINavigationBarButtonType: Int {
    
    case back
    case backBlack
    case backRoot
    case empty
    case location
    case notification
    
    //TODO : Set images according to UINavigationBarButtonType
    var iconImage: UIImage? {
        switch self {
        case .backRoot: return #imageLiteral(resourceName: "BackWhite")
        case .back: return #imageLiteral(resourceName: "BackWhite")
        case .backBlack: return #imageLiteral(resourceName: "back_black")
        case .location: return #imageLiteral(resourceName: "location")
        case .notification: return #imageLiteral(resourceName: "notification")
        case .empty: return UIImage()
        }
    }
}
