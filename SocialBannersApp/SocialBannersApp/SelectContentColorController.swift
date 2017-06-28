//
//  SelectContentColorController.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 20.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class SelectContentColorController: NSViewController, NSCollectionViewDataSource, NSCollectionViewDelegate {
    
// MARK: - IBOutlet's
    
    @IBOutlet weak var colorScrollView: NSScrollView!
    @IBOutlet weak var colorCollection: NSCollectionView!
    
// MARK: - Private Variables
    
    let backgroundColors = AppContents.getContentColor()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        colorCollection.frame = colorScrollView.bounds
        // Do view setup here.
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        self.view.window?.styleMask.remove(.resizable)
    }
    
// MARK: - NSCollectionViewDataSource
    
    public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    public func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return backgroundColors.count / 3
    }
    
    public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        let item = collectionView.makeItem(withIdentifier: "ContentColorBannerCollectionItem",
                                           for: indexPath)
        guard let collectionViewItem = item as? ContentColorBannerCollectionItem else {
            return item
        }
        
        let colorModel = backgroundColors[indexPath.item+indexPath.section*3]
        
        collectionViewItem.view.layer?.backgroundColor = colorModel.fillColor?.cgColor
        
        return item
    }
    
// MARK: - NSCollectionViewDelegate
    
    public func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        for indexPath in indexPaths {
            
            let colorModel = backgroundColors[indexPath.item+indexPath.section*3]
            
            let addNewBannerVC = self.presenting as! CreateNewBannerViewController
            
            addNewBannerVC.newBannerModel.contentColorName = colorModel.name
            addNewBannerVC.contentColorLabel.stringValue = colorModel.name
            
            addNewBannerVC.newBannerModel.contentColor = colorModel.fillColor!
            addNewBannerVC.contentColorView.layer?.backgroundColor = colorModel.fillColor?.cgColor
            addNewBannerVC.updateNBContentColor(withContentColor: colorModel.fillColor!)
            addNewBannerVC.imageForNewBannerView.layer?.setNeedsDisplay()
            
            self.dismiss(nil)
        }
    }
    

    
// MARK: - Actions
    
    @IBAction func backToCreateBunnerAction(_ sender: Any) {
        self.dismiss(sender)
    }
    
// MARK: - Configure CollectionView
    
    fileprivate func configureCollectionView() {
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 60.0, height: 60.0)
        flowLayout.sectionInset = EdgeInsets(top: 0, left: 78.5, bottom: 10.0, right: 78.5)
        flowLayout.minimumInteritemSpacing = 10.0
        flowLayout.minimumLineSpacing = 25.0
        flowLayout.scrollDirection = .vertical
        
        colorCollection.collectionViewLayout = flowLayout
        view.wantsLayer = true
    }
    
}
