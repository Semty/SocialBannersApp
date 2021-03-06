//
//  NewBannerView.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 03.06.17.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class NewBannerView: NSView {

    var gradientLayer = CAGradientLayer()
    var backgroundColors: [CGColor] = [.white, .white]
    
    var backgroundImageView: BackgroundImageView?
    var titleTextField: TitleTextField?
    var subtitleTextField: SubtitleTextField?
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        if gradientLayer.superlayer == nil {
            setBackgroundColor(withColors: backgroundColors)
        }
        
        self.layer?.backgroundColor = .clear
        self.layer?.cornerRadius = 6.0
        
        let shadow = NSShadow()
        shadow.shadowOffset = NSSize(width: 0, height: -2)
        shadow.shadowColor = NSColor.black.withAlphaComponent(0.25)
        shadow.shadowBlurRadius = 8
        self.shadow = shadow
        // Drawing code here.
    }
    
    func setBackgroundColor(withColors colors: [CGColor]) {
        
        if gradientLayer.superlayer != nil {
            let tempLayer = CAGradientLayer()
            tempLayer.frame = self.bounds
            gradientLayer.removeFromSuperlayer()
            gradientLayer = tempLayer
            gradientLayer.cornerRadius = self.bounds.height*0.07
            self.layer?.insertSublayer(gradientLayer, at: 0)
        }
        
        backgroundColors = colors
        gradientLayer.colors = backgroundColors
        gradientLayer.startPoint = CGPoint(x: 0,
                                           y: 1)
        gradientLayer.endPoint = CGPoint(x: 1.0,
                                         y: 0.0)
        
        if gradientLayer.superlayer == nil {
            gradientLayer.cornerRadius = 6.0
            gradientLayer.frame = self.bounds
            self.layer?.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    override func layout() {
        super.layout()
        
        if setAllElements() {
            imageHiddenLayout()
            subtitleHiddenLayout()
        }
    }
    
    func subtitleHiddenLayout() {
        if (subtitleTextField?.isHidden)! {
            let newOriginY = (self.bounds.height/2) - (titleTextField?.bounds.height)!/2
            titleTextField?.frame = CGRect(x: (titleTextField?.frame.origin.x)!,
                                           y: newOriginY,
                                           width: (titleTextField?.bounds.width)!,
                                           height: (titleTextField?.bounds.height)!)
        } else {
            let distanceBetweenFields: CGFloat = 0.0 // 0% from height
            
            let newFrameTitleField =
                CGRect(x: (titleTextField?.frame.origin.x)!,
                       y: (self.bounds.height/2) + ((titleTextField?.bounds.height)!+(subtitleTextField?.bounds.height)!+distanceBetweenFields)/2 - (titleTextField?.bounds.height)!,
                       width: (titleTextField?.bounds.width)!,
                       height: (titleTextField?.bounds.height)!)
            
            let newFrameSubtitleField =
                CGRect(x: (subtitleTextField?.frame.origin.x)!,
                       y: (self.bounds.height/2) - ((titleTextField?.bounds.height)!+(subtitleTextField?.bounds.height)!+distanceBetweenFields)/2,
                       width: (subtitleTextField?.bounds.width)!,
                       height: (subtitleTextField?.bounds.height)!)
            
            titleTextField?.frame = newFrameTitleField
            subtitleTextField?.frame = newFrameSubtitleField
        }
    }
    
    func imageHiddenLayout() {
        let heightTitleLabel = self.bounds.height*0.22
        let heightSubtitleLabel = self.bounds.height*0.16
        
        backgroundImageView?.frame =
        CGRect(x: 0.08 * self.bounds.width,
               y: 0.34 * self.bounds.height,
               width: 0.33 * self.bounds.height,
               height: 0.33 * self.bounds.height)
        
        if (backgroundImageView?.isHidden)! {
            titleTextField?.frame = CGRect(x: self.bounds.origin.x,
                                           y: (titleTextField?.frame.origin.y)!,
                                           width: self.bounds.width,
                                           height: heightTitleLabel)
            subtitleTextField?.frame = CGRect(x: self.bounds.origin.x,
                                              y: (subtitleTextField?.frame.origin.y)!,
                                              width: self.bounds.width,
                                              height: heightSubtitleLabel)
        } else {
            let newOriginX = (backgroundImageView?.frame.origin.x)!+(backgroundImageView?.frame.width)!
            titleTextField?.frame = CGRect(x: newOriginX,
                                           y: (titleTextField?.frame.origin.y)!,
                                           width: self.bounds.width-newOriginX,
                                           height: heightTitleLabel)
            subtitleTextField?.frame = CGRect(x: newOriginX,
                                              y: (subtitleTextField?.frame.origin.y)!,
                                              width: self.bounds.width-newOriginX,
                                              height: heightSubtitleLabel)
        }
    }
    
    func setAllElements() -> Bool {
        
        if backgroundImageView == nil || titleTextField == nil || subtitleTextField == nil {
            for subview in self.subviews {
                if subview is BackgroundImageView && backgroundImageView == nil {
                    backgroundImageView = subview as? BackgroundImageView
                }
                if subview is TitleTextField && titleTextField == nil {
                    titleTextField = subview as? TitleTextField
                }
                if subview is SubtitleTextField && subtitleTextField == nil {
                    subtitleTextField = subview as? SubtitleTextField
                }
            }
            
            if backgroundImageView != nil || titleTextField != nil || subtitleTextField != nil {
                return true
            } else {
                return false
            }
        } else {
            return true
        }
    }
}
