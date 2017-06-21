//
//  TitleView.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 28.05.17.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class TitleView: NSView {
    
    var gradientLayer = CAGradientLayer()

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        if gradientLayer.superlayer == nil {
            setBackgroundLayer()
        }
        
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
        
        let endSublayersIndex = UInt32((self.layer?.sublayers?.endIndex)!) - 1
        
        self.layer?.insertSublayer(gradientLayer,
                                   at: endSublayersIndex)
        
        let shadow = NSShadow()
        shadow.shadowOffset = NSSize(width: 0, height: -2)
        shadow.shadowColor = NSColor.black.withAlphaComponent(0.25)
        shadow.shadowBlurRadius = 4
        self.shadow = shadow
    }
}


