//
//  ContentColorBannerCollectionItem.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 20.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class ContentColorBannerCollectionItem: NSCollectionViewItem {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.clear.cgColor
        view.layer?.cornerRadius = 4
        // Do view setup here.
    }
    
}
