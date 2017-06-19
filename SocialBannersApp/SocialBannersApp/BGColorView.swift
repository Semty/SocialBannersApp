//
//  BGColorView.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 19.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class BGColorView: NSView {

    var gradientLayer = CAGradientLayer()
    var backgroundColors: [CGColor] = [.white, .white]
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        if gradientLayer.superlayer == nil {
            setBackgroundColor(withColors: backgroundColors)
        }
        
        self.layer?.backgroundColor = .white
        self.layer?.cornerRadius = 4.0
        
        // Drawing code here.
    }
    
    func setBackgroundColor(withColors colors: [CGColor]) {
        
        backgroundColors = colors
        gradientLayer.colors = backgroundColors
        
        if gradientLayer.superlayer == nil {
            self.layer?.addSublayer(gradientLayer)
            gradientLayer.cornerRadius = 4.0
            gradientLayer.frame = self.bounds
        }
    }
}
