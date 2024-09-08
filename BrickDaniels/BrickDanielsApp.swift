//
//  BrickDanielsApp.swift
//  BrickDaniels
//
//  Created by Nicky Taylor on 9/1/24.
//

import SwiftUI

@main
struct BrickDanielsApp: App {
    
    let router = Router()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(router)
                .preferredColorScheme(.dark)
        }
    }
}
