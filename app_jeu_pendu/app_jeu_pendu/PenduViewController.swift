//
//  PenduViewController.swift
//  app_jeu_pendu
//
//  Created by Guillaume Hostache on 19/03/2024.
//

import UIKit

class PenduViewController: UIViewController {
    var etape = 0 // étape du gibet de potence
    var niveau = 1 // niveau de jeu par défaut
    var premier = 0, dernier = 0 // premier et dernier caractère caché dans l'outlet mot
    var lettreATrouver = 0 // Nombre de lettre que l'on devra trouver
    
    // la liste des mots possibles à deviner
    var mots = ["POMME", "KIWI", "FRAISE", "ORANGE", "BANANE", "POIRE",
                "CITRON", "FRAMBOISE", "CERISE", "FRUITS", "LEGUMES", "NAVET",
                "TOMATES", "COURGETTE", "ARTICHAUT", "CAROTTE", "CHOUFLEUR", "POIREAUX"]
    
    var mot_secret = "" // le mot que l'on doit deviner
    
    @IBOutlet weak var vignette: UIImageView!
    @IBOutlet weak var mot: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet var clavier: [UIButton]!
    
    @IBAction func clic(_ sender: UIButton) {
        let lettre = sender.titleLabel!.text!
        print("la lettre \(lettre) a été cliquée")
        sender.isEnabled = false
        
        var motCache : [Character] = []
        var trouve :Bool = false // Si on trouve une lettre du mot secret, true, false sinon
        
        for l in mot.text! {
            motCache.append(l)
        }
        
        for (i, l) in mot_secret.enumerated() {
            if (premier > i) || (i > dernier) { // lettre déjà dévoilée
                continue
            }
            
            if lettre == String(l) {
                motCache[i] = l // la lettre est dévoilé
                lettreATrouver -= 1 // on décrémente le nombre de lettre à trouver
                trouve = true
            }
        }
        
        if (lettreATrouver == 0) {
            finPartie("Vous avez gagné !")
        }
        
        if !trouve {
            etape += 1
            print("on passe à l'étape \(etape) du gibet de potence")
            vignette.image = UIImage(named: "pendu\(etape)")
            if (etape == 11) {
                finPartie("vous avez perdu ...")
            }
        }
        
        mot.text = ""
        for l in motCache {
            mot.text! += String(l)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("le niveau de jeu est \(niveau)")
        mot_secret = mots.randomElement()!
        
        print("le mot secret est \(mot_secret)")
        mot.text = "" // On efface le mot caché
        
        switch niveau {
        case 1: premier = 1; dernier = mot_secret.count - 2
        case 2: premier = 1; dernier = mot_secret.count - 1
        case 3: premier = 0; dernier = mot_secret.count - 1
        default: break
        }
        
        lettreATrouver = dernier - premier + 1
        
        var i = 0
        for l in mot_secret { // on parcourt toutes les lettres de notre mot secret
            if (premier <= i) && (i <= dernier) {
                mot.text! += "-" // on masque la lettre
            } else {
                mot.text! += String(l)
            }
            i += 1
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func finPartie(_ chaine : String) {
        message.isHidden = false
        message.text = chaine
        for b in clavier {
            b.isEnabled = false
        }
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
