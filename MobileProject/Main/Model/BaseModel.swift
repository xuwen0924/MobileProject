//
//  BaseModel.swift
//  MobileProject
//
//  Created by xuwen on 2017/3/21.
//  Copyright © 2017年 xuwen. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    //全局单利
    static let sharedInstance = BaseModel()
    
    //用于Basemodel
    lazy var baseModel: BaseModel = {
        let baseModel = BaseModel()
        
        return baseModel
        
    }()
    
    fileprivate var propertyNames: Array<String>?
    
    
    
    required public init(content: Dictionary<String,AnyObject>) {
        super.init()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init();
        let properties = self.allProperties()
        for (index, string) in properties.enumerated() {
            print(index,string)
            self.setValue(aDecoder.decodeObject(forKey: string), forKey: string)
        }
        
    }
    
    open func encode(with aCoder: NSCoder) {
        let properties = self.allProperties()
        for (_, string) in properties.enumerated() {
            aCoder.encode(self.value(forKey: string), forKey: string)
        }
    }
    
    ///MARK: -
    class func model() -> BaseModel!{
        struct Static {
            static var onceToken: Int = 0
            static var instance: BaseModel? = nil
        }
//        if (Static.instance==nil) {
        Static.instance = unarchive()
//        }
        return Static.instance!
    }
    
    
    override init() {
        super.init()
//        SLogVerbose("BaseModel init()")
    }
    
    var myID: AnyObject?
    
//    var _cahceDict: NSMutableDictionary?
    
    var httpCilent:HttpClient?
    
    //MARK: --懒加载cacheDict
    /*
     //1.分析 NSArray 是一个闭包的返回值，而这是一个没有参数的闭包
     lazy var cacheDict: NSMutableDictionary = {
     {}
     }()*/
    
    //2.也可以写成这样
    lazy var cacheDict: NSMutableDictionary = {
        return NSMutableDictionary()
    }()
    
    //    class func cacheDict() -> NSMutableDictionary {
    //        guard let dic = _cahceDict   else {
    //            _cahceDict = NSMutableDictionary()
    //            return _cahceDict!
    //        }
    //        return dic
    //    }
    /*
     //3.从plist文件加载
     lazy var dataArray:Array<XWWine> = {
     let winePath = NSBundle.mainBundle().pathForResource("wine.plist", ofType: nil)!
     let winesM = NSMutableArray(contentsOfFile: winePath);
     var tmpArray:Array<XWWine>! = []
     for tmpWineDict in winesM! {
     var wine:XWWine = XWWine.wineWithDict(tmpWineDict as! NSDictionary)
     tmpArray.append(wine)
     }
     print("我就运行一次")
     return tmpArray }()
     */
    
    //MARK: --归档路径+文件名
    class func filePathForArchive() -> String {
        let fileName = NSStringFromClass(self)
        
        //Documents目录 苹果建议将程序中建立的或在程序中浏览到的文件数据保存在该目录下，iTunes备份和恢复的时候会包含此目录
        let documentPaths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)//(.DocumentDirectory, .UserDomainMask, true)
        let dir = documentPaths[0]
        //let documentPath = homeDirectory + "/Documents"
        //        let dir = String.documentPath()//文件夹目录
        return dir + "/" + fileName
    }
    
    //MARK: --存在则解档
    class func unarchive() -> BaseModel?{
        let filePath = self.filePathForArchive()
        let fileExistsAtPath = FileManager.default.fileExists(atPath: filePath)
        guard fileExistsAtPath else {
            return BaseModel()
        }
        let unarObj = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as! BaseModel
        return unarObj.self
    }
    
    //MARK: --归档
    func archive() -> Void {
        let filePath = self.classForCoder.filePathForArchive()
        
        let isSave = NSKeyedArchiver.archiveRootObject(self, toFile: filePath)
        print("归档\(NSStringFromClass(self.classForCoder))到\(filePath)\n 保存了吗？\(isSave)")
    }
    
    func archiveWithName(_ fileName: String) -> Void {
        var filePath = self.classForCoder.filePathForArchive()
        filePath = filePath + fileName
        NSKeyedArchiver.archiveRootObject(self, toFile: filePath)
        print("归档\(NSStringFromClass(self.classForCoder))到\(filePath)")
    }
    
    enum Error {
        case removeArchive
    }
    
    //MARK: --删除归档
    class func deleteArchivedFile() throws {
        let fileManager = FileManager.default
        defer {
            // No matter what happened I need do something
            print("All done, clean up here")
        }
        //徐判断文件是否存在
        let exist = fileManager.fileExists(atPath: self.filePathForArchive())
        if exist == false {
            return
        }
        
        do {
            try fileManager.removeItem(atPath: self.filePathForArchive())
        } catch Error.removeArchive {
            print("Error.removeArchive")
        }
        
        
        //        SLogInfo("删除归档")
    }
    
    //MARK: --对model修改的值执行更新
    func cache() -> Void {
        print(NSStringFromClass(self.classForCoder))
        self.cacheDict.addUnEmptyObject(self, key: NSStringFromClass(self.classForCoder))
        archive()
    }
    
    
    //MARK: --执行清除
    class func clear() -> Void {
        
        let cacheDict = BaseModel().cacheDict
        cacheDict.removeObject(forKey: NSStringFromClass(self))
        
        try! self.deleteArchivedFile()
    }
    
    //    override public var description: String {
    //        return "BaseClass:\(self)"
    //    }
    //
    //    override public var debugDescription: String {
    //        return "debugDescription:\(self)"
    //    }
    
    //    //MARK: --重写该方法，对返回nil，none等数据进行过滤
    //    override open func setValue(_ value: Any?, forKey key: String) {
    //
    //        let newValue = String(format: "%@", value as! CVarArg)
    //        super.setValue(newValue, forKey: key)
    //    }
    //
    //    //MARK: --重写该方法，对接口返回关键词字段进行替换
    //    override open func setValue(_ value: Any?, forUndefinedKey key: String) {
    //        let _key = "id"
    //        if _key==key {
    //            myID = value as AnyObject
    //        }
    //    }
    
    //MARK: Model所有参数和值
    func allPropertyNamesAndValues() -> [String: AnyObject] {
        var count: UInt32 = 0
        let properties = class_copyPropertyList(self.classForCoder, &count)
        
        var resultDict: [String: AnyObject] = [:]
        
        for i in 0 ..< Int(count) {
            let property = properties?[i]
            //取得属性名
            let name = property_getName(property)
            if let propertyName = String(validatingUTF8: name!) {
                //取得属性值
                if let propertyValue = self.value(forKey: propertyName) {
                    resultDict[propertyName] = propertyValue as AnyObject
                }
            }
        }
        return resultDict
    }
    
    //MARK: --所有方法
    func allMethods() {
        var count: UInt32 = 0
        let methods = class_copyPropertyList(self.classForCoder, &count)
        for i in 0 ..< Int(count) {
            let method = methods?[i]
            let sel = method_getName(method)
            let methodName = sel_getName(sel)
            let argument = method_getNumberOfArguments(method)
            print("name：\(String(describing: methodName)), argumentns：\(argument)")
        }
    }
    
    //MARK: --获取对象的成员变量
    func allMemberVariables() ->[String] {
        var count: UInt32 = 0
        let ivars = class_copyIvarList(self.classForCoder, &count)
        var result: [String] = []
        for i in 0 ..< Int(count) {
            let ivar = ivars?[i]
            let name = ivar_getName(ivar)
            if let varName = String(validatingUTF8: name!) {
                result.append(varName)
            }
        }
        return result
    }
    
    //MARK: --获取所有参数名称，数组
    func allProperties() -> [String] {
        //使用类型可以使用CUnsignedInt，对应Swift中的UInt32 var count: UInt32 = 0
        var count: UInt32 = 0
        let properties = class_copyPropertyList(self.classForCoder, &count)
        var propertyNames: [String] = []
        //Swift中类型是严格检查的，必须转换成同一类型
        for i in 0 ..< Int(count) {
            //UnsafeMutablePointer<objc_property_t>是
            //可变指针，因此properties就是类似数组一样，可以
            //通过下标获取
            let property = properties?[i]
            let name = property_getName(property)
            //这里还得转换成字符串
            let strName = String(cString: name!);
            propertyNames.append(strName);
            
        }
        //不要忘记释放内存，否则C语言的指针很容易成野指针的
        free(properties)
        return propertyNames
    }
    
    //MARK: --FMDB----------------------
    //MARK: --创建对于model的sql语句
    func buildSql() {
        let tableInfo = TableInfo.getTableInfo(myclass: self.classForCoder)
        printLog(message: "====_primaryFieldName===\(tableInfo._primaryFieldName)")
        //        let sqlbuilder = SqlBuilder.buildQuerySql(myclass: self.classForCoder, columns: ["id","name"])
        
        //        let sqlbuilder = SqlBuilder.buildCreatTableSql(myclass: self.classForCoder)
        
        
        //        let sqlbuilder = SqlBuilder.buildInsertSql(entity: self)
        
        
        let sqlbuilder = SqlBuilder.buildUpdateSql(entity: self)
        
        printLog(message: "====sqlbuilder==\(sqlbuilder.sql)")
        
    }
    
    
}








