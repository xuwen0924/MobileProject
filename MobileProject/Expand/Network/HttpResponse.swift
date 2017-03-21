//
//  HttpResponse.swift
//  MobileProject
//
//  Created by xuwen on 2017/3/21.
//  Copyright © 2017年 xuwen. All rights reserved.
//

import UIKit
import SwiftyJSON

class HttpResponse: NSObject {

    var code : String
    var data : JSON
    var message : String?
    
    init(code:String,data:JSON,message:String = "") {
        self.code = code
        self.data = data
        self.message = message
        super.init()
    }
}
