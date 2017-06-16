//
//  ImageBannerCollectionItem.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 13.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class ImageBannerCollectionItem: NSCollectionViewItem {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.lightGray.cgColor
        view.layer?.borderWidth = 0.0
        view.layer?.borderColor = NSColor.white.cgColor
    }
    
    func setHighlight(_ selected: Bool) {
        view.layer?.borderWidth = selected ? 2.0 : 0.0
    }
}
