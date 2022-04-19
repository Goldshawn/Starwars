//
//  CharacterView.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import SwiftUI

struct CharacterView: View {
    //MARK: PROPERTIES
    
    @ObservedObject var viewModel: InformationViewModel
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: BODY
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                let data = viewModel.people?.results ?? []
                ForEach(data, id: \.self) {
                    person in
                    Text(person.name)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("ColorBlue"))
                        .padding()
                }//: LOOP
            }//: LIST
            .navigationBarTitle("People")
            .onAppear {
                viewModel.loadFromMemory(with: .people)
                hapticImpact.impactOccurred()
            }
        }//: NAVIGATION
        .navigationViewStyle(.stack)
    }
}

struct CharacterView_Previews: PreviewProvider {
    static let viewModel: InformationViewModel = {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let networkData = NetworkService(withMethod: .GET, withURLExtension: .people, session: session)
        let tempViewModel = InformationViewModel(networkData, PersistenceManager())
        return tempViewModel
    }()
    
    static var previews: some View {
        CharacterView(viewModel: viewModel)
    }
}
