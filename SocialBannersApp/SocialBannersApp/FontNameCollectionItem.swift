//
//  FontNameCollectionItem.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 20.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class FontNameCollectionItem: NSCollectionViewItem {

    @IBOutlet weak var fontNameLabel: NSTextFieldCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.clear.cgColor
        fontNameLabel.textColor = NSColor.hexColor(rgbValue: 0x14ABFB)
        // Do view setup here.
    }
    
    func setFont(withType font: FontModel) {
        self.fontNameLabel.font = NSFont(name: font.type.rawValue,
                                         size: 18.0)
        self.fontNameLabel.stringValue = font.type.rawValue
    }
    
}
