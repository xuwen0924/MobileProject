//
//  FMDBAdapterHelper.swift
//  HomePlus
//
//  Created by liujinliang on 2017/4/21.
//  Copyright © 2017年 worldunion. All rights reserved.
//

import UIKit

class FMDBAdapterHelper: NSObject {
    
    var dbQueue:FMDatabaseQueue? = nil
    var fmDB: FMDatabase? = nil
    var dbPath: String? = ""
    //MARK: --单利
    static func shared() -> FMDBAdapterHelper {
        struct Singleton {
            static var single = FMDBAdapterHelper()
        }
        return Singleton.single
    }
    
    
    enum Error {
        case createDirectory
    }
    
    //MARK: --获取本地数据库文件路径
    func getDBPath() -> String{
        let filePath = FCFileManager.pathForLibraryDirectory(withPath: "HomePlus.db")
        printLog(message: "filePath:\(String(describing: filePath))")
        dbPath = filePath
        return filePath!
    }
    
    //MARK: --删除本地数据库
    func deleteDatabase() -> Bool{
        let result = FCFileManager.removeFilesInDirectory(atPath: dbPath)
        return result
        
    }
    
    func setupDBQueue() -> FMDatabaseQueue {
        if dbQueue == nil {
            dbQueue = FMDatabaseQueue.init(path: dbPath)
            dbQueue?.inDatabase({[weak self] (db) in
                self?.fmDB = db
            })
            
            let manager = FMDBMigrationManager(database: fmDB, migrationsBundle: Bundle.main)
            let expectedPath1 = Bundle.main.path(forResource: "20170425100911098_CreateHomeInfoObjV1.0", ofType: "sql")
            var homeInfoObj1: String?
            do {
                try homeInfoObj1 = String.init(contentsOfFile: expectedPath1!, encoding: String.Encoding.utf8)
            }catch let error {
                printLog(message: error)
            }
            printLog(message: "homeInfoObj1:\(homeInfoObj1)")
            let migration_1 = Migration(name: "新增HomeInfoObjV1.0表", andVersion: 1, andExecuteUpdate: [homeInfoObj1!])
            manager?.addMigration(migration_1)
            
            var resultState = false
            if (manager?.hasMigrationsTable)! == false {
                do {
                    try resultState =  ((manager?.createMigrationsTable()) != nil)
                } catch let error{
                    printLog(message: error)
                }
            }
            do {
                try resultState = ((manager?.migrateDatabase(toVersion: UInt64(UINT16_MAX), progress: nil)) != nil)
            } catch let error {
                printLog(message: error)
            }
            do {
                try migration_1?.migrateDatabase(fmDB)
            } catch let error {
                printLog(message: error)
            }
            
            printLog(message: "Has `schema_migrations` table?: \(String(describing: manager?.hasMigrationsTable))")
            printLog(message: "Origin Version:  \(String(describing: manager?.originVersion))")
            printLog(message: "Current version: \(String(describing: manager?.currentVersion))")
            printLog(message: "All migrations: \(String(describing: manager?.migrations))")
            printLog(message: "Applied versions: \(String(describing: manager?.appliedVersions))")
            printLog(message: "Pending versions: \(String(describing: manager?.pendingVersions))")
        }
        
        return dbQueue!
    }

    //MARK: --重置DBQueue
    func resetDBQueue() {
        dbQueue = nil
    }
    
}
