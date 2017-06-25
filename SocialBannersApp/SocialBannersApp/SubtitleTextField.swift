//
//  SubtitleTextField.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 21.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class SubtitleTextField: NSTextField {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    override func becomeFirstResponder() -> Bool {
        
        let success = super.becomeFirstResponder()
        
        if success {
            let textfield = (self.currentEditor()) as! NSTextView
            if textfield.responds(to: #selector(setter: NSTextView.insertionPointColor)) {
                textfield.insertionPointColor = .white
            }
        }
        return success
    }
}
