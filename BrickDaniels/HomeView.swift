//
//  ContentView.swift
//  BrickDaniels
//
//  Created by Nicky Taylor on 9/1/24.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(HomeController.self) var homeController: HomeController
    @Environment(Router.self) var router: Router
    
    
    @Namespace var searchAnimationNamespace
    @State var isSearching = true
    
    @FocusState private var searchBarFocusState: Bool
    
    var body: some View {
        VStack(spacing: 0.0) {
            //SearchBarView()
            if isSearching {
                HomeActiveView(cancelAction: {
                    searchBarFocusState = true
                    withAnimation {
                        isSearching = false
                    }
                    
                }, searchBarFocusState: $searchBarFocusState,
                               searchAnimationNamespace: searchAnimationNamespace)
            } else {
                HomeRestingView(searchAnimationNamespace: searchAnimationNamespace, action: {
                    searchBarFocusState = true
                    withAnimation {
                        isSearching = true
                    }
                })
            }
        }
        .background(Theme.Colors.onyx)
        .task {
            await homeController.fetchDrinks()
        }
    }
}

#Preview {
    HomeView()
        .environment(HomeController.mock())
        .environment(Router.mock())
}
