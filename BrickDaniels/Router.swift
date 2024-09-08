//
//  Router.swift
//  BrickDaniels
//
//  Created by Nicky Taylor on 9/6/24.
//

import SwiftUI

@Observable class Router {
    
    static func mock() -> Router {
        Router()
    }
    
    var navigationPath = NavigationPath()
    
    init() {
        
    }
    
    // This is for the navigation root AKA landing page
    @ObservationIgnored lazy var homeController: HomeController = {
        HomeController(router: self)
    }()
    
}
