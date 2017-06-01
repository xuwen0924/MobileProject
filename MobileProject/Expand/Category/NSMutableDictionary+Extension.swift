//
//  NSMutableDictionary+Extension.swift
//  MobileProject
//
//  Created by xuwen on 16/6/12.
//  Copyright © 2016年 xuwen. All rights reserved.
//

import Foundation

extension NSMutableDictionary {
    public func addUnEmptyObject(_ object: AnyObject,key: String) ->Void {
     
//        let arrayClass = NSClassFromString("Array")
//        let dicClass = NSClassFromString("Dictionary")
//        let stringClass = NSClassFromString("String")
        
//        guard let result = object else {
//            self.setValue("", forKey: key)
//            return
//        }
        self.setValue(object, forKey: key)
    }
}
