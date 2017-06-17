//
//  BackgroundColorForNewBannerView.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 17.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class BackgroundColorForNewBannerView: NSView {

    var backgroundColor = NSColor.white {
        didSet {
            self.layer?.backgroundColor = backgroundColor.cgColor
        }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        self.layer?.cornerRadius = 4
        self.layer?.backgroundColor = backgroundColor.cgColor
        
        // Drawing code here.
    }
    
}
