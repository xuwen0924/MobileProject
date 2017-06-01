//
//  NSObject+FMDB.swift
//  HomePlus
//
//  Created by xuwen on 2017/4/26.
//  Copyright © 2017年 worldunion. All rights reserved.
//

import UIKit

extension NSObject {
    
    //MARK:创建表
    
    func creatTable() ->Bool   {
        let fmormDatabase = FMDBShareApi.shareApi.defaultDatabase
        
        
        if fmormDatabase.checkTableExists(myclass: self.classForCoder) {
            return true
        } else{
            
            printLog(message: "错误代码==\(fmormDatabase.lastError?.localizedDescription)")
            return false
        }
        
    }
    
    //MARK:创建索引
    
    func createIndex(columns:Array<String>) -> Bool {
        
        
        if columns.count <= 0 {
            printLog(message: "错误代码==请输入列名")
            return false
        }else{
            let fmormDatabase = FMDBShareApi.shareApi.defaultDatabase
            
            
            if fmormDatabase.createIndex(entity: self, columns: columns) {
                return true
            } else{
                printLog(message: "错误代码==\(fmormDatabase.lastError?.localizedDescription)")
                return false
            }
        }
        
    }
    
    
    //MARK:插入
    func insertIntosqlite() ->Bool  {
        
        let fmormDatabase = FMDBShareApi.shareApi.defaultDatabase
        
        
        if fmormDatabase.save(entity: self) {
            return true
        } else{
            
            printLog(message: "错误代码==\(fmormDatabase.lastError?.localizedDescription)")
            return false
        }
        
        
        
    }
    
    //MARK:DROP
    
    func dropTable()-> Bool  {
        let fmormDatabase = FMDBShareApi.shareApi.defaultDatabase
        
        
        if fmormDatabase.dropTable(myclass: self.classForCoder) {
            return true
        } else{
            
            printLog(message: "错误代码==\(fmormDatabase.lastError?.localizedDescription)")
            return false
        }
        
    }
    
    //MARK:update
    
    func updateWithWhereStr(whereStr:String?) -> Bool {
        let fmormDatabase = FMDBShareApi.shareApi.defaultDatabase
        
        
        if fmormDatabase.update(entity: self, strWhere: whereStr) {
            return true
        } else{
            
            printLog(message: "错误代码==\(fmormDatabase.lastError?.localizedDescription)")
            return false
        }
        
        
        
    }
    
    
    //MARK:delete
    
    func deleteWithWhereStr(whereStr:String?) -> Bool {
        let fmormDatabase = FMDBShareApi.shareApi.defaultDatabase
        
        
        if fmormDatabase.delete(myclass: self.classForCoder, strWhere: whereStr) {
            return true
        } else{
            
            printLog(message: "错误代码==\(fmormDatabase.lastError?.localizedDescription)")
            return false
        }
    }
    
    //MARK:查询
    
    //MARK:查询 max,min等的查询
    func query(others:Array<String>,strWhere:String?,strOrderby:String?) ->Array<Any>? {
        let fmormDatabase = FMDBShareApi.shareApi.defaultDatabase
        
        let array = fmormDatabase.query(myclass: self.classForCoder, others: others, strWhere: strWhere, strOrderby: strOrderby)
        
        if array != nil  {
            return array
        }else{
            
            printLog(message: "错误代码==\(fmormDatabase.lastError?.localizedDescription)")
            return nil
            
        }
        
    }
    
    func queryWithWhereStr(columns:Array<String>?,whereStr:String?,orderBy:String?) -> Array<Any>? {
        let fmormDatabase = FMDBShareApi.shareApi.defaultDatabase
        
        let array = fmormDatabase.query(myclass: self.classForCoder, columns: columns, strWhere: whereStr, strOrderby: orderBy)
        
        if array != nil  {
            
            return array
        }else{
            
            printLog(message: "错误代码==\(fmormDatabase.lastError?.localizedDescription)")
            return nil
            
        }
        
        
    }
    
    func queryWithWhereStr(whereStr:String?,orderBy:String?) -> Array<Any>? {
        
        return self.queryWithWhereStr(columns: nil, whereStr: whereStr, orderBy: orderBy)
        
        
        
        
    }
    
    
    
    
    
    
    
}
