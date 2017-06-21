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
    
    @IBOutlet weak var bgColorLabel: NSTextField!
    @IBOutlet weak var bgColorView: BGColorView!
    @IBOutlet weak var changeNBBackgroundColorButton: ChangeButton!
    
    @IBOutlet weak var contentColorLabel: NSTextField!
    @IBOutlet weak var contentColorView: ContentColorView!
    @IBOutlet weak var changeNBContentColorButton: ChangeButton!
    
    @IBOutlet weak var changeNBContentFontLabel: NSTextField!
    @IBOutlet weak var changeNBContentFontButton: ChangeButton!
    
    @IBOutlet weak var saveNewBannerButton: SaveButton!
    
// MARK: - New Banner Elements
    
    @IBOutlet weak var titleForNewBanner: TitleTextField!
    @IBOutlet weak var subtitleForNewBanner: SubtitleTextField!
    @IBOutlet weak var imageForNewBannerView: BackgroundImageView!
    
// MARK: - Private variables
    
    private var topScrollPoint      = CGPoint.zero  // default (it's not top!)
    private var headerStartOrigin   = CGPoint.zero  // default
    private var substrateStartFrame = CGRect.zero   // default
    private var newBannerStartFrame = CGRect.zero   // default
    
// MARK: - Public variables
    
    let imageBannerModel = IconsCollectionModel()
    let newBannerModel = BannerModel()
    
// MARK: - View Did Load
    
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
        imagesCollectionView.selectItems(at: [IndexPath.init(item: newBannerModel.iconImage.rawValue,
                                                             section: 0)],
                                         scrollPosition: NSCollectionViewScrollPosition.centeredHorizontally)
        if newBannerModel.iconImage != .empty {
            imageForNewBannerView.setBackgroundImage(withIndex: newBannerModel.iconImage.rawValue,
                                                     andColor: newBannerModel.contentColor)
        } else {
            imageForNewBannerView.isHidden = true
            newBannerView.layout()
        }
        if subtitleForNewBanner.stringValue.characters.count == 0 {
            subtitleForNewBanner.isHidden = true
            newBannerView.layout()
        }
    }
    
// MARK: - View Will Appear
    
    override func viewWillAppear() {
        super.viewWillAppear()
        self.newBannerView.setBackgroundColor(withColors: newBannerModel.backgroundColor)
        
        self.updateNBFont(withType: newBannerModel.fontType)
        self.updateNBContentColor(withContentColor: newBannerModel.contentColor)
        
        self.bgColorLabel.stringValue = newBannerModel.bgColorName
        self.bgColorView.setBackgroundColor(withColors: newBannerModel.backgroundColor)
        
        self.contentColorLabel.stringValue = newBannerModel.contentColorName
        self.contentColorView.layer?.backgroundColor = newBannerModel.contentColor.cgColor
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
        collectionViewItem.setHighlight(isItemSelected, atIndex: indexPath.item)
        
        return item
    }

// MARK: - NSCollectionViewDelegate
    
    public func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        for indexPath in indexPaths {
            guard let item = collectionView.item(at: indexPath) else {continue}
            (item as! ImageBannerCollectionItem).setHighlight(true, atIndex: indexPath.item)

            if indexPath.item != 0 {
                imageForNewBannerView.isHidden = false
                imageForNewBannerView.setBackgroundImage(withIndex: indexPath.item,
                                                         andColor: newBannerModel.contentColor)
            } else {
                imageForNewBannerView.isHidden = true
            }
            
            imageForNewBannerView.layer?.setNeedsDisplay()
            newBannerView.layout()
            newBannerModel.iconImage = ImageIndex(rawValue: indexPath.item)!
        }
    }
    
    public func collectionView(_ collectionView: NSCollectionView, didDeselectItemsAt indexPaths: Set<IndexPath>) {
        for indexPath in indexPaths {
            guard let item = collectionView.item(at: indexPath) else {continue}
            (item as! ImageBannerCollectionItem).setHighlight(false, atIndex: indexPath.item)
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
            if enterTitleField.stringValue.characters.count <= 20 {
            self.titleForNewBanner.stringValue = enterTextField.stringValue
            self.titleForNewBanner.font =
                self.calculateFont(toFit: self.titleForNewBanner,
                                   withString: self.titleForNewBanner.stringValue as NSString,
                                   minSize: 1,
                                   maxSize: 15)
            }
        } else if enterTextField == enterSubtitleField {
            if enterTextField.stringValue.characters.count > 0 {
                subtitleForNewBanner.isHidden = false
            } else {
                subtitleForNewBanner.isHidden = true
            }
            
            newBannerView.layout()
 
            if enterSubtitleField.stringValue.characters.count <= 30 {
                self.subtitleForNewBanner.stringValue = enterTextField.stringValue
                self.subtitleForNewBanner.font =
                    self.calculateFont(toFit: self.subtitleForNewBanner,
                                       withString: self.subtitleForNewBanner.stringValue as NSString,
                                       minSize: 1,
                                       maxSize: 14)
            }
        }
    
    }
    
// MARK: - Transitions
    
    @IBAction func changeNBBackgroundColorAction(_ sender: Any) {
        
        let changeNBVC = self.storyboard?.instantiateController(withIdentifier: "SelectBackgroundColorController") as! SelectBackgroundColorController
        self.presentViewControllerAsSheet(changeNBVC)
    }
    
    @IBAction func changeNBContentColorAction(_ sender: Any) {
        
        let changeNBVC = self.storyboard?.instantiateController(withIdentifier: "SelectContentColorController") as! SelectContentColorController
        self.presentViewControllerAsSheet(changeNBVC)
    }
    
    @IBAction func changeNBContentFontAction(_ sender: Any) {
        let changeNBVC = self.storyboard?.instantiateController(withIdentifier: "SelectFontNameController") as! SelectFontNameController
        self.presentViewControllerAsSheet(changeNBVC)
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
        
        let newOriginForHeader = CGPoint(x: headerStartOrigin.x,
                                         y: headerStartOrigin.y + scrollYOffset - substrateYOffset)
        let offsetPercent = (scrollYOffset <= 0 && scrollYOffset >= -20) ? scrollYOffset/(-20) : 1.0
        let newOriginForNewBanner =
            CGPoint(x: newBannerStartFrame.origin.x + 15*offsetPercent,
                    y: newBannerStartFrame.origin.y + scrollYOffset + 40*offsetPercent)
        
        roundedHeaderView.setFrameOrigin(newOriginForHeader)
        
        newBannerView.setFrameOrigin(newOriginForNewBanner)
        
        let xyScaleOffset = (scrollYOffset <= 0 && scrollYOffset >= -20) ? scrollYOffset/160 : -20/160
        let newBannerScale = 1.0 + xyScaleOffset
        newBannerView.layer?.setAffineTransform(CGAffineTransform.init(scaleX: newBannerScale,
                                                                       y: newBannerScale))
    }
    
    func scrollToUp(withScrollYOffset scrollYOffset: CGFloat) {
        
        substrateHeaderView.setFrameSize(NSSize.init(width: substrateHeaderView.bounds.width,
                                                     height: substrateStartFrame.size.height + scrollYOffset))
        
        substrateHeaderView.setFrameOrigin(NSPoint.init(x: substrateStartFrame.origin.x,
                                                        y: substrateStartFrame.origin.y - scrollYOffset))
 
    }
    
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

// MARK: - Configure CollectionView
    
    fileprivate func configureCollectionView() {
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 40.0, height: 40.0)
        flowLayout.sectionInset = EdgeInsets(top: 0.0, left: 159.0, bottom: 20.0, right: 159.0)
        flowLayout.minimumInteritemSpacing = 10.0
        flowLayout.minimumLineSpacing = 20.0
        flowLayout.scrollDirection = .horizontal
        
        imagesCollectionView.collectionViewLayout = flowLayout
        view.wantsLayer = true
    }
    
// MARK: - New Banner Updating Functions
    
    public func updateNBFont(withType font: FontModel) {
        
        self.titleForNewBanner.font = NSFont(name: font.type.rawValue,
                                             size: 15.0)
        self.subtitleForNewBanner.font = NSFont(name: font.type.rawValue,
                                                size: 14.0)
 
        self.titleForNewBanner.font =
            self.calculateFont(toFit: self.titleForNewBanner,
                               withString: self.titleForNewBanner.stringValue as NSString,
                               minSize: 1,
                               maxSize: 15)
        self.subtitleForNewBanner.font =
            self.calculateFont(toFit: self.subtitleForNewBanner,
                               withString: self.subtitleForNewBanner.stringValue as NSString,
                               minSize: 1,
                               maxSize: 15)
        self.changeNBContentFontLabel.stringValue = font.type.rawValue
    }
    
    public func updateNBContentColor(withContentColor color: NSColor) {
        self.titleForNewBanner.textColor = color
        self.subtitleForNewBanner.textColor = color
        self.imageForNewBannerView.setBackgroundImage(withIndex: newBannerModel.iconImage.rawValue,
                                                      andColor: color)
    }
    
}




