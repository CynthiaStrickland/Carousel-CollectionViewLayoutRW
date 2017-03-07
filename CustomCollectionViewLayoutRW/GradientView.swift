//
//  GradientView.swift
//  CustomCollectionViewLayoutRW
//
//  Created by Cynthia Strickland on 3/7/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    lazy fileprivate var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.clear.cgColor, UIColor(white: 0.0, alpha: 0.75).cgColor]
        layer.locations = [NSNumber(value: 0.0 as Float), NSNumber(value: 1.0 as Float)]
        return layer
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
}
