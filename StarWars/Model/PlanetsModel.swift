//
//  PlanetsModel.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import SwiftUI

// MARK: - PlanetsModel
struct PlanetsModel: Codable, Equatable {
    let count: Int
    let next, previous: String?
    let results: [PlanetsResult]
}

// MARK: - PlanetsResult
struct PlanetsResult: Hashable, Codable {
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let residents, films: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}
