//
//  RoundedPartView.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 02.06.17.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class RoundedPartView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        BaseElementsBezierPaths.drawArea(frame: dirtyRect,
                                         resizing: .stretch)
        // Drawing code here.
    }
    
}
