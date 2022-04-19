//
//  PlanetDetailView.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import SwiftUI

struct PlanetDetailView: View {
    // MARK: PROPERTIES
    let planet: PlanetsResult?
    
    // MARK: BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack (alignment: .center, spacing: 20){
                // HERO IMAGE
//                Image(planet.image)
//                    .resizable()
//                    .scaledToFit()
                // TITLE
                Text(planet?.name.uppercased() ?? "NAME")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color("ColorBlue")
                        .frame(height: 6)
                        .offset(y: 24))
                // HEADLINE
                Text(planet?.name ?? "climate")
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // GALLERY
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    
//                    InsetGalleryView(animal: planet)
                }
                .padding(.horizontal)
                // FACTS
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
//                    InsetFactView(animal: planet)
                }
                // DESCRIPTION
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "All About \(planet?.name ?? "climate")")
                    
                    Text(planet?.climate ?? "climate")
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                // MAP
                Group{
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    
//                    InsetMapView()
                }
                .padding(.horizontal)
                //LINK
                
                Group{
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    
//                    ExternalWeblinkView(animal: planet)
                }.padding(.horizontal)
            }//: VSTACK
            .navigationBarTitle("Learn about \(planet?.name ?? "climate")", displayMode: .inline)
        }//: SCROLL
        
    }
}
// MARK: PREVIEW
struct PlanetDetailView_Previews: PreviewProvider {
    static let planets: PlanetsModel? = {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let networkData = NetworkService(withMethod: .GET, withURLExtension: .planets, session: session)
        let planetViewModel = InformationViewModel(networkData, PersistenceManager())
        
        planetViewModel.loadFromMemory(with: .planets)
        return planetViewModel.planets
    }()
    
    static var previews: some View {
        NavigationView{
            PlanetDetailView(planet: (planets?.results[0]))
        }
    }
}
