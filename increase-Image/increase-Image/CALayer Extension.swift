//
//  CALayer Extension.swift
//  increase-Image
//
//  Created by Caroline Zaini on 26/05/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

extension CALayer {
    
    func radius(_ radius: CGFloat) {
        cornerRadius = radius
    }
    
    func shadow() {
        shadowColor = UIColor.black.cgColor
        shadowRadius = 2
        shadowOffset = CGSize(width: 2, height: 2)
        shadowOpacity = 0.75
    }
    
    func circle(_ width: CGFloat) {
        cornerRadius = width / 2
    }
    
    func border() {
        borderColor = UIColor.white.cgColor
        borderWidth = 2
    }
}
