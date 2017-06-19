//
//  SelectBackgroundColorController.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 18.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class SelectBackgroundColorController: NSViewController, NSCollectionViewDataSource, NSCollectionViewDelegate {

// MARK: - IBOutlet's
    
    @IBOutlet weak var colorCollection: NSCollectionView!
    @IBOutlet weak var colorScrollView: NSScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        colorCollection.frame = colorScrollView.bounds
        // Do view setup here.
    }
    
// MARK: - NSCollectionViewDataSource
    
    public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    public func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return AppContents.getBackgroundColors().count / 3
    }
    
    public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        let item = collectionView.makeItem(withIdentifier: "BgColorBannerCollectionItem",
                                           for: indexPath)
        guard let collectionViewItem = item as? BgColorBannerCollectionItem else {
            return item
        }
        
        let gradientModel = AppContents.getBackgroundColors()[indexPath.item+indexPath.section*3]
        
        if let bgColor = gradientModel.fillColor {
            (collectionViewItem.view as! BGColorView).setBackgroundColor(withColors: [bgColor.cgColor, bgColor.cgColor])
        } else {
            (collectionViewItem.view as! BGColorView).setBackgroundColor(withColors: [(gradientModel.firstGradientColor?.cgColor)!, (gradientModel.secondGradientColor?.cgColor)!])
        }
        
        return item
    }
    
// MARK: - NSCollectionViewDelegate
    
    public func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        for indexPath in indexPaths {
            guard let item = collectionView.item(at: indexPath) else {continue}
            
            let gradientModel = AppContents.getBackgroundColors()[indexPath.item+indexPath.section*3]
            let gradientColor = (item.view as! BGColorView).backgroundColors
            
            let addNewBannerVC = self.presenting as! CreateNewBannerViewController
            
            addNewBannerVC.newBannerModel.backgroundColor = gradientColor
            addNewBannerVC.newBannerView.setBackgroundColor(withColors: gradientColor)
            
            addNewBannerVC.newBannerModel.bgColorName = gradientModel.name
            addNewBannerVC.bgColorLabel.stringValue = gradientModel.name
            
            addNewBannerVC.bgColorView.setBackgroundColor(withColors: gradientColor)
            
            self.dismiss(nil)
        }
    }
    
// MARK: - Actions
    
    @IBAction func backToAddNewBannerAction(_ sender: Any) {
        
        //let addNewBannerVC = self.presenting as! CreateNewBannerViewController
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
