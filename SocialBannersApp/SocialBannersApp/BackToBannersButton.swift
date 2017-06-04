//
//  BackToBannersButton.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 02.06.17.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class BackToBannersButton: NSButton {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        BaseElementsBezierPaths.drawBackArrow()
        
        // Drawing code here.
    }
    
}
