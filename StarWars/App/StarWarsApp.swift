//
//  StarWarsApp.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import SwiftUI

@main
struct StarWarsAppWrapper {
    static func main() {
        if #available(iOS 14.0, *) {
            StarWarsApp.main()
        } else {
            UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(SceneDelegate.self))
        }
    }
}

@available(iOS 14.0, *)
struct StarWarsApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
