//
//  PokemonController.swift
//  PokeDex
//
//  Created by Michael Flowers on 10/1/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

class PokemonController {
    
    func fetchPokemon(with searchTerm: String, completion: @escaping (Pokemon?, Error?) ->Void){
//        let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon\(searchTerm.lowercased())")!
        let baseURL = URL(string: "https://pokeapi.co/api/v2)")!
        let pokemonComponent = baseURL.appendingPathComponent("pokemon")
        let finalURL = pokemonComponent.appendingPathComponent(searchTerm.lowercased())
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error making request: \(error)/// \(error.localizedDescription)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                print("Error unwrapping data")
                completion(nil, NSError())
                return
            }
            
            let jD = JSONDecoder()
            do {
                let pokemon = try jD.decode(Pokemon.self, from: data)
                completion(pokemon, nil)
            } catch {
                print("Error decoding pokemon: \(error) //\(error.localizedDescription)")
                completion(nil, error)
                return
            }
        }.resume()
        
    }
}
