//
//  CoverImageView.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import SwiftUI

// while working on the project, it occured to me.... Show the image of Darth Vader. this was the quick view to quell said urge
struct CoverImageView: View {
    // MARK: PROPERTIES
    
    let coverImages: CoverImageModel = Bundle.main.decodeInfo("StarwarsCovers.json")
    // MARK: BODY
    var body: some View {
        if #available(iOS 14.0, *) {
            TabView{
                ForEach(coverImages) { item in
                    ZStack {
                        Image(item.name)
                            .resizable()
                            .scaledToFill()
                        
                        Text(item.characterName)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }//: LOOP
            }//: TAB
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .tabViewStyle(.page)
        } else {
            // Fallback on earlier versions
            Image(coverImages[0].name)
                .resizable()
                .scaledToFill()
            
            Text(coverImages[0].characterName)
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

// MARK: PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
