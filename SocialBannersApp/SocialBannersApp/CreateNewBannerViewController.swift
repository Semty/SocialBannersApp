//
//  CreateNewBannerViewController.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 29.05.17.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class CreateNewBannerViewController: NSViewController, NSCollectionViewDataSource, NSCollectionViewDelegate, NSTextFieldDelegate {

// MARK: - IBOutlet's
    
    @IBOutlet weak var scrollView: NSScrollView!
    
    @IBOutlet weak var createBannerView: NSView!
    @IBOutlet weak var substrateHeaderView: SubstrateHeaderView!
    @IBOutlet weak var newBannerView: NewBannerView!
    
    @IBOutlet weak var roundedHeaderView: WhiteRoundedView!
    
    @IBOutlet weak var backToBannersButton: BackToBannersButton!
    @IBOutlet weak var imagesCollectionView: NSCollectionView!
    @IBOutlet weak var enterTitleField: NSTextField!
    @IBOutlet weak var enterSubtitleField: NSTextField!
    
    @IBOutlet weak var changeNBBackgroundColorButton: ChangeButton!
    @IBOutlet weak var changeNBContentColorButton: ChangeButton!
    @IBOutlet weak var changeNBContentFontButton: ChangeButton!
    
    @IBOutlet weak var saveNewBannerButton: SaveButton!
    
// MARK: - New Banner Elements
    
    @IBOutlet weak var titleForNewBanner: NSTextField!
    @IBOutlet weak var subtitleForNewBanner: NSTextField!
    @IBOutlet weak var imageForNewBannerView: BackgroundImageView!
    
// MARK: - Private variables
    
    private var topScrollPoint      = CGPoint.zero  // default (it's not top!)
    private var headerStartOrigin   = CGPoint.zero  // default
    private var substrateStartFrame = CGRect.zero   // default
    private var newBannerStartFrame = CGRect.zero   // default
    
// MARK: - Public variables
    
    let imageBannerModel = ImageBannerModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newBannerView.translatesAutoresizingMaskIntoConstraints = true
        roundedHeaderView.translatesAutoresizingMaskIntoConstraints = true
        
        headerStartOrigin = roundedHeaderView.frame.origin
        substrateStartFrame = substrateHeaderView.frame
        newBannerStartFrame = newBannerView.frame
        
        changeNBBackgroundColorButton.draw(changeNBBackgroundColorButton.frame)
        changeNBContentColorButton.draw(changeNBContentColorButton.frame)
        changeNBContentFontButton.draw(changeNBContentFontButton.frame)
        saveNewBannerButton.draw(saveNewBannerButton.frame)
        
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
        // Configure Collection View
        configureCollectionView()
    }
    
// MARK: - NSCollectionViewDataSource

    public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageBannerModel.numberOfItems
    }

    public func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return imageBannerModel.numberOfSections
    }
    
    public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        let item = collectionView.makeItem(withIdentifier: "ImageBannerCollectionItem",
                                           for: indexPath)
        guard let collectionViewItem = item as? ImageBannerCollectionItem else {
            return item
        }
        
        (collectionViewItem.view as! BackgroundImageView).setBackgroundImage(withIndex: indexPath.item, andColor: .white)
        
        let isItemSelected = collectionView.selectionIndexPaths.contains(indexPath)
        collectionViewItem.setHighlight(isItemSelected)
        
        return item
    }

// MARK: - NSCollectionViewDelegate
    
    public func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        for indexPath in indexPaths {
            guard let item = collectionView.item(at: indexPath) else {continue}
            (item as! ImageBannerCollectionItem).setHighlight(true)
// FIXME: - Need fix color
            if indexPath.item != 0 {
                imageForNewBannerView.setBackgroundImage(withIndex: indexPath.item,
                                                         andColor: .black)
            } else {
                imageForNewBannerView.color = .clear
            }
            
            imageForNewBannerView.layer?.setNeedsDisplay()
        }
    }
    
    public func collectionView(_ collectionView: NSCollectionView, didDeselectItemsAt indexPaths: Set<IndexPath>) {
        for indexPath in indexPaths {
            guard let item = collectionView.item(at: indexPath) else {continue}
            (item as! ImageBannerCollectionItem).setHighlight(false)
        }
    }
    
// MARK: - Actions
    
    @IBAction func backToBannersAction(_ sender: NSButton) {
        
        let bannersVC = self.presenting as! ViewController
        
        self.dismiss(sender)
        
        bannersVC.resizeWindow(withCreateBannerSize: bannersVC.view.bounds)
    }
    
    override func controlTextDidChange(_ obj: Notification) {
        
        let enterTextField = obj.object as! NSTextField
        
        if enterTextField == enterTitleField {
            if enterTitleField.stringValue.characters.count <= 15 {
                self.titleForNewBanner.stringValue = enterTitleField.stringValue
            }
        } else if enterTextField == enterSubtitleField {
            /*
            titleForNewBanner.translatesAutoresizingMaskIntoConstraints = true
            let newTitleOrigin =
            CGPoint(x: titleForNewBanner.frame.origin.x,
                    y: newBannerView.bounds.height / 2)
            titleForNewBanner.setFrameOrigin(newTitleOrigin)    
            */
            if enterTextField.stringValue.characters.count <= 20 {
                self.subtitleForNewBanner.stringValue = enterTextField.stringValue
            }
        }
        
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
    
// MARK: - Scrolling Functions
    
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

// MARK: - Helpful Functions
    
    fileprivate func configureCollectionView() {
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 40.0, height: 40.0)
        flowLayout.sectionInset = EdgeInsets(top: 0.0, left: 10.0, bottom: 20.0, right: 10.0)
        flowLayout.minimumInteritemSpacing = 10.0
        flowLayout.minimumLineSpacing = 10.0
        flowLayout.scrollDirection = .horizontal
        
        imagesCollectionView.collectionViewLayout = flowLayout
        view.wantsLayer = true
    }
    
}




