//
//  PokeCell.swift
//  pokedex
//
//  Created by Dhruvin Gajjar on 7/20/17.
//  Copyright © 2017 Dhruvin Gajjar. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImag: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalized
        thumbImag.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
}
