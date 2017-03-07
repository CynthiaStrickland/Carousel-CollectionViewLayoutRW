//
//  DetailViewController.swift
//  CustomCollectionViewLayoutRW
//
//  Created by Cynthia Strickland on 3/7/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var hitPointsLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var damageLabel: UILabel!
    
    var character: Characters?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let theCharacter = character {
            navigationItem.title = theCharacter.title
            descriptionLabel.text = theCharacter.description
            characterImage.image = UIImage(named: theCharacter.name)
            hitPointsLabel.text = "\(theCharacter.hitPoints)"
            attackLabel.text = "\(theCharacter.attack)"
            damageLabel.text = "\(theCharacter.damage)"
        }
    }
}
