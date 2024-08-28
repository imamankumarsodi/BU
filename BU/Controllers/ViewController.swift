//
//  ViewController.swift
//  BU
//
//  Created by Aman Kumar on 16/01/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for family in UIFont.familyNames {
          let sName: String = family as String
          print("family: \(sName)")

          for name in UIFont.fontNames(forFamilyName: sName) {
            print("name: \(name as String)")
          }
        }
    }
    
}

