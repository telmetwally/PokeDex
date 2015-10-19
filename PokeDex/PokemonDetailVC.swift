//
//  PokemonDetailVC.swift
//  PokeDex
//
//  Created by Tamer ElMetwally on 10/15/15.
//  Copyright © 2015 Tamer ElMetwally. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    @IBOutlet weak var mainImg: UIImageView!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var typeLbl: UILabel!
    
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokeDexLbl: UILabel!
    
    @IBOutlet weak var weightLblt: UILabel!
    @IBOutlet weak var bassAttackLbl: UILabel!
    
    @IBOutlet weak var currentEvoImg: UIImageView!
    
    @IBOutlet weak var nextEvoImg: UIImageView!
    var pokemon: Pokemon!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var evoLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = pokemon.name.capitalizedString
        let img = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImg.image = img
        currentEvoImg.image = img
                
        
        pokemon.downloadingPokemonDetails { () -> () in
            // this code will run after download is done
            self.updateUI()
            
            
        }

    }
    
    func updateUI() {
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        pokeDexLbl.text = "\(pokemon.pokedexId)"
        weightLblt.text = pokemon.weight
        bassAttackLbl.text = pokemon.attack
        
        
        if pokemon.nextEvoId == "" {
            evoLbl.text = " NO Evolutions"
            nextEvoImg.hidden = true
        } else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvoId)
            var str = " Next Evolution: \(pokemon.nextEvoText)"
            
            if pokemon.nextEvoLvl != "" {
                str += " - LVL \(pokemon.nextEvoLvl)"
            }
        }
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtn(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

  
}
