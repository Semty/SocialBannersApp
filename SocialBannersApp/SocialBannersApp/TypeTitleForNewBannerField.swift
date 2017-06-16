//
//  TypeTitleForNewBannerField.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 14.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class TypeTitleForNewBannerField: NSTextField {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        let stringColor = NSColor.white
        let keke = stringColor.withAlphaComponent(0.1)
        
        let string = NSMutableAttributedString(string: "Enter a Title", attributes: [NSFontAttributeName: NSFont.init(name: "AvenirNext-Regular", size: 13.0)!, NSForegroundColorAttributeName: keke])
        string.setAlignment(.center, range: .init(location: 0, length: string.length))
        
        self.placeholderAttributedString = string
        // Drawing code here.
    }
    
}
