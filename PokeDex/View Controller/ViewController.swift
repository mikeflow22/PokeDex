//
//  ViewController.swift
//  PokeDex
//
//  Created by Michael Flowers on 10/1/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UISearchBarDelegate {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       searchBar.delegate = self
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        pokemonImage.alpha = 0
        self.view.backgroundColor = .white
        self.nameLabel.textColor = .clear
        self.idLabel.textColor = .clear
        self.abilityLabel.textColor = .clear
        self.searchBar.barTintColor = .cyan
        guard let name = searchBar.text, !name.isEmpty else { return }
        PokemonController.fetchPokemon(with: name) { (pokemon, error) in
            if let error = error {
                print("Error actually calling pokemon in viewController: \(error)")
            }
            guard let returnedPokemon = pokemon else { return }
            
            DispatchQueue.main.async {
                self.nameLabel.text = returnedPokemon.name
                self.idLabel.text = "\(returnedPokemon.id)"
                self.abilityLabel.text = returnedPokemon.abilities.compactMap { $0.ability.name }.joined(separator: ",")
            }
            
            PokemonController.fetchPokemonImage(with: returnedPokemon, completion: { (image) in
                DispatchQueue.main.async {
                    self.pokemonImage.image = image
                    UIView.animate(withDuration: 3, animations: {
                        self.view.backgroundColor = .black
                        self.nameLabel.textColor = .gray
                        self.idLabel.textColor = .red
                        self.abilityLabel.textColor = .gray
                        self.pokemonImage.alpha = 1
                        self.searchBar.barTintColor = .black
                    })
                }
            })
        }
    }
    

}

