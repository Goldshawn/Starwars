//
//  SceneDelegate.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import SwiftUI

// I really do not have an iOS 13 device. it works in simulator, hope it works every where also.... fingers crossed
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let contentView = MainForLowerApps()

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
