//
//  CrtBnnrBgScrollView.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 02.06.17.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa
import Darwin

class CrtBnnrBgScrollView: NSScrollView {
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        self.scrollerStyle = .overlay
        self.scrollerKnobStyle = .light
        // Drawing code here.
    }

    override func scrollWheel(with event: NSEvent) {
        
        var shouldForwardScroll = false
        
        if self.usesPredominantAxisScrolling {
            
            if fabs(event.deltaX) > fabs(event.deltaY) {
                
                
                 // horizontal scroll
                 if !self.hasHorizontalScroller {
                 shouldForwardScroll = true
                 }
            } else {
                /*
                 // vertical scroll
                 if !self.hasVerticalScroller {
                 shouldForwardScroll = true
                 }*/
            }
        }
        
        if shouldForwardScroll {
            self.nextResponder?.scrollWheel(with: event)
        } else {
            super.scrollWheel(with: event)
        }
        
    }
}




