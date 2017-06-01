//
//  NSObject+Extension.swift
//  MobileProject
//
//  Created by xuwen on 16/6/12.
//  Copyright © 2016年 xuwen. All rights reserved.
//

import Foundation

open class Object: AnyObject{
    
}

extension Object {
    public class func isValueEmpty(_ thing: AnyObject) -> Bool {
        
        return thing.isEqual(NSNull.init())
    }
}

