//
//  BaseModel.swift
//  MobileProject
//
//  Created by xuwen on 2017/3/21.
//  Copyright © 2017年 xuwen. All rights reserved.
//

import UIKit

class BaseModel: NSObject {

    override init(){
        
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
