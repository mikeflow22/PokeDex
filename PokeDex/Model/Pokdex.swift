//
//  Pokdex.swift
//  PokeDex
//
//  Created by Michael Flowers on 10/1/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    let name: String
    let id: Int
    let sprites: Sprite
    let abilities: [AbilityDictionary]
}

struct Sprite: Codable {
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "front_Shiny"
    }
}

struct AbilityDictionary: Codable {
    let ability: Ability
    
    struct Ability: Codable {
        let name: String
    }
}
