//
//  BannerModel.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 18.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class BannerModel: NSObject {

    var iconImage: ImageIndex = .empty                      // default
    var contentColor = NSColor.hexColor(rgbValue: 0x14ABFB) // default
    var backgroundColor = [NSColor.white.cgColor, NSColor.white.cgColor]  // default
    var bgColorName = "White"
    var contentColorName = "Sky"
    var fontName = "Avenir Next Medium"
}
