//
//  FMDBShareApi.swift
//  HomePlus
//
//  Created by xuwen on 2017/4/26.
//  Copyright © 2017年 worldunion. All rights reserved.
//

import UIKit

class FMDBShareApi: NSObject {
    var database:FormDatabase?
    
    var defaultDatabase:FormDatabase {
        
        get{
            if database == nil {

                assertionFailure("请设置基础path")
            }
            
            return database!
            
        }
        
    }
    
    
    
    //MARK: --单利
    private static let fMDBShareApi = FMDBShareApi()
    class var shareApi:FMDBShareApi {
        return fMDBShareApi
    }
    
    
    
    func initDatabaseWithPath(path:String)  {
        
        database = FormDatabase.init(path: path)
        
    }
}
