//
//  AddBannerButton.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 28.05.17.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class AddBannerButton: NSButton {
    
    var gradientLayer = CAGradientLayer()
    
    var verLinePlusLayer = CAShapeLayer()
    var horLinePlusLayer = CAShapeLayer()

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        if gradientLayer.superlayer == nil {
            setBackgroundLayer()
            self.layer?.cornerRadius = dirtyRect.size.height / 2
        }
        
        // Drawing code here.
    }
    
    func setBackgroundLayer() {
        
        // Creation Background Color (Gradient)
        let firstGradientColor = CGColor.init(red: 0.10196078,
                                              green: 0.83921569,
                                              blue: 0.99215686,
                                              alpha: 1.0)
        let secondDradientColor = CGColor.init(red: 0.11372549,
                                               green: 0.38431373,
                                               blue: 0.94117647,
                                               alpha: 1)
        
        gradientLayer = createGradientLayer(withFirstColor: secondDradientColor,
                                            secondColor: firstGradientColor,
                                            andFrame: self.bounds)
    
        self.layer?.addSublayer(gradientLayer)
        
        // Creation Plus on the Button
        verLinePlusLayer.path =
            CGPath(roundedRect: CGRect.init(x: self.bounds.size.width / 2 - 0.3,
                                            y: self.bounds.size.height / 4,
                                            width: 0.6,
                                            height: self.bounds.size.height / 2),
                   cornerWidth: 0.2,
                   cornerHeight: 0.2,
                   transform: nil)
        
        horLinePlusLayer.path =
            CGPath(roundedRect: CGRect.init(x: self.bounds.size.height / 4,
                                            y: self.bounds.size.width / 2 - 0.3,
                                            width: self.bounds.size.height / 2,
                                            height: 0.6),
                   cornerWidth: 0.2,
                   cornerHeight: 0.2,
                   transform: nil)
        
        verLinePlusLayer.strokeColor = .white
        verLinePlusLayer.fillColor = .white
        horLinePlusLayer.strokeColor = .white
        horLinePlusLayer.fillColor = .white
        
        self.layer?.addSublayer(verLinePlusLayer)
        self.layer?.addSublayer(horLinePlusLayer)
    }
}







