//
//  CharacterFlowLayout.swift
//  CustomCollectionViewLayoutRW
//
//  Created by Cynthia Strickland on 3/7/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit

class CharacterFlowLayout: UICollectionViewFlowLayout {

    let standardItemAlpha: CGFloat = 0.5
    let standardItemScale: CGFloat = 0.5
    
    override func prepare() {
        super.prepare()
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        var attributesCopy = [UICollectionViewLayoutAttributes]()
                //This method returns an array of attributes for the collectionView

        for itemAttributes in attributes! {
            let itemAttributesCopy = itemAttributes.copy() as! UICollectionViewLayoutAttributes
        
                //Call helper method
        changeLayoutAttributes(itemAttributesCopy)
        attributesCopy.append(itemAttributesCopy)
            
        }
            return attributesCopy
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
        // Tells view to update itself when the collection view is scrolling
    }
    
    func changeLayoutAttributes(_ attributes: UICollectionViewLayoutAttributes) {
        
        let collectionCenter = collectionView!.frame.size.height / 2
        let offset = collectionView!.contentOffset.y    //Takes into account the offset of the objects
        let normalizedCenter = attributes.center.y - offset
        let maxDistance = self.itemSize.height + self.minimumLineSpacing
        let distance = min(abs(collectionCenter - normalizedCenter), maxDistance)
        
        let ratio = (maxDistance - distance)/(maxDistance)
        
        let alpha = ratio * (1 - self.standardItemAlpha) + self.standardItemAlpha
        let scale = ratio * (1 - self.standardItemScale) + self.standardItemScale
        
        attributes.alpha = alpha
        attributes.transform3D = CATransform3DTranslate(CATransform3DIdentity, scale, scale, 1)
        
        
    }
}
