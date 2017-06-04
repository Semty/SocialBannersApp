//
//  GradientView.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 02.06.17.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class GradientView: NSView {

    var gradientLayer = CAGradientLayer()
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        setBackgroundLayer()

        // Drawing code here.
    }
    
    func setBackgroundLayer() {
        
        let firstGradientColor = CGColor.init(red: 0.10196078,
                                              green: 0.83921569,
                                              blue: 0.99215686,
                                              alpha: 1.0)
        let secondDradientColor = CGColor.init(red: 0.11372549,
                                               green: 0.38431373,
                                               blue: 0.94117647,
                                               alpha: 1)
        
        gradientLayer = createGradientLayer(withFirstColor: firstGradientColor,
                                            secondColor: secondDradientColor,
                                            andFrame: self.bounds)
        
        self.layer?.addSublayer(gradientLayer)
    }
}
