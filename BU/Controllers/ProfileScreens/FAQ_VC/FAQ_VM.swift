//
//  FAQ_VM.swift
//  Lawyer
//
//  Created by Aman Kumar on 09/08/20.
//  Copyright © 2020 Hephateus. All rights reserved.
//

import Foundation
class FAQ_VM: FAQ_DataModeling {
    
    
    //TODO: Singleton object
    static let shared = FAQ_VM()
    private init() {}
    
    
    //TODO: Prepare data source implementation
    func prepareDataSource() -> [FAQItem]{
      let items = [FAQItem(question: "Q. Caramels topping cotton candy candy. Cotton candy sugar plum chocolate bar tart oat cake marzipan cotton candy cake bonbon. Candy canes pudding jujubes cheesecake. Sesame snaps marshmallow oat cake brownie jelly beans bonbon cupcake?", answer: "A. Jelly-o candy marshmallow cake jelly cheesecake. Carrot cake lemon drops sweet sesame snaps chocolate. Halvah ice cream gummies candy canes macaroon chocolate caramels muffin. Tart powder chocolate bar cookie tiramisu pastry. Pudding pudding tart croissant cheesecake. Gummi bears sweet tiramisu candy canes dessert. Brownie fruitcake topping toffee danish. Donut topping jelly beans apple pie tiramisu muffin biscuit. Lemon drops cotton candy apple pie pastry pastry lemon drops biscuit. Fruitcake soufflé jujubes toffee tart jujubes cupcake. Gingerbread cake wafer candy canes. Jelly-o ice cream sugar plum caramels chupa chups tiramisu lollipop. Jelly beans muffin halvah marshmallow cotton candy halvah pastry candy. Cheesecake ice cream lemon drops jelly beans tootsie roll sweet. Sweet cake pastry cheesecake cookie."),
        
        FAQItem(question: "Q. Caramels topping cotton candy candy. Cotton candy sugar plum chocolate bar tart oat cake marzipan cotton candy cake bonbon. Candy canes pudding jujubes cheesecake. Sesame snaps marshmallow oat cake brownie jelly beans bonbon cupcake?", answer: "A. Jelly-o candy marshmallow cake jelly cheesecake. Carrot cake lemon drops sweet sesame snaps chocolate. Halvah ice cream gummies candy canes macaroon chocolate caramels muffin. Tart powder chocolate bar cookie tiramisu pastry. Pudding pudding tart croissant cheesecake. Gummi bears sweet tiramisu candy canes dessert. Brownie fruitcake topping toffee danish. Donut topping jelly beans apple pie tiramisu muffin biscuit. Lemon drops cotton candy apple pie pastry pastry lemon drops biscuit. Fruitcake soufflé jujubes toffee tart jujubes cupcake. Gingerbread cake wafer candy canes. Jelly-o ice cream sugar plum caramels chupa chups tiramisu lollipop. Jelly beans muffin halvah marshmallow cotton candy halvah pastry candy. Cheesecake ice cream lemon drops jelly beans tootsie roll sweet. Sweet cake pastry cheesecake cookie."),
        
        FAQItem(question: "Q. Caramels topping cotton candy candy. Cotton candy sugar plum chocolate bar tart oat cake marzipan cotton candy cake bonbon. Candy canes pudding jujubes cheesecake. Sesame snaps marshmallow oat cake brownie jelly beans bonbon cupcake?", answer: "A. Jelly-o candy marshmallow cake jelly cheesecake. Carrot cake lemon drops sweet sesame snaps chocolate. Halvah ice cream gummies candy canes macaroon chocolate caramels muffin. Tart powder chocolate bar cookie tiramisu pastry. Pudding pudding tart croissant cheesecake. Gummi bears sweet tiramisu candy canes dessert. Brownie fruitcake topping toffee danish. Donut topping jelly beans apple pie tiramisu muffin biscuit. Lemon drops cotton candy apple pie pastry pastry lemon drops biscuit. Fruitcake soufflé jujubes toffee tart jujubes cupcake. Gingerbread cake wafer candy canes. Jelly-o ice cream sugar plum caramels chupa chups tiramisu lollipop. Jelly beans muffin halvah marshmallow cotton candy halvah pastry candy. Cheesecake ice cream lemon drops jelly beans tootsie roll sweet. Sweet cake pastry cheesecake cookie."),
        
        FAQItem(question: "Q. Caramels topping cotton candy candy. Cotton candy sugar plum chocolate bar tart oat cake marzipan cotton candy cake bonbon. Candy canes pudding jujubes cheesecake. Sesame snaps marshmallow oat cake brownie jelly beans bonbon cupcake?", answer: "A. Jelly-o candy marshmallow cake jelly cheesecake. Carrot cake lemon drops sweet sesame snaps chocolate. Halvah ice cream gummies candy canes macaroon chocolate caramels muffin. Tart powder chocolate bar cookie tiramisu pastry. Pudding pudding tart croissant cheesecake. Gummi bears sweet tiramisu candy canes dessert. Brownie fruitcake topping toffee danish. Donut topping jelly beans apple pie tiramisu muffin biscuit. Lemon drops cotton candy apple pie pastry pastry lemon drops biscuit. Fruitcake soufflé jujubes toffee tart jujubes cupcake. Gingerbread cake wafer candy canes. Jelly-o ice cream sugar plum caramels chupa chups tiramisu lollipop. Jelly beans muffin halvah marshmallow cotton candy halvah pastry candy. Cheesecake ice cream lemon drops jelly beans tootsie roll sweet. Sweet cake pastry cheesecake cookie."),
        
        FAQItem(question: "Q. Caramels topping cotton candy candy. Cotton candy sugar plum chocolate bar tart oat cake marzipan cotton candy cake bonbon. Candy canes pudding jujubes cheesecake. Sesame snaps marshmallow oat cake brownie jelly beans bonbon cupcake?", answer: "A. Jelly-o candy marshmallow cake jelly cheesecake. Carrot cake lemon drops sweet sesame snaps chocolate. Halvah ice cream gummies candy canes macaroon chocolate caramels muffin. Tart powder chocolate bar cookie tiramisu pastry. Pudding pudding tart croissant cheesecake. Gummi bears sweet tiramisu candy canes dessert. Brownie fruitcake topping toffee danish. Donut topping jelly beans apple pie tiramisu muffin biscuit. Lemon drops cotton candy apple pie pastry pastry lemon drops biscuit. Fruitcake soufflé jujubes toffee tart jujubes cupcake. Gingerbread cake wafer candy canes. Jelly-o ice cream sugar plum caramels chupa chups tiramisu lollipop. Jelly beans muffin halvah marshmallow cotton candy halvah pastry candy. Cheesecake ice cream lemon drops jelly beans tootsie roll sweet. Sweet cake pastry cheesecake cookie."),
        
        FAQItem(question: "Q. Caramels topping cotton candy candy. Cotton candy sugar plum chocolate bar tart oat cake marzipan cotton candy cake bonbon. Candy canes pudding jujubes cheesecake. Sesame snaps marshmallow oat cake brownie jelly beans bonbon cupcake?", answer: "A. Jelly-o candy marshmallow cake jelly cheesecake. Carrot cake lemon drops sweet sesame snaps chocolate. Halvah ice cream gummies candy canes macaroon chocolate caramels muffin. Tart powder chocolate bar cookie tiramisu pastry. Pudding pudding tart croissant cheesecake. Gummi bears sweet tiramisu candy canes dessert. Brownie fruitcake topping toffee danish. Donut topping jelly beans apple pie tiramisu muffin biscuit. Lemon drops cotton candy apple pie pastry pastry lemon drops biscuit. Fruitcake soufflé jujubes toffee tart jujubes cupcake. Gingerbread cake wafer candy canes. Jelly-o ice cream sugar plum caramels chupa chups tiramisu lollipop. Jelly beans muffin halvah marshmallow cotton candy halvah pastry candy. Cheesecake ice cream lemon drops jelly beans tootsie roll sweet. Sweet cake pastry cheesecake cookie."),
        
        FAQItem(question: "Q. Caramels topping cotton candy candy. Cotton candy sugar plum chocolate bar tart oat cake marzipan cotton candy cake bonbon. Candy canes pudding jujubes cheesecake. Sesame snaps marshmallow oat cake brownie jelly beans bonbon cupcake?", answer: "A. Jelly-o candy marshmallow cake jelly cheesecake. Carrot cake lemon drops sweet sesame snaps chocolate. Halvah ice cream gummies candy canes macaroon chocolate caramels muffin. Tart powder chocolate bar cookie tiramisu pastry. Pudding pudding tart croissant cheesecake. Gummi bears sweet tiramisu candy canes dessert. Brownie fruitcake topping toffee danish. Donut topping jelly beans apple pie tiramisu muffin biscuit. Lemon drops cotton candy apple pie pastry pastry lemon drops biscuit. Fruitcake soufflé jujubes toffee tart jujubes cupcake. Gingerbread cake wafer candy canes. Jelly-o ice cream sugar plum caramels chupa chups tiramisu lollipop. Jelly beans muffin halvah marshmallow cotton candy halvah pastry candy. Cheesecake ice cream lemon drops jelly beans tootsie roll sweet. Sweet cake pastry cheesecake cookie.")]
        
        return items
    }
    
    
    func prepareDataSourceWith(json:NSArray) -> [FAQItem]{
        var faqItems:[FAQItem] = [FAQItem]()
        
        for item in json{
            if let itemDict = item as? NSDictionary{
                var query:FAQItem = FAQItem(question: String(), answer: ConstantTexts.QueryReso_LT)
                
                
                if let Query = itemDict.value(forKey: "Query") as? String{
                    query.question = "Q. \(Query)".trimmingCharacters(in: .whitespacesAndNewlines)
                }
               
                if let Answer = itemDict.value(forKey: "Answer") as? String{
                    query.answer = "A. \(Answer)".trimmingCharacters(in: .whitespacesAndNewlines)
                }
               
                faqItems.append(query)
            }
        }
        
        
        return faqItems
    }
}
