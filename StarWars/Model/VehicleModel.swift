//
//  VehicleModel.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import SwiftUI

// MARK: - VehiclesModel
struct VehiclesModel: Codable {
    let count: Int
    let next, previous: String?
    let results: [VehiclesResult]
}

// MARK: VehiclesResult
struct VehiclesResult: Hashable, Codable {
    let name, model, manufacturer, costInCredits: String
    let length, maxAtmospheringSpeed, crew, passengers: String
    let cargoCapacity, consumables, vehicleClass: String
    let pilots, films: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case costInCredits = "cost_in_credits"
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case length, crew, passengers
        case cargoCapacity = "cargo_capacity"
        case consumables
        case vehicleClass = "vehicle_class"
        case model, manufacturer, pilots, films, created, edited, url
    }
}
