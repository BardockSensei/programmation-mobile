//
//  ViewController.swift
//  app_jeu_pendu
//
//  Created by Guillaume Hostache on 19/03/2024.
//

import UIKit

class ViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bouton = sender as! UIButton
        print("Vous avez cliquez sur le bouton \(bouton.tag)")
    
        let destination = segue.destination as! PenduViewController
        destination.niveau = bouton.tag // on définit le niveau de jeu avec l'étiquette du bouton qui a été cliqué (1, 2 ou 3)
        
    }
}