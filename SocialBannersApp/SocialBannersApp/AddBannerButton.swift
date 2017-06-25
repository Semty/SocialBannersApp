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
            self.gradientLayer.cornerRadius = dirtyRect.size.height / 2
        }
        NSView.setShadowFor(view: self)
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
        
        let width: CGFloat = 1.35
        
        verLinePlusLayer.path =
            CGPath(roundedRect: CGRect.init(x: self.bounds.size.width / 2 - width/2,
                                            y: self.bounds.size.height / 4,
                                            width: width,
                                            height: self.bounds.size.height / 2),
                   cornerWidth: 0.2,
                   cornerHeight: 0.2,
                   transform: nil)
        
        horLinePlusLayer.path =
            CGPath(roundedRect: CGRect.init(x: self.bounds.size.height / 4,
                                            y: self.bounds.size.width / 2 - width/2,
                                            width: self.bounds.size.height / 2,
                                            height: width),
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







