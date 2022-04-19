//
//  PlanetListView.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import SwiftUI

struct PlanetListView: View {
    // MARK: PROPERTIES
    
    let planet: PlanetsResult?
    // MARK: BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: "network")
                .foregroundColor(Color("ColorRed"))
                .imageScale(.large)
            
            Text(planet?.name ?? "Tatooine")
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(Color("ColorBlue"))
        }//: HSTACK
    }
}
// MARK: PREVIEW
struct PlanetListView_Previews: PreviewProvider {
    static let planets: PlanetsModel? = {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let networkData = NetworkService(withMethod: .GET, withURLExtension: .planets, session: session)
        let planetViewModel = InformationViewModel(networkData, PersistenceManager())
        
        planetViewModel.loadFromMemory(with: .planets)
        return planetViewModel.planets
    }()
    
    static var previews: some View {
        PlanetListView(planet: (planets?.results[0]))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
