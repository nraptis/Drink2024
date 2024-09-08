//
//  DrinkCellView.swift
//  BrickDaniels
//
//  Created by Nicky Taylor on 9/6/24.
//

import SwiftUI

struct DrinkCellView: View {
    let drink: Drink
    let isThumbDownloadErrorPresent: Bool
    let image: UIImage?
    
    init(drink: Drink, isThumbDownloadErrorPresent: Bool, image: UIImage?) {
        self.drink = drink
        self.isThumbDownloadErrorPresent = isThumbDownloadErrorPresent
        self.image = image
    }
    
    var body: some View {
        return VStack {
            HStack {
                HStack(alignment: .top, spacing: Theme.DrinkCell.spacingThumbText) {
                    ZStack {
                        if let image = image {
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: Theme.DrinkCell.thumbSize,
                                       height: Theme.DrinkCell.thumbSize)
                                .clipShape(RoundedRectangle(cornerRadius: Theme.DrinkCell.thumbCornerRadius))
                        }
                    }
                    .frame(width: Theme.DrinkCell.thumbBoxSize,
                           height: Theme.DrinkCell.thumbBoxSize)
                    .background(RoundedRectangle(cornerRadius: Theme.DrinkCell.thumbBoxCornerRadius).foregroundStyle(.thinMaterial))
                    .padding(.leading, Theme.DrinkCell.paddingInternalUniversal)
                    .padding(.top, Theme.DrinkCell.paddingInternalUniversal)
                    .padding(.bottom, Theme.DrinkCell.paddingInternalUniversal)
                    
                    VStack(alignment: .leading, spacing: 0.0) {
                        getNameLine()
                            .padding(.bottom, 4.0)
                        getCategoryLine()
                            .padding(.bottom, 2.0)
                        getGlassLine()
                    }
                    .padding(.top, Theme.DrinkCell.paddingInternalUniversal)
                    .padding(.bottom, Theme.DrinkCell.paddingInternalUniversal)
                    .padding(.trailing, Theme.DrinkCell.paddingInternalUniversal)
                    Spacer()
                }
                .background(RoundedRectangle(cornerRadius: Theme.DrinkCell.cellCornerRadius).foregroundStyle(Theme.Colors.midnight))
                .overlay(RoundedRectangle(cornerRadius: Theme.DrinkCell.cellCornerRadius).stroke().foregroundStyle(Theme.Colors.mauve))
            }
            .padding(.horizontal, Theme.DrinkCell.paddingExternalHorizontal)
            .padding(.vertical, Theme.DrinkCell.paddingExternalVertical)
        }
    }
    
    func getNameLine() -> some View {
        
        var piece1 = AttributedString("\(drink.name) (")
        piece1.font = Theme.DrinkCell.fontName
        piece1.foregroundColor = Theme.Colors.cloud
        
        var piece2 = AttributedString("\(drink.alcoholic)")
        piece2.font = Theme.DrinkCell.fontAlcoholic
        piece2.foregroundColor = Theme.Colors.steel
        
        var piece3 = AttributedString(")")
        piece3.font = Theme.DrinkCell.fontName
        piece3.foregroundColor = Theme.Colors.cloud
        
        return Text(piece1 + piece2 + piece3)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
    }
    
    func getCategoryLine() -> some View {
        
        let iconNote = Image(systemName: "note.text")
        
        var category = AttributedString("\(drink.category)")
        category.font = Theme.DrinkCell.fontPropertiesText
        category.foregroundColor = Theme.Colors.steel
        
        return Text("\(iconNote) \(category)")
            .font(Theme.DrinkCell.fontPropertiesIcons)
            .multilineTextAlignment(.leading)
            .foregroundStyle(Theme.Colors.cobalt)
            .lineLimit(2)
    }
    
    func getGlassLine() -> some View {
        let iconWineglass = Image(systemName: "wineglass")
        var glass = AttributedString("\(drink.glass)")
        glass.font = Theme.DrinkCell.fontPropertiesText
        glass.foregroundColor = Theme.Colors.steel
        return Text("\(iconWineglass) \(glass)")
                .font(Theme.DrinkCell.fontPropertiesIcons)
                .foregroundStyle(Theme.Colors.fuchsia)
                .lineLimit(2)
                .layoutPriority(.infinity)
                .padding(.leading, 4.0)
    }
}

#Preview {
    
    let homeController = HomeController.mock()
    return VStack(spacing: 0.0) {
        
        VStack(spacing: 0.0) {
            
            Spacer()
                .frame(height: Theme.SearchHeader.paddingTop)
            
            SearchBarView(cancelAction: {
                
            }, searchBarFocusState: FocusState<Bool>().projectedValue)
            
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
    .preferredColorScheme(.dark)
}
