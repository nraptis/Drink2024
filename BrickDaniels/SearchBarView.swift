//
//  SearchBarView.swift
//  BrickDaniels
//
//  Created by Nicky Taylor on 9/5/24.
//

import SwiftUI

struct SearchBarView: View {
    
    @State var searchText = ""
    let cancelAction: () -> Void
    var searchBarFocusState: FocusState<Bool>.Binding
    
    var body: some View {
        HStack {
            HStack {
                HStack(spacing: 0.0) {
                    Button {
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .font(Theme.SearchBar.fontIconMagnifyingGlass)
                            .foregroundStyle(Theme.Colors.cloud)
                    }
                    .padding(.trailing, Theme.SearchBar.paddingMagnifyingGlassTrailing)
                    .padding(.leading, Theme.SearchBar.paddingMagnifyingGlassLeading)
                    
                    HStack {
                        HStack {
                            HStack {
                                TextField("", text: $searchText, prompt:
                                            Text("Drink Name")
                                    .font(Theme.SearchBar.fontPlaceholder)
                                    .foregroundStyle(Theme.Colors.steel)
                                          
                                )
                                .font(Theme.SearchBar.fontMain)
                                .foregroundStyle(Theme.Colors.cloud)
                                .autocorrectionDisabled()
                                .autocapitalization(.none)
                                .focused(searchBarFocusState, equals: true)
                                .multilineTextAlignment(.leading)
                                .tint(Theme.Colors.limestone)
                                
                                Spacer()
                                
                                Button {
                                    
                                } label: {
                                    Image(systemName: "x.circle.fill")
                                        .font(Theme.SearchBar.fontIconClear)
                                        .foregroundStyle(Theme.Colors.steel)
                                }
                            }
                        }
                        .padding(.leading, Theme.SearchBar.paddingLeading1)
                        .padding(.trailing, Theme.SearchBar.paddingTrailing1)
                        .padding(.vertical, Theme.SearchBar.paddingInnerV1)
                        
                    }
                    .background(Capsule().foregroundStyle(
                        LinearGradient(colors: [Theme.Colors.mauve.opacity(0.4), Theme.Colors.mauve.opacity(0.6)], startPoint: .top, endPoint: .bottom)
                    ))
                    .overlay(Capsule().stroke().foregroundStyle(Theme.Colors.mauve))
                    .padding(.vertical, Theme.SearchBar.paddingInnerV2)
                    
                    Button {
                        cancelAction()
                    } label: {
                        Text("Cancel")
                            .font(Theme.SearchBar.fontCancel)
                            .foregroundStyle(Theme.Colors.cloud)
                    }
                    .padding(.trailing, Theme.SearchBar.paddingCancelTrailing)
                    .padding(.leading, Theme.SearchBar.paddingCancelLeading)
                }
            }
            .background(RoundedRectangle(cornerRadius: Theme.SearchBar.underlayCornerRadius).foregroundStyle(Theme.Colors.charcoal))
            .overlay(RoundedRectangle(cornerRadius: Theme.SearchBar.underlayCornerRadius).stroke().foregroundStyle(Theme.Colors.concord))
            .padding(.horizontal, Theme.SearchBar.paddingOuterH)
        }
    }
}

#Preview {
    VStack {
        Spacer()
        SearchBarView(cancelAction: { },
                      searchBarFocusState: FocusState<Bool>().projectedValue)
        Spacer()
    }
    .background(Theme.Colors.onyx)
}
