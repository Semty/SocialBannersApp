//
//  SaveButton.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 17.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class SaveButton: NSButton {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        self.layer?.cornerRadius = 4
        self.layer?.backgroundColor = .white
        
        let titleColor =
            NSColor(red: 0.10588235,
                    green: 0.61568627,
                    blue: 0.96862745,
                    alpha: 1.0)
        let pstyle = NSMutableParagraphStyle()
        pstyle.alignment = .center
        let titleFont = NSFont(name: "Avenir Next Bold",
                               size: 14)
        
        self.attributedTitle = NSAttributedString(string: Translation.saveString,
                                                  attributes: [NSFontAttributeName: titleFont!,NSForegroundColorAttributeName: titleColor, NSParagraphStyleAttributeName: pstyle])
        
        // Drawing code here.
    }
    
}
