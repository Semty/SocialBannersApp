//
//  PreviewBannerCollectionItem.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 23/06/2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class PreviewBannerCollectionItem: NSCollectionViewItem {
    
// MARK: - IBOutlet's
    
    @IBOutlet var newBannerView: NewBannerView!
    
    @IBOutlet weak var newBannerImage: BackgroundImageView!
    @IBOutlet weak var newBannerTitleLabel: TitleTextField!
    @IBOutlet weak var newBannerSubtitleLabel: SubtitleTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.clear.cgColor
    }
    
    func setAllElements(withCurrentModel newBannerModel: BannerModel) {
        
        newBannerImage.removeFromSuperview()
        self.newBannerView.addSubview(newBannerImage)
        self.newBannerView.layout()
        
        if newBannerModel.iconImage == .empty {
            newBannerImage.isHidden = true
        } else {
            newBannerImage.isHidden = false
            newBannerImage.setBackgroundImage(withIndex: newBannerModel.iconImage.rawValue,
                                              andColor: newBannerModel.contentColor)
        }
        
        newBannerTitleLabel.stringValue = newBannerModel.titleText
        
        if newBannerModel.subtitleText.characters.count == 0 {
            newBannerSubtitleLabel.isHidden = true
        } else {
            newBannerSubtitleLabel.stringValue = newBannerModel.subtitleText
            newBannerSubtitleLabel.isHidden = false
        }
        
        newBannerView.layout()
        
        newBannerTitleLabel.font = NSFont(name: newBannerModel.fontType.type.rawValue,
                                      size: 16)
        newBannerSubtitleLabel.font = NSFont(name: newBannerModel.fontType.type.rawValue,
                                         size: 15)
        
        newBannerTitleLabel.font =
            self.calculateFont(toFit: self.newBannerTitleLabel,
                               withString: self.newBannerTitleLabel.stringValue as NSString,
                               minSize: 1,
                               maxSize: 13)
        newBannerSubtitleLabel.font =
            self.calculateFont(toFit: self.newBannerSubtitleLabel,
                               withString: self.newBannerSubtitleLabel.stringValue as NSString,
                               minSize: 1,
                               maxSize: 11)
        
        newBannerTitleLabel.textColor = newBannerModel.contentColor
        newBannerSubtitleLabel.textColor = newBannerModel.contentColor
        
        newBannerView.setBackgroundColor(withColors: newBannerModel.backgroundColor)
        
        newBannerView.layout()
    }
}






