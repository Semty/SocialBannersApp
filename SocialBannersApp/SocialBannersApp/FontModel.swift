//
//  FontModel.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 20.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class FontModel: NSObject{

    var type: FontString
    
    init(type: FontString) {
        self.type = type
    }
}

enum FontString: String {
    case avenirNextDemiBold = "Avenir Next Demi Bold"
    case avenitNextBold = "Avenir Next Bold"
    case avenirNextMedium = "Avenir Next Medium"
    case avenirNexRegular = "Avenir Next Regular"
    case avenirNextCondensedMedium = "Avenir Next Condensed Medium"
    case avenirNextCondensedBold = "Avenir Next Condensed Bold"
    case timesNewRoman = "Times New Roman"
    case georgia = "Georgia"
    case georgiaBold = "Georgia Bold"
    case gillSans = "Gill Sans"
    case gillSansBold = "Gill Sans Bold"
}
