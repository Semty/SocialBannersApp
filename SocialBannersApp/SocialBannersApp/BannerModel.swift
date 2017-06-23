//
//  BannerModel.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 18.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class BannerModel: NSObject, NSCoding {

    var iconImage: ImageIndex = .empty                      // default
    var contentColor = NSColor.hexColor(rgbValue: 0x14ABFB) // default
    var backgroundColor = [NSColor.white.cgColor, NSColor.white.cgColor]  // default
    var bgColorName = "White"
    var contentColorName = "Sky"
    var titleText = ""
    var subtitleText = ""
    var fontType = FontModel(type: .avenirNextMedium)
    
    override init() {
        //super.init()
    }
    
    init(withIconImage iconImage: ImageIndex, contentColor: NSColor, backgroundColor: [CGColor], bgColorName: String, contentColorName: String, titleText: String, subtitleText: String, fontType: FontModel) {
        self.iconImage = iconImage
        self.contentColor = contentColor
        self.backgroundColor = backgroundColor
        self.bgColorName = bgColorName
        self.contentColorName = contentColorName
        self.titleText = titleText
        self.subtitleText = subtitleText
        self.fontType = fontType
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        
        let iconInt = aDecoder.decodeInteger(forKey: "iconImage")
        let iconImage = ImageIndex(rawValue: iconInt)
        
        let contentColor = aDecoder.decodeObject(forKey: "contentColor") as! NSColor
        
        let backgroundColorWithNSColor = aDecoder.decodeObject(forKey: "backgroundColor") as! [NSColor]
        let backgroundColor = [backgroundColorWithNSColor[0].cgColor, backgroundColorWithNSColor[1].cgColor]
        
        let bgColorName = aDecoder.decodeObject(forKey: "bgColorName") as! String
        
        let contentColorName = aDecoder.decodeObject(forKey: "contentColorName") as! String
        let titleText = aDecoder.decodeObject(forKey: "titleText") as! String
        
        let subtitleText = aDecoder.decodeObject(forKey: "subtitleText") as! String
        
        let fontTypeString = aDecoder.decodeObject(forKey: "fontType") as! String
        let fontType = FontModel(type: FontString(rawValue: fontTypeString)!)
        
        self.init(withIconImage: iconImage!,
                  contentColor: contentColor,
                  backgroundColor: backgroundColor,
                  bgColorName: bgColorName,
                  contentColorName: contentColorName,
                  titleText: titleText,
                  subtitleText: subtitleText,
                  fontType: fontType)
    }
    
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(iconImage.rawValue, forKey: "iconImage")
        aCoder.encode(contentColor, forKey: "contentColor")
        
        let backgroundColorWithNSColor = [NSColor.init(cgColor: backgroundColor[0]), NSColor.init(cgColor: backgroundColor[1])]
        
        aCoder.encode(backgroundColorWithNSColor, forKey: "backgroundColor")
        aCoder.encode(bgColorName, forKey: "bgColorName")
        
        aCoder.encode(contentColorName, forKey: "contentColorName")
        aCoder.encode(titleText, forKey: "titleText")
        
        aCoder.encode(subtitleText, forKey: "subtitleText")
        
        let fontTypeString = fontType.type.rawValue
        
        aCoder.encode(fontTypeString, forKey: "fontType")
        
    }
    
}
