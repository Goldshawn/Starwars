//
//  MovieView.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import SwiftUI

struct MovieView: View {
    //MARK: PROPERTIES
    
    //MARK: BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                Text("Decided to keep this plain")
            }//:SCROLLVIEW
            .navigationBarTitle("Movies")
            .frame( maxWidth: .infinity,maxHeight: .infinity)
            .background(
                MotionAnimationView()
            )
        }//: NAVIGATION
        .navigationViewStyle(.stack)
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
