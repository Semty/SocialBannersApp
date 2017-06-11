//
//  IconLabel.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 11.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class IconLabel: NSTextField {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        let shadow = NSShadow()
        shadow.shadowOffset = NSSize(width: 0, height: -1)
        shadow.shadowColor = NSColor.black.withAlphaComponent(0.25)
        self.shadow = shadow
        // Drawing code here.
    }
    
}
