//
//  NewBannerView.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 03.06.17.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class NewBannerView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        self.layer?.backgroundColor = .white
        self.layer?.cornerRadius = 6.0
        
        let shadow = NSShadow()
        shadow.shadowOffset = NSSize(width: 0, height: -2)
        shadow.shadowColor = NSColor.black.withAlphaComponent(0.25)
        shadow.shadowBlurRadius = 8
        self.shadow = shadow
        // Drawing code here.
    }
    
}
