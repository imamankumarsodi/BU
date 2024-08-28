//
//  HomeVC+UISearchDelegate.swift
//  BU
//
//  Created by Aman Kumar on 01/02/21.
//

import Foundation
import UIKit
extension HomeVC:UISearchBarDelegate{
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
      /*  self.categoryListVM?.categories.removeAll()
        self.reloadCollectionView()
        self.hitgetCategoriesService(lat: "\(self.lati)", long: "\(self.longi)", service_type: searchBar.text!.trimmingCharacters(in: .whitespacesAndNewlines)) */
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.categoryListVM?.categories.removeAll()
        self.reloadCollectionView()
        
        
        if searchBar.text!.trimmingCharacters(in: .whitespacesAndNewlines).count >= 3{
            self.hitgetCategoriesService(lat: "\(self.lati)", long: "\(self.longi)", service_type: searchBar.text!.trimmingCharacters(in: .whitespacesAndNewlines))
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.dismissKeyboard()
        self.categoryListVM?.categories.removeAll()
        self.reloadCollectionView()
        self.hitgetCategoriesService(lat: "\(self.lati)", long: "\(self.longi)", service_type: searchBar.text!.trimmingCharacters(in: .whitespacesAndNewlines))
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //TODO: Remove all previous searched elements
        self.categoryListVM?.categories.removeAll()
        self.reloadCollectionView()
        
        
        if searchText.count >= 3{
            self.hitgetCategoriesService(lat: "\(self.lati)", long: "\(self.longi)", service_type: searchText.trimmingCharacters(in: .whitespacesAndNewlines))
        }
        
    }
}


