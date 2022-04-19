//
//  MainView.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import SwiftUI

@available(iOS 14.0, *)
struct MainView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
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
        VStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
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
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 14.0, *) {
            MainView()
        } else {
            // Fallback on earlier versions
        }
    }
}
