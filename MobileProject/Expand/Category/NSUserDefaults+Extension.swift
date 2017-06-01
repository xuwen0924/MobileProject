//
//  NSUserDefaults+Extension.swift
//  MobileProject
//
//  Created by xuwen on 16/8/1.
//  Copyright © 2016年 xuwen. All rights reserved.
//

import Foundation

extension UserDefaults {
    func addUnEmptyString(_ object: AnyObject, key: String) -> Void {
        self.set(object, forKey: key)
        self.synchronize()
    }
    
}
