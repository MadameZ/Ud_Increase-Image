//
//  MyImage.swift
//  increase-Image
//
//  Created by Caroline Zaini on 26/05/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class MyImage: UIImageView {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        draw(frame)
        isUserInteractionEnabled = true
    }
    
    /// Il faut demander à appeler le draw avec le required init
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        contentMode = .scaleAspectFill
        clipsToBounds = true
        /// méthodes du fichier CALayer extension
        layer.circle(rect.width)
        layer.border()
    }

}
