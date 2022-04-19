//
//  CONSTANTS.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import Foundation

// MARK: Constants
struct Constants {
    static private let BASE_URL = "https://swapi.dev/api/"
    
    // computed fullURL
    static func fullURL(with urlExtension: URLExtensions) -> String {
        return Constants.BASE_URL + urlExtension.rawValue
    }
}

// MARK: URLExtensions
// created this first. turned out to be the major switcher on the app.
enum URLExtensions: String {
    case planets
    case starships
    case vehicles
    case people
    case films
    case species
}
