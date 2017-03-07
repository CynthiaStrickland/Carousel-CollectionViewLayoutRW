//
//  Characters.swift
//  CustomCollectionViewLayoutRW
//
//  Created by Cynthia Strickland on 3/7/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit

class Characters {
    var name: String
    var title: String
    var description: String
    var hitPoints: Int
    var attack: String
    var damage: String
    
    init(name: String,
         title: String,
         description: String,
         hitPoints: Int,
         attack: String,
         damage: String) {
        
        self.name = name
        self.title = title
        self.description = description
        self.hitPoints = hitPoints
        self.attack = attack
        self.damage = damage
    }
    
    convenience init(dictionary: NSDictionary) {
        let name = dictionary["name"] as? String
        let title = dictionary["title"] as? String
        let description = dictionary["description"] as? String
        let hitPoints = dictionary["hitPoints"] as? Int
        let attack = dictionary["attack"] as? String
        let damage = dictionary["damage"] as? String
        
        self.init(name: name!,
                  title: title!,
                  description: description!,
                  hitPoints: hitPoints!,
                  attack: attack!,
                  damage: damage!)
    }
    
    class func loadCharacters() -> [Characters] {
        var characters = [Characters]()
        if let path = Bundle.main.path(forResource: "Character_Data", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                for item in dictArray {
                    let character = Characters(dictionary: item as! NSDictionary)
                    characters.append(character)
                }
            }
        }
        return characters
    }
    
    
}
