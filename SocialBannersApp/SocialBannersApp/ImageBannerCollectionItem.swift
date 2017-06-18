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
        view.layer?.backgroundColor = NSColor.clear.cgColor
        view.layer?.cornerRadius = 4
    }
    
    func setHighlight(_ selected: Bool, atIndex index: Int) {
        
        let selectedColor = NSColor(red: 0.07843137,
                                    green: 0.67058824,
                                    blue: 0.98431373,
                                    alpha: 1.0)
        let imageView = self.view as! BackgroundImageView
        
        if selected {
            imageView.setBackgroundImage(withIndex: index,
                                         andColor: selectedColor)
            imageView.layer?.backgroundColor = .white
        } else {
            imageView.setBackgroundImage(withIndex: index,
                                         andColor: .white)
            imageView.layer?.backgroundColor = .clear
        }
        
        imageView.layer?.setNeedsDisplay()
    }
}
