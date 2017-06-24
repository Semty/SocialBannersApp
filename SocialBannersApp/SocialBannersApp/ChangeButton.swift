//
//  ChangeButton.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 17.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class ChangeButton: NSButton {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        self.layer?.cornerRadius = 4
        self.layer?.backgroundColor = .white
        
        let titleColor =
            NSColor(red: 0.10980392,
                    green: 0.55686275,
                    blue: 0.8745098,
                    alpha: 1.0)
        let pstyle = NSMutableParagraphStyle()
        pstyle.alignment = .center
        let titleFont = NSFont(name: "Avenir Next Medium",
                               size: 10)
        
        self.attributedTitle = NSAttributedString(string: Translation.changeString,
                                                  attributes: [NSFontAttributeName: titleFont!,NSForegroundColorAttributeName: titleColor, NSParagraphStyleAttributeName: pstyle])
        
        // Drawing code here.
    }
    
}
