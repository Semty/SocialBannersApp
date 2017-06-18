//
//  BackgroundImageView.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 18.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class BackgroundImageView: NSView {

    var image = ImageIndex.empty {
        didSet {
            self.draw(self.frame)
        }
    }
    
    var color = NSColor.white
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        if NSGraphicsContext.current() != nil {
            
            switch image {
            case .empty:
                BannersIconsBezierPaths.drawEmpty(frame: dirtyRect,
                                                  resizing: .stretch,
                                                  iconColor: color)
            case .doc:
                BannersIconsBezierPaths.drawDoc(frame: dirtyRect,
                                                resizing: .stretch,
                                                iconColor: color)
            case .painter:
                BannersIconsBezierPaths.drawPainter(frame: dirtyRect,
                                                    resizing: .stretch,
                                                    iconColor: color)
            case .picture:
                BannersIconsBezierPaths.drawPicture(frame: dirtyRect,
                                                    resizing: .stretch,
                                                    iconColor: color)
            case .diagram:
                BannersIconsBezierPaths.drawDiagram(frame: dirtyRect,
                                                    resizing: .stretch,
                                                    iconColor: color)
            case .brush:
                BannersIconsBezierPaths.drawBrush(frame: dirtyRect,
                                                  resizing: .stretch,
                                                  iconColor: color)
            case .social:
                BannersIconsBezierPaths.drawSocial(frame: dirtyRect,
                                                   resizing: .stretch,
                                                   iconColor: color)
            case .flyer:
                BannersIconsBezierPaths.drawFlyer(frame: dirtyRect,
                                                  resizing: .stretch,
                                                  iconColor: color)
            case .speaker:
                BannersIconsBezierPaths.drawSpeaker(frame: dirtyRect,
                                                    resizing: .stretch,
                                                    iconColor: color)
            case .time:
                BannersIconsBezierPaths.drawTime(frame: dirtyRect,
                                                 resizing: .stretch,
                                                 iconColor: color)
            case .hot:
                BannersIconsBezierPaths.drawHot(frame: dirtyRect,
                                                resizing: .stretch,
                                                iconColor: color)
            case .music:
                BannersIconsBezierPaths.drawMusic(frame: dirtyRect,
                                                  resizing: .stretch,
                                                  iconColor: color)
            case .world:
                BannersIconsBezierPaths.drawWorld(frame: dirtyRect,
                                                  resizing: .stretch,
                                                  iconColor: color)
            case .rain:
                BannersIconsBezierPaths.drawRain(frame: dirtyRect,
                                                 resizing: .stretch,
                                                 iconColor: color)
            case .sun:
                BannersIconsBezierPaths.drawSun(frame: dirtyRect,
                                                resizing: .stretch,
                                                iconColor: color)
            case .moon:
                BannersIconsBezierPaths.drawMoon(frame: dirtyRect,
                                                 resizing: .stretch,
                                                 iconColor: color)
            case .ok:
                BannersIconsBezierPaths.drawOK(frame: dirtyRect,
                                               resizing: .stretch,
                                               iconColor: color)
            case .search:
                BannersIconsBezierPaths.drawSearch(frame: dirtyRect,
                                                   resizing: .stretch,
                                                   iconColor: color)
            case .repair:
                BannersIconsBezierPaths.drawRepair(frame: dirtyRect,
                                                   resizing: .stretch,
                                                   iconColor: color)
            case .alarm:
                BannersIconsBezierPaths.drawAlarm(frame: dirtyRect,
                                                  resizing: .stretch,
                                                  iconColor: color)
            case .map:
                BannersIconsBezierPaths.drawMap(frame: dirtyRect,
                                                resizing: .stretch,
                                                iconColor: color)
            case .location:
                BannersIconsBezierPaths.drawLocation(frame: dirtyRect,
                                                     resizing: .stretch,
                                                     iconColor: color)
            case .gamepad:
                BannersIconsBezierPaths.drawGamePad(frame: dirtyRect,
                                                    resizing: .stretch,
                                                    iconColor: color)
            case .charts:
                BannersIconsBezierPaths.drawCharts(frame: dirtyRect,
                                                   resizing: .stretch,
                                                   iconColor: color)
            case .eat:
                BannersIconsBezierPaths.drawEat(frame: dirtyRect,
                                                resizing: .stretch,
                                                iconColor: color)
            }
        }
        // Drawing code here.
    }
    
    func setBackgroundImage(withIndex index: Int, andColor color: NSColor) {
        self.color = color
        image = ImageIndex(rawValue: index)!
    }
}

enum ImageIndex: Int {
    case empty = 0
    case doc = 16
    case painter = 10
    case picture = 12
    case diagram = 14
    case brush = 11
    case social = 3
    case flyer = 17
    case speaker = 1
    case time = 2
    case hot = 5
    case music = 13
    case world = 24
    case rain = 8
    case sun = 7
    case moon = 9
    case ok = 6
    case search = 4
    case repair = 18
    case alarm = 21
    case map = 23
    case location = 22
    case gamepad = 19
    case charts = 15
    case eat = 20
}

