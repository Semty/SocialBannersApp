//
//  Translation.swift
//  SocialBannersApp
//
//  Created by Ruslan Timchenko on 24.06.2017.
//  Copyright © 2017 Ruslan Timchenko. All rights reserved.
//

import Foundation
import Cocoa

class Translation {
    
// MARK: - English Base
    
    static let changeString = NSLocalizedString("changeString",
                                                  tableName: "Main",
                                                  bundle: Bundle.main,
                                                  value: "Change",
                                                  comment: "Change String Button")
    
    static let saveString = NSLocalizedString("saveString",
                                              tableName: "Main",
                                              bundle: Bundle.main,
                                              value: "Save",
                                              comment: "Save String Button")
}
