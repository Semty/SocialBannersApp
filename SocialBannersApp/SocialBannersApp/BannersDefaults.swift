//
//  BannersDefaults.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 23/06/2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Cocoa

class BannersDefaults {

    static func save(banner bannerObject: BannerModel, forKey key: BannersKey) {
        
        let archiveData = NSKeyedArchiver.archivedData(withRootObject: bannerObject)
        
        if UserDefaults.standard.array(forKey: key.rawValue) == nil {
            
            UserDefaults.standard.setValue([archiveData],
                                           forKey: key.rawValue)
        } else {
            var banners = UserDefaults.standard.array(forKey: key.rawValue) as! [Data]
            
            if banners.count == 18 {
                banners.removeLast()
            }
            
            banners.insert(archiveData, at: 0)
            UserDefaults.standard.setValue(banners,
                                           forKey: key.rawValue)
        }
    }
    
    static func loadBanners(forKey key: BannersKey) -> [BannerModel] {
        
        if let banners = UserDefaults.standard.array(forKey: key.rawValue) {
            
            let inputData = banners as! [Data]
            
            var unarchivedBanners = [BannerModel]()

            for data in inputData {
                unarchivedBanners.append(NSKeyedUnarchiver.unarchiveObject(with: data) as! BannerModel)
            }

            return unarchivedBanners
        } else {
            return []
        }
    }
    
}

enum BannersKey: String {
    case banners
}
