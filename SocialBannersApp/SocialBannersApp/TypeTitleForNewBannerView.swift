//
//  TypeTitleForNewBannerView.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 14.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class TypeTitleForNewBannerView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        self.layer?.cornerRadius = 4
        self.layer?.backgroundColor = NSColor.white.cgColor
        self.layer?.opacity = 0.3
        
        // Drawing code here.
    }
    
}
