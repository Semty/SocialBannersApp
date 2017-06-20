//
//  ContentColorView.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 20.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class ContentColorView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        self.layer?.cornerRadius = 4.0
        // Drawing code here.
    }
    
}
