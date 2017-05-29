//
//  ViewController.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 14.05.17.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var addBannerButton: AddBannerButton!
    @IBOutlet weak var myBannersLabel: NSTextField!
    
    lazy var window: NSWindow! = self.view.window
    
    private var windowStartedSize = CGRect.zero
    private var windowFinishedSize = CGRect.zero
    private var windowStartedState = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        self.window.backgroundColor = NSColor(calibratedRed: 0.96470588,
                                              green: 0.96470588,
                                              blue: 0.96470588,
                                              alpha: 1.0)
        remove(.resizable)
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

// MARK: - Helpful Functions
    
    func remove(_ member: NSWindowStyleMask) {
        window.styleMask.remove(member)
    }
    
    func resizeWindow(withCreateBannerSize createBannerSize: CGRect) {
        
        if windowStartedState {
            
            self.windowStartedSize = self.window.frame
            self.windowFinishedSize = CGRect(x: windowStartedSize.origin.x + (windowStartedSize.width - createBannerSize.width)/2,
                                             y: windowStartedSize.origin.y,
                                             width: createBannerSize.width,
                                             height: windowStartedSize.height)
            addBannerButton.isHidden = true
            myBannersLabel.isHidden = true
            self.window.setFrame(windowFinishedSize,
                                       display: true,
                                       animate: true)
        } else {
            
            self.windowFinishedSize = (self.view.window?.frame)!
            self.windowStartedSize = CGRect(x: windowFinishedSize.origin.x - (windowStartedSize.width - createBannerSize.width)/2,
                                            y: windowFinishedSize.origin.y,
                                            width: windowStartedSize.width,
                                            height: windowStartedSize.height)
            addBannerButton.isHidden = false
            myBannersLabel.isHidden = false
            self.view.window?.setFrame(windowStartedSize,
                                       display: true,
                                       animate: true)
            
        }
        windowStartedState = !windowStartedState
    }

// MARK: - Actions
    
    @IBAction func addNewBannerAction(_ sender: AddBannerButton) {
        
        let createBannerVC = self.storyboard?.instantiateController(withIdentifier: "CreateNewBannerViewController") as! CreateNewBannerViewController
        
        self.presentViewControllerAsSheet(createBannerVC)
        resizeWindow(withCreateBannerSize: createBannerVC.view.bounds)
    }
}






