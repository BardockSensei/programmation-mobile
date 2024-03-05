//
//  JeuViewController.swift
//  app_trie_dechet
//
//  Created by Guillaume Hostache on 05/03/2024.
//

import UIKit

class JeuViewController: UIViewController {

    @IBOutlet var poubelles: [UIImageView]!
    @IBOutlet var dechets: [UIImageView]!
    
    var objetTouche = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let t = touches.randomElement()!
        let p = t.location(in: view)
        print("Vous avez touché le point de coordonnées (\(p.x),\(p.y))")
        
        var i = 0
        for dechet in dechets {
            if dechet.frame.contains(p) {
                print("Vous avez touché l'objet n°\(i)")
                objetTouche = i
            }
            i += 1
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let t = touches.randomElement()!
        let p = t.location(in: view)
        
        dechets[objetTouche].center = p
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
