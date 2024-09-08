//
//  HomeActiveView.swift
//  BrickDaniels
//
//  Created by Nicky Taylor on 9/5/24.
//

import SwiftUI

struct HomeActiveView: View {
    
    @Environment(HomeController.self) var homeController: HomeController
    
    let cancelAction: () -> Void
    var searchBarFocusState: FocusState<Bool>.Binding
    let searchAnimationNamespace: Namespace.ID
    
    var body: some View {
        VStack(spacing: 0.0) {
            VStack(spacing: 0.0) {
                
                Spacer()
                    .frame(height: Theme.SearchHeader.paddingTop)
                
                SearchBarView(cancelAction: {
                    cancelAction()
                }, searchBarFocusState: searchBarFocusState)
                .matchedGeometryEffect(id: HomeController.searchAnimationID,
                                       in: searchAnimationNamespace)
                .zIndex(1000.0)
                
                Spacer()
                    .frame(height: Theme.SearchHeader.paddingBottom)
            }
            .background(Theme.Colors.onyx)
            
            HStack {
                Spacer()
            }
            .frame(height: 1.0)
            .background(Theme.Colors.mauve)
            
            
            
            
            ScrollView(.vertical) {
                

                //ContentUnavailableView.search
                VStack(spacing: 0.0) {
                    
                    Spacer()
                        .frame(height: Theme.DrinkList.paddingTop)
                    
                    ForEach(homeController.drinks) { drink in
                        
                        DrinkCellView(drink: drink,
                                      isThumbDownloadErrorPresent: false,
                                      image: homeController.imageDict[drink.thumbnailUrlString ?? ""])
                        
                        //Text(drink.name)
                    }
                    
                    Spacer()
                        .frame(height: Theme.DrinkList.paddingTop)
                }
            }
            .background(Theme.Colors.charcoal)
            .refreshable {
                try? await Task.sleep(nanoseconds: 3_000_000_000)
            }
        }
        .background(Theme.Colors.charcoal)
    }
    
}

#Preview {
    HomeActiveView(cancelAction: { },
                   searchBarFocusState: FocusState<Bool>().projectedValue,
                   searchAnimationNamespace: Namespace().wrappedValue)
    .environment(HomeController.mock())
}
