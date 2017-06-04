//
//  CrtBnnrBgScrollView.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 02.06.17.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class CrtBnnrBgScrollView: NSScrollView {

    var gradientLayer = CAGradientLayer()
    var whiteSquadLayer = CALayer()
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        /*
        if gradientLayer.superlayer == nil {
            setBackgroundLayer()
        }*/
        
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
        
        whiteSquadLayer.frame = CGRect(x: 0,
                                       y: 0,
                                       width: self.bounds.width,
                                       height: 95)
        whiteSquadLayer.backgroundColor = .white
        
        gradientLayer = createGradientLayer(withFirstColor: secondDradientColor,
                                            secondColor: firstGradientColor,
                                            andFrame: CGRect.init(x: 0,
                                                                  y: 95,
                                                                  width: self.bounds.width,
                                                                  height: self.bounds.height))

        self.layer?.insertSublayer(gradientLayer,
                                   at: 0)
        self.layer?.insertSublayer(whiteSquadLayer, above: gradientLayer)
    }
}




