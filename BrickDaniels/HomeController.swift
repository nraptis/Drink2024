//
//  HomeController.swift
//  BrickDaniels
//
//  Created by Nicky Taylor on 9/5/24.
//

import UIKit

@Observable class HomeController {
    
    static let searchAnimationID = "search_id"
    
    static func mock() -> HomeController {
        HomeController(router: .mock())
    }
    
    var drinks = [Drink]()
    var imageDict = [String: UIImage]()
    
    let router: Router
    init(router: Router) {
        self.router = router
        
        let mockDrinks = Drink.mockList()
        let mockThumbs = Drink.mockListThumbs()
        
        drinks = [Drink]()
        
        for drinkIndex in mockDrinks.indices {
            let drink = mockDrinks[drinkIndex]
            let thumb = mockThumbs[drinkIndex]
            if drinkIndex != 4 && drinkIndex != 8 && drinkIndex != 9 {
                if let thumbnailUrlString = drink.thumbnailUrlString {
                    imageDict[thumbnailUrlString] = thumb
                }
            }
            
            drinks.append(drink)
            
            var clone1 = drink
            clone1.id = clone1.id + "_" + clone1.id
            clone1.name = clone1.name + " " + clone1.name
            clone1.category = clone1.category + " " + clone1.category
            clone1.glass = clone1.glass + " " + clone1.glass
            clone1.alcoholic = clone1.alcoholic + " " + clone1.alcoholic
            
            drinks.append(clone1)
        }
        //self.drinks = mockDrinks
        
    }
    
    func fetchDrinks() async {
        
        /*
        do {
            let response = try await NetworkCalls.drinks(search: "gin")
            await MainActor.run {
                self.drinks = response.drinks
                print(response.drinks)
            }
        } catch {
            print("Error Was: \(error.localizedDescription)")
        }
        */
    }
    
}
