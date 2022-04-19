//
//  ContentView.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: PROPERTIES
    
    @ObservedObject var viewModel: InformationViewModel
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.planets?.results ?? [], id: \.self){ planet in
                    NavigationLink {
                        PlanetDetailView(planet: planet)
                    } label: {
                        PlanetListView(planet: planet)
                            .padding()
                    }//: LINK
                }//: LOOP
            }//: LIST
            .navigationBarTitle("Planets")
            .onAppear {
                viewModel.loadFromMemory(with: .planets)
                hapticImpact.impactOccurred()
            }
        }//: NAVIGATION
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let viewModel: InformationViewModel = {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let networkData = NetworkService(withMethod: .GET, withURLExtension: .planets, session: session)
        let tempViewModel = InformationViewModel(networkData, PersistenceManager())
        return tempViewModel
    }()
    
    static var previews: some View {
        ContentView(viewModel: viewModel)
    }
}
