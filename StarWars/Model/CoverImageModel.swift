//
//  CoverImageModel.swift
//  StarWars
//
//  Created by Shalom Owolabi on 18/04/2022.
//

import SwiftUI

// MARK: - CoverImage
struct CoverImage: Codable, Identifiable {
    let id: Int
    let name: String
    let characterName: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case characterName = "character_name"
    }
}

typealias CoverImageModel = [CoverImage]
