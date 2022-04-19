//
//  MainForLowerApps.swift
//  StarWars
//
//  Created by Shalom Owolabi on 19/04/2022.
//

import SwiftUI

struct MainForLowerApps: View {
    let peopleViewModel: InformationViewModel = {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let networkData = NetworkService(withMethod: .GET, withURLExtension: .people, session: session)
        let tempViewModel = InformationViewModel(networkData, PersistenceManager())
        return tempViewModel
    }()
    
    let planetsViewModel: InformationViewModel = {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let networkData = NetworkService(withMethod: .GET, withURLExtension: .planets, session: session)
        let tempViewModel = InformationViewModel(networkData, PersistenceManager())
        return tempViewModel
    }()
    var body: some View {
        TabView{
            ContentView(viewModel: planetsViewModel)
            .tabItem {
                Image(systemName: "network")
                Text("Planets")
            }
        
            CharacterView(viewModel: peopleViewModel)
            .tabItem {
                Image(systemName: "person")
                Text("People")
            }
        
        VehicleView()
            .tabItem {
                Image(systemName: "car.fill")
                Text("Vehicle")
            }
        
        MovieView()
            .tabItem {
                Image(systemName: "film")
                Text("Movies")
            }
        }

    }
}

struct MainForLowerApps_Previews: PreviewProvider {
    static var previews: some View {
        MainForLowerApps()
    }
}
