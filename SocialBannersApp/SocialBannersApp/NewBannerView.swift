//
//  NewBannerView.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 03.06.17.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class NewBannerView: NSView {

    var gradientLayer = CAGradientLayer()
    var backgroundColors: [CGColor] = [.white, .white]
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        if gradientLayer.superlayer == nil {
            setBackgroundColor(withColors: backgroundColors)
        }
        
        self.layer?.backgroundColor = .clear
        self.layer?.cornerRadius = 6.0
        
        let shadow = NSShadow()
        shadow.shadowOffset = NSSize(width: 0, height: -2)
        shadow.shadowColor = NSColor.black.withAlphaComponent(0.25)
        shadow.shadowBlurRadius = 8
        self.shadow = shadow
        // Drawing code here.
    }
    
    func setBackgroundColor(withColors colors: [CGColor]) {
        
        backgroundColors = colors
        gradientLayer.colors = backgroundColors
        
        if gradientLayer.superlayer == nil {
            self.layer?.addSublayer(gradientLayer)
            gradientLayer.cornerRadius = 6.0
            gradientLayer.frame = self.bounds
        }
    }
}
