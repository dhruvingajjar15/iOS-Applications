//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Dhruvin Gajjar on 7/20/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!

    @IBOutlet weak var nameLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        nameLbl.text = pokemon.name
    }

}
