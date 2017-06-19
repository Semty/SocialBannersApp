//
//  ColorModel.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 18.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class ColorModel {

    var name: String
    
    var fillColor: NSColor?
    
    var firstGradientColor: NSColor?
    var secondGradientColor: NSColor?
    
    init(name: String, fillColor: NSColor) {
        self.name = name
        self.fillColor = fillColor
    }
    
    init(name: String, firstGradientColor: NSColor, secondGradientColor: NSColor) {
        self.name = name
        self.firstGradientColor = firstGradientColor
        self.secondGradientColor = secondGradientColor
    }
}
