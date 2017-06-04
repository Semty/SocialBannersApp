//
//  CreateNewBannerViewController.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 29.05.17.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class CreateNewBannerViewController: NSViewController {

// MARK: - IBOutlet's
    
    @IBOutlet weak var scrollView: NSScrollView!
    
    @IBOutlet weak var createBannerView: NSView!
    @IBOutlet weak var substrateHeaderView: SubstrateHeaderView!
    @IBOutlet weak var newBannerView: NewBannerView!
    
    @IBOutlet weak var roundedHeaderView: WhiteRoundedView!
    
    @IBOutlet weak var backToBannersButton: BackToBannersButton!
    
    
// MARK: - Private variables
    
    private var topScrollPoint      = CGPoint.zero  // default (it's not top!)
    private var headerStartOrigin   = CGPoint.zero  // default
    private var substrateStartFrame = CGRect.zero   // default
    private var newBannerStartFrame = CGRect.zero   // default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedHeaderView.translatesAutoresizingMaskIntoConstraints = true
        
        headerStartOrigin = roundedHeaderView.frame.origin
        substrateStartFrame = substrateHeaderView.frame
        newBannerStartFrame = newBannerView.frame
        
        self.topScrollPoint = CGPoint(x: 0,
                                      y: createBannerView.bounds.height - scrollView.bounds.height)
        self.view.wantsLayer = true
        self.scrollView.contentView.scrollToVisible(CGRect(x: 0,
                                                           y: createBannerView.bounds.height-self.view.bounds.height,
                                                           width: self.view.bounds.width,
                                                           height: self.view.bounds.height))
        // Set notification for tracking scroll position
        self.scrollView.contentView.postsBoundsChangedNotifications = true
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(boundsDidChangeNotification(_:)),
                                               name: .NSViewBoundsDidChange,
                                               object: scrollView.contentView)
    }
    
// MARK: - Actions
    
    @IBAction func backToBannersAction(_ sender: NSButton) {
        
        let bannersVC = self.presenting as! ViewController
        
        self.dismiss(sender)
        
        bannersVC.resizeWindow(withCreateBannerSize: bannersVC.view.bounds)
    }
    
// MARK: - Tracking of the scroll position
    
    func boundsDidChangeNotification(_ notification: NSNotification) {
        
        let visibleRect = scrollView.contentView.documentVisibleRect
        let currentScrollPosition = visibleRect.origin
        let scrollYOffset = currentScrollPosition.y - topScrollPoint.y
        print("scrollYOffset = \(scrollYOffset)")
        
        // Pull Up Header
        if currentScrollPosition.y <= topScrollPoint.y {
            scrollToDown(withScrollYOffset: scrollYOffset)
        } else {
            scrollToUp(withScrollYOffset: scrollYOffset)
        }
    }
    
// MARK: - Helpful Functions
    
    func scrollToDown(withScrollYOffset scrollYOffset: CGFloat) {
        let substrateYOffset: CGFloat = (scrollYOffset <= 0 && scrollYOffset >= -20) ? scrollYOffset : -20
        
        let isDownForNewBanner: Bool = substrateYOffset / -20 >= 0 && substrateYOffset / -20 <= 1
        let isDownNewBannerXOffset: CGFloat = 1.05 * 10.0 * (substrateYOffset / -20)
        let newBannerXOffset: CGFloat = isDownForNewBanner ? isDownNewBannerXOffset : 1.05 * 10.0
        
        let newOriginForHeader = CGPoint(x: headerStartOrigin.x,
                                         y: headerStartOrigin.y + scrollYOffset - substrateYOffset)
        let newSizeForNewBanner =
        CGSize(width: newBannerStartFrame.size.width + substrateYOffset,
               height: newBannerStartFrame.size.height + substrateYOffset)
        let newOriginForNewBanner =
            CGPoint(x: newBannerStartFrame.origin.x + newBannerXOffset,
                    y: newBannerStartFrame.origin.y + scrollYOffset - substrateYOffset*2.25)
        
        roundedHeaderView.setFrameOrigin(newOriginForHeader)
        
        newBannerView.setFrameOrigin(newOriginForNewBanner)
        newBannerView.setFrameSize(newSizeForNewBanner)
    }
    
    func scrollToUp(withScrollYOffset scrollYOffset: CGFloat) {
        substrateHeaderView.setFrameSize(NSSize.init(width: substrateHeaderView.bounds.width,
                                                     height: substrateStartFrame.size.height + scrollYOffset))
        
        substrateHeaderView.setFrameOrigin(NSPoint.init(x: substrateStartFrame.origin.x,
                                                        y: substrateStartFrame.origin.y - scrollYOffset))
    }
    
}




