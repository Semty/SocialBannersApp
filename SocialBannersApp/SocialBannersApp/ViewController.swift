//
//  ViewController.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 14.05.17.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSCollectionViewDataSource, NSCollectionViewDelegate {
    
// MARK: - IBOutlet's
    
    @IBOutlet weak var addBannerButton: AddBannerButton!
    @IBOutlet weak var myBannersLabel: NSTextField!
    
    @IBOutlet weak var bannersScrollView: NSScrollView!
    @IBOutlet weak var bannersCollection: NSCollectionView!
    
    lazy var window: NSWindow! = self.view.window
    
// MARK: - Private Variables
    
    private var windowStartedSize = CGRect.zero
    private var windowFinishedSize = CGRect.zero
    private var windowStartedState = true

    override func viewDidLoad() {
        super.viewDidLoad()
        //UserDefaults.standard.removeObject(forKey: BannersKey.banners.rawValue)
        configureCollectionView()
        bannersCollection.frame = bannersScrollView.bounds
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
    
// MARK: - NSCollectionViewDataSource
    
    public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        let bannersModel = BannersDefaults.loadBanners(forKey: .banners)
        return bannersModel.count
    }
    
    public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        let item = collectionView.makeItem(withIdentifier: "PreviewBannerCollectionItem",
                                           for: indexPath)
        guard let collectionViewItem = item as? PreviewBannerCollectionItem else {
            return item
        }
        
        let bannersModel = BannersDefaults.loadBanners(forKey: .banners)
        
        if bannersModel.count > 0 {
            collectionViewItem.setAllElements(withCurrentModel: bannersModel[indexPath.item])
        }
        
        return item
    }
    
// MARK: - NSCollectionViewDelegate
    
    public func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        for indexPath in indexPaths {
            
// FIXME: - NEED ADD CODE HERE
            
            let createBannerVC = self.storyboard?.instantiateController(withIdentifier: "CreateNewBannerViewController") as! CreateNewBannerViewController
            
            let bannersModel = BannersDefaults.loadBanners(forKey: .banners)
            createBannerVC.newBannerModel = bannersModel[indexPath.item]
            
            self.presentViewControllerAsSheet(createBannerVC)
            resizeWindow(withCreateBannerSize: createBannerVC.view.bounds)
            
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
    
// MARK: - Configure CollectionView
    
    fileprivate func configureCollectionView() {
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 224.0, height: 126.0)
        flowLayout.sectionInset = EdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        flowLayout.minimumInteritemSpacing = 15
        flowLayout.minimumLineSpacing = 40
        flowLayout.scrollDirection = .vertical
        
        bannersCollection.collectionViewLayout = flowLayout
        view.wantsLayer = true
    }
    
}






