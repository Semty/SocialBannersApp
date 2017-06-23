//
//  Extensions.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 21.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Foundation
import Cocoa

extension NSView {
    func createGradientLayer(withFirstColor firstGradientColor: CGColor,
                             secondColor secondDradientColor: CGColor,
                             andFrame frame: CGRect) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = frame
        gradientLayer.colors = [secondDradientColor, firstGradientColor]
        
        return gradientLayer
    }
    
    func image() -> NSImage {
        let imageRepresentation = bitmapImageRepForCachingDisplay(in: bounds)!
        cacheDisplay(in: bounds, to: imageRepresentation)
        return NSImage(cgImage: imageRepresentation.cgImage!, size: bounds.size)
    }
}

extension NSColor {

    public class func hexColor(rgbValue: Int, alpha: CGFloat = 1.0) -> NSColor {
        
        return NSColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0,
                       green:((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0,
                       blue:((CGFloat)(rgbValue & 0xFF))/255.0,
                       alpha:alpha)
        
    }
}

extension NSBitmapImageRep {
    var png: Data? {
        return representation(using: .PNG, properties: [:])
    }
}
extension Data {
    var bitmap: NSBitmapImageRep? {
        return NSBitmapImageRep(data: self)
    }
}
extension NSImage {
    var png: Data? {
        return tiffRepresentation?.bitmap?.png
    }
    func savePNG(to url: URL) -> Bool {
        do {
            try png?.write(to: url)
            return true
        } catch {
            print(error)
            return false
        }
        
    }
}
extension NSObject {
    func calculateFont(toFit textField: NSTextField, withString string: NSString, minSize min: Int, maxSize max: Int) -> NSFont {
        for i in min...max {
            var attr: [String: Any] = [:] as Dictionary
            attr[NSFontSizeAttribute] = NSFont(name: textField.font!.fontName, size: CGFloat(i))!
            let strSize = string.size(withAttributes: [NSFontAttributeName: NSFont.systemFont(ofSize: CGFloat(i))])
            let linesNumber = Int(textField.bounds.height/strSize.height)
            if strSize.width/CGFloat(linesNumber) > textField.bounds.width {
                return (i == min ? NSFont(name: "\(textField.font!.fontName)", size: CGFloat(min)) : NSFont(name: "\(textField.font!.fontName)", size: CGFloat(i-1)))!
            }
        }
        return NSFont(name: "\(textField.font!.fontName)", size: CGFloat(max))!
    }
}
