//
//  Pokdex.swift
//  PokeDex
//
//  Created by Michael Flowers on 10/1/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    
    //if error make an enum Codingkeys for all the properties
    
    let name: String
    let id: Int
    let sprites: Sprite
    let abilities: [AbilityDictionary]
}

struct Sprite: Codable {
    let imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "front_shiny"
    }
}

struct AbilityDictionary: Codable {
    let ability: Ability
    
    struct Ability: Codable {
        let name: String
    }
}
