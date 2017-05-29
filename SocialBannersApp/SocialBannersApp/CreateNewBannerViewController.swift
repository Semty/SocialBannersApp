//
//  CreateNewBannerViewController.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 29.05.17.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class CreateNewBannerViewController: NSViewController {

    @IBOutlet weak var scrollView: NSScrollView!
    @IBOutlet weak var createBannerView: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.contentView.scrollToVisible(CGRect(x: 0,
                                                           y: createBannerView.bounds.height-self.view.bounds.height,
                                                           width: self.view.bounds.width,
                                                           height: self.view.bounds.height))
        
        // Do view setup here.
    }
    
// MARK: - Actions
    
    @IBAction func backToBannersAction(_ sender: NSButton) {
        
        let bannersVC = self.presenting as! ViewController
        
        self.dismiss(sender)
        
        bannersVC.resizeWindow(withCreateBannerSize: bannersVC.view.bounds)
    }
}
