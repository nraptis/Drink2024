//
//  RootView.swift
//  BrickDaniels
//
//  Created by Nicky Taylor on 9/6/24.
//

import SwiftUI

struct RootView: View {
    
    @Environment(Router.self) var router: Router
    
    var body: some View {
        @Bindable var router = router
        return NavigationStack(path: $router.navigationPath) {
            HomeView()
                .environment(router.homeController)
            /*
                .navigationDestination(for: Page1ViewModel.self) { page1ViewModel in
                    Page1View()
                        .environment(page1ViewModel)
                }
                .navigationDestination(for: Page2ViewModel.self) { page2ViewModel in
                    Page2View()
                        .environment(page2ViewModel)
                }
                .navigationDestination(for: Page3ViewModel.self) { page3ViewModel in
                    Page3View()
                        .environment(page3ViewModel)
                }
            */
        }
    }
}

#Preview {
    RootView()
        .environment(Router.mock())
        .preferredColorScheme(.dark)
}
