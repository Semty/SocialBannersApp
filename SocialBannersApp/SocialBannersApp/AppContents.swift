//
//  AppContents.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 18.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class AppContents: NSObject {

    static func getFontsModel() -> [FontModel] {
        return [
            FontModel(type: .avenirNextDemiBold),
            FontModel(type: .avenitNextBold),
            FontModel(type: .avenirNextMedium),
            FontModel(type: .avenirNexRegular),
            FontModel(type: .avenirNextCondensedMedium),
            FontModel(type: .avenirNextCondensedBold),
            FontModel(type: .timesNewRoman),
            FontModel(type: .georgia),
            FontModel(type: .georgiaBold),
            FontModel(type: .gillSans),
            FontModel(type: .gillSansBold)
        ]
    }
    
    static func getContentColor() -> [ColorModel] {
        return [
            ColorModel(name: "Sky",
                       fillColor: NSColor.hexColor(rgbValue: 0x14ABFB)),
            ColorModel(name: "White",
                       fillColor: .white),
            ColorModel(name: "Gray",
                       fillColor: NSColor.hexColor(rgbValue: 0x5F6F7D)),
            ColorModel(name: "Night",
                       fillColor: NSColor.hexColor(rgbValue: 0x415C8E)),
            ColorModel(name: "Black",
                       fillColor: .black),
            ColorModel(name: "Orange",
                       fillColor: NSColor.hexColor(rgbValue: 0xF6A623)),
            ColorModel(name: "Red",
                       fillColor: NSColor.hexColor(rgbValue: 0xD0011B)),
            ColorModel(name: "Green",
                       fillColor: NSColor.hexColor(rgbValue: 0x7ED321)),
            ColorModel(name: "Pink",
                       fillColor: NSColor.hexColor(rgbValue: 0xBD0FE1)),
            ColorModel(name: "Purple",
                       fillColor: NSColor.hexColor(rgbValue: 0x9012FE)),
            ColorModel(name: "Cian",
                       fillColor: NSColor.hexColor(rgbValue: 0x02CBE4)),
            ColorModel(name: "Light Blue",
                       fillColor: NSColor.hexColor(rgbValue: 0xA8C4F0))
        ]
    }
    
    static func getBackgroundColors() -> [ColorModel] {
        return [
            ColorModel(name: "White",
                       fillColor: .white),
            ColorModel(name: "Gray",
                       fillColor: NSColor.hexColor(rgbValue: 0x5F6F7D)),
            ColorModel(name: "Sky",
                       fillColor: NSColor.hexColor(rgbValue: 0x14ABFB)),
            ColorModel(name: "Water",
                       fillColor: NSColor.hexColor(rgbValue: 0x9CE2FF)),
            ColorModel(name: "Night",
                       fillColor: NSColor.hexColor(rgbValue: 0x415C8E)),
            ColorModel(name: "Black",
                       fillColor: .black),
        
            ColorModel(name: "Sea Water",
                       firstGradientColor: NSColor.hexColor(rgbValue: 0x1AD6FD),
                       secondGradientColor: NSColor.hexColor(rgbValue: 0x1D62F0)),
            ColorModel(name: "Salt",
                       firstGradientColor: NSColor.hexColor(rgbValue: 0x7AFFE0),
                       secondGradientColor: NSColor.hexColor(rgbValue: 0x2991F3)),
            ColorModel(name: "Pastel",
                       firstGradientColor: NSColor.hexColor(rgbValue: 0x01DBFC),
                       secondGradientColor: NSColor.hexColor(rgbValue: 0x0985CD)),
            ColorModel(name: "Fantasy",
                       firstGradientColor: NSColor.hexColor(rgbValue: 0x9155E1),
                       secondGradientColor: NSColor.hexColor(rgbValue: 0x67ECFF)),
            ColorModel(name: "Hot",
                       firstGradientColor: NSColor.hexColor(rgbValue: 0xFBDA61),
                       secondGradientColor: NSColor.hexColor(rgbValue: 0xF76B1C)),
            ColorModel(name: "Linier Hot",
                       firstGradientColor: NSColor.hexColor(rgbValue: 0xFC6E51),
                       secondGradientColor: NSColor.hexColor(rgbValue: 0xDB391E)),
            ColorModel(name: "Red",
                       firstGradientColor: NSColor.hexColor(rgbValue: 0xF5515F),
                       secondGradientColor: NSColor.hexColor(rgbValue: 0x9F031B)),
            ColorModel(name: "Nature",
                       firstGradientColor: NSColor.hexColor(rgbValue: 0x81D86D),
                       secondGradientColor: NSColor.hexColor(rgbValue: 0x23AE87)),
            ColorModel(name: "Linier",
                       firstGradientColor: NSColor.hexColor(rgbValue: 0x48CFAD),
                       secondGradientColor: NSColor.hexColor(rgbValue: 0x19A784)),
            ColorModel(name: "Pink",
                       firstGradientColor: NSColor.hexColor(rgbValue: 0xEC87C0),
                       secondGradientColor: NSColor.hexColor(rgbValue: 0xBF4C90)),
            ColorModel(name: "Light Buisness",
                       firstGradientColor: NSColor.hexColor(rgbValue: 0xEDF1F7),
                       secondGradientColor: NSColor.hexColor(rgbValue: 0xC9D7E9)),
            ColorModel(name: "Business",
                       firstGradientColor: NSColor.hexColor(rgbValue: 0xCCD1D9),
                       secondGradientColor: NSColor.hexColor(rgbValue: 0x8F9AA8))
        ]
    }
    
}
