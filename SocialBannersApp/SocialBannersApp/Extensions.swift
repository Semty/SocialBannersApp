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
    
    public static func setShadowFor(view: NSView) {
        
        let xTranslationFactor: CGFloat = 0
        let yTranslationFactor: CGFloat = 0.08
        var widthRelativeFactor: CGFloat = 0.8
        let heightRelativeFactor: CGFloat = 0.78
        let blurRadiusFactor: CGFloat = 0.1
        let shadowOpacity: CGFloat = 0.1
        
        if view.frame.width < 120 {
            widthRelativeFactor = widthRelativeFactor * 0.8
        }
        
        var shadowWidth = view.frame.width * widthRelativeFactor
        if (view.frame.width - shadowWidth) / 2 > 35 {
            shadowWidth = view.frame.width - 70
            widthRelativeFactor = shadowWidth / view.frame.width
        }
        let shadowHeight = view.frame.height * heightRelativeFactor
        
        let xTranslation = (view.frame.width - shadowWidth) / 2 + (view.frame.width * xTranslationFactor)
        var yTranslation = (view.frame.height - shadowHeight) / 2 + (view.frame.height * yTranslationFactor)
        
        let minBottomSpace: CGFloat = 6
        if (yTranslation + shadowHeight - view.frame.height) < minBottomSpace {
            yTranslation = view.frame.height + minBottomSpace - shadowHeight
        }
        
        let maxBottomSpace: CGFloat = 12
        if (yTranslation + shadowHeight - view.frame.height) > maxBottomSpace {
            yTranslation = view.frame.height + maxBottomSpace - shadowHeight
        }
        
        let minSideSize = view.bounds.width > view.bounds.height ? view.bounds.height : view.bounds.width
        
        let blurRadius = minSideSize * blurRadiusFactor
        
        if blurRadius > 10 || blurRadius < 7 {
            view.layer?.shadowRadius = blurRadius
        }
        
        view.setShadow(
            xTranslation: xTranslation,
            yTranslation: yTranslation,
            widthRelativeFactor: widthRelativeFactor,
            heightRelativeFactor: heightRelativeFactor,
            blurRadius: blurRadius,
            shadowOpacity: shadowOpacity,
            cornerRadius: 4.0
        )
    }
    
    func setShadow(
        xTranslation: CGFloat,
        yTranslation: CGFloat,
        widthRelativeFactor: CGFloat,
        heightRelativeFactor: CGFloat,
        blurRadius: CGFloat,
        shadowOpacity: CGFloat,
        cornerRadius: CGFloat = 0
        ) {
        let shadowWidth = self.frame.width * widthRelativeFactor
        let shadowHeight = self.frame.height * heightRelativeFactor
        
        let shadowPath = CGPath(roundedRect: CGRect.init(x: xTranslation, y: yTranslation,
                                                         width: shadowWidth, height: shadowHeight),
                                cornerWidth: cornerRadius, cornerHeight: cornerRadius, transform: nil)
        
        self.layer?.shadowColor = NSColor.black.cgColor
        self.layer?.shadowOffset = CGSize.zero
        self.layer?.shadowOpacity = Float(shadowOpacity)
        self.layer?.shadowRadius = blurRadius
        self.layer?.masksToBounds = false
        self.layer?.shadowPath = shadowPath
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
            let strSize = string.size(withAttributes: [NSFontAttributeName: NSFont.init(name: textField.font!.fontName, size: CGFloat(i))!])
            let linesNumber = Int(textField.bounds.height/strSize.height)
            if strSize.width/CGFloat(linesNumber) > textField.bounds.width {
                return (i == min ? NSFont(name: "\(textField.font!.fontName)", size: CGFloat(min)) : NSFont(name: "\(textField.font!.fontName)", size: CGFloat(i-1)))!
            }
        }
        return NSFont(name: "\(textField.font!.fontName)", size: CGFloat(Double(max)-0.5))!
    }
}
