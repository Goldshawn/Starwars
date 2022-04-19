//
//  MotionAnimationView.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import SwiftUI

// This is basically an animated view to keep things interesting on the main views that has not been designed
struct MotionAnimationView: View {
    //MARK: PROPERTIES
    
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    //MARK: FUNCTIONS
    
    //1. RANDOM COORDINATES
    func randomCoordinate(max: CGFloat) -> CGFloat {
        CGFloat.random(in: 0...max)
    }
    //2. RANDOM SIZE
    func randomSize() -> CGFloat {
        CGFloat.random(in: 0...300)
    }
    //3. RANDOM SCALE
    func randomScale() -> CGFloat {
        CGFloat.random(in: 0.1...2.0)
    }
    //4. RANDOM SPEED
    func randomSpeed() -> Double {
        Double.random(in: 0.025...1.0)
    }
    //5. RANDOM DELAY
    func randomDelay() -> Double {
        Double.random(in: 0...2.0)
    }
    
    //MARK: BODY
    var body: some View {
        GeometryReader {geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                    .position(x: randomCoordinate(max: geometry.size.width), y: randomCoordinate(max: geometry.size.height))
                    .animation(
                        Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay()), value: isAnimating
                    )
                    .onAppear {
                        isAnimating = true
                    }
                }//:LOOP
            }//: ZSTACK
            .drawingGroup()
        }//: GEOMETRY
    }
}
//MARK: PREVIEW

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
