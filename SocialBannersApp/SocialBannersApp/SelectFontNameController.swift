//
//  SelectFontNameController.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 20.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class SelectFontNameController: NSViewController, NSCollectionViewDataSource, NSCollectionViewDelegate {

// MARK: - IBOutlet's
    
    @IBOutlet weak var fontNameScrollView: NSScrollView!
    @IBOutlet weak var fontNameCollection: NSCollectionView!
    
// MARK: - Private Variables
    
    let allFonts = AppContents.getFontsModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        fontNameCollection.frame = fontNameScrollView.bounds
        // Do view setup here.
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        self.view.window?.styleMask.remove(.resizable)
    }
    
// MARK: - NSCollectionViewDataSource
    
    public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    public func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return allFonts.count
    }
    
    public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        let item = collectionView.makeItem(withIdentifier: "FontNameCollectionItem",
                                           for: indexPath)
        guard let collectionViewItem = item as? FontNameCollectionItem else {
            return item
        }
        
        let fontModel = allFonts[indexPath.section]
        
        collectionViewItem.setFont(withType: fontModel)
        
        return item
    }
    
// MARK: - NSCollectionViewDelegate
    
    public func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        for indexPath in indexPaths {
            
            let fontModel = allFonts[indexPath.section]
            
            let addNewBannerVC = self.presenting as! CreateNewBannerViewController
            
            addNewBannerVC.newBannerModel.fontType = fontModel
            
            addNewBannerVC.updateNBFont(withType: fontModel)
            
            self.dismiss(nil)
        }
    }

    
// MARK: - Actions
    
    @IBAction func backToCreateBannerAction(_ sender: Any) {
        self.dismiss(nil)
    }
    
// MARK: - Configure CollectionView
    
    fileprivate func configureCollectionView() {
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: view.bounds.width, height: 39.0)
        flowLayout.sectionInset = EdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        flowLayout.scrollDirection = .vertical
        
        fontNameCollection.collectionViewLayout = flowLayout
        view.wantsLayer = true
    }
    
}
