//
//  HomeRestingView.swift
//  BrickDaniels
//
//  Created by Nicky Taylor on 9/5/24.
//

import SwiftUI

struct HomeRestingView: View {
    
    @FocusState private var isUsernameFocused: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    let searchAnimationNamespace: Namespace.ID
    let action: () -> Void
    var body: some View {
        VStack {
            VStack {
                GeometryReader { geometry in
                    getTopStinger(geometry: geometry)
                }
            }
            .transaction { transaction in
                transaction.animation = nil
            }
            Button(action: {
                action()
            }, label: {
                SearchBarView(cancelAction: {
                    
                }, searchBarFocusState: $isUsernameFocused)
                .disabled(true)
                .matchedGeometryEffect(id: HomeController.searchAnimationID,
                                       in: searchAnimationNamespace)
                .zIndex(1000.0)
            })
            ZStack {
                
                if verticalSizeClass == .compact {
                    HStack {
                        Image("beer")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .opacity(0.25)
                        Image("beer")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .opacity(0.25)
                        Image("beer")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .opacity(0.25)
                    }
                } else {
                    Image("beer")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0.25)
                        .padding(.all, 32.0)
                }
            }
            .transaction { transaction in
                transaction.animation = nil
            }
        }
        .background(Theme.Colors.onyx)
        .ignoresSafeArea(.keyboard)
    }
    
    func getTopStinger(geometry: GeometryProxy) -> some View {
        
        let _logoWidth = 336
        let _logoHeight = 60
        
        let _iconWidth = 156
        let _iconHeight = 156
        
        let _totalHeight = (_logoHeight + _iconHeight)
        
        var scale = geometry.size.height / CGFloat(_totalHeight)
        if scale > 0.75 { scale = 0.75 }
        
        let logoWidth = CGFloat(_logoWidth) * scale
        let logoHeight = CGFloat(_logoHeight) * scale
        
        let iconWidth = CGFloat(_iconWidth) * scale
        let iconHeight = CGFloat(_iconHeight) * scale
        
        return VStack(spacing: 0.0) {
            Spacer()
            HStack {
                Spacer()
                Image("cocktail_icon")
                    .resizable()
                    .frame(width: iconWidth, height: iconHeight)
                Spacer()
            }
            HStack {
                Spacer()
                Image("cocktaildb_logo")
                    .resizable()
                    .frame(width: logoWidth, height: logoHeight)
                Spacer()
            }
            Spacer()
        }
    }
    
}

#Preview {
    return HomeRestingView(searchAnimationNamespace: Namespace().wrappedValue) { }
}
