//
//  VehicleView.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import SwiftUI

struct VehicleView: View {
    //MARK: PROPERTIES
    
    //MARK: BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Image("milleniumFalcon")
                .resizable()
                .scaledToFill()
        }//:SCROLLVIEW
        .frame( maxWidth: .infinity,maxHeight: .infinity)
        .background(
            MotionAnimationView()
        )
    }
}

struct VehicleView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleView()
    }
}
