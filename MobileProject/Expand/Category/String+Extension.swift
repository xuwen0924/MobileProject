//
//  NSString+Extension.swift
//  MobileProject
//
//  Created by xuwen on 16/6/13.
//  Copyright © 2016年 xuwen. All rights reserved.
//

import Foundation

//@objc 
extension String {
    
    //MARK: --url编码
    public func urlStringEncoding() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    //MARK: --url解码
    public func urlStringDeEncoding()-> Void {
        self.removingPercentEncoding
    }
    
    //MARK: --获取项目文件路径
    public static func documentPath() -> String {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        return path!
    }
    
    func toString() -> String{
        guard self.isEmpty else {
            return ""
        }
        return self
    }
    
    //MARK: --获取md5
    func md5String() -> String{
        let cStr = cString(using: String.Encoding.utf8);
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
    
    //MARK: --字符串转float
    func stringToFloat()->CGFloat{
        
        let string = self
        var cgFloat: CGFloat = 0
        
        
        if let doubleValue = Double(string)
        {
            cgFloat = CGFloat(doubleValue)
        }
        return cgFloat
    }
    
    //MARK: --字符串转Int
    func stringToInt()->Int{
        
        let string = self
        var int: Int?
        if let doubleValue = Int(string) {
            int = Int(doubleValue)
        }
        if int == nil
        {
            return 0
        }
        return int!
    }
    
    //MARK: --DateString 转 Date
    func getDateByFormatString(_ str: String) -> Date? {
        
        
        let dateFormat = DateFormatter()
        
        dateFormat.dateFormat = str
        dateFormat.locale = Locale.current
        
        return dateFormat.date(from: self)
    }
    
    
    //截取字符串
    func substrfromBegin(length:Int)->String{
        
        let index = self.index(self.startIndex, offsetBy: length)
        
        return self.substring(to: index)
        
    }
    
    
    func getCommonDateByFormatString() -> Date? {
        return getDateByFormatString("yyyy-MM-dd HH:mm:ss")
    }
    
    //MARK: --计算UILabel中字符串的高度
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat(MAXFLOAT))
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.height
    }
    
    //MARK: --计算UILabel中字符串的宽度
    func widthWithConstrainedHeight(height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat(MAXFLOAT), height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return boundingBox.width
    }
    
    var unicodeStr:String {
        let tempStr1 = self.replacingOccurrences(of: "\\u", with: "\\U")//self.stringByReplacingOccurrencesOfString("\\u", withString: "\\U")
        let tempStr2 = tempStr1.replacingOccurrences(of:"\"", with: "\\\"")
        let tempStr3 = "\"".appending(tempStr2).appending("\"")// "\"".stringByAppendingString(tempStr2).stringByAppendingString("\"")
        let tempData = tempStr3.data(using: String.Encoding.utf8)//tempStr3.dataUsingEncoding(NSUTF8StringEncoding)
        var returnStr:String = ""
        do {
            returnStr = try PropertyListSerialization.propertyList(from: tempData!, options: .mutableContainersAndLeaves, format: nil) as! String//try NSPropertyListSerialization.propertyListWithData(tempData!, options: .Immutable, format: nil) as! String
        } catch {
            print(error)
        }
        return returnStr.replacingOccurrences(of:"\\r\\n", with: "\n")
    }
    
    //MARK: --控制小数最多小数点后两位
    func areaStringWithFromat() ->String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let num = NSNumber(floatLiteral: Double(self)!)
        let string = formatter.string(from: num)
        return string!
    }
    
    //MARK: --格式化金额，千分位
    /*!
     *  @author xuwen, 16-12-28 14:12:49
     *
     *  @brief 格式化金额，千分位
     *
     enum{
     
     NSNumberFormatterNoStyle = kCFNumberFormatterNoStyle,123456789
     
     NSNumberFormatterDecimalStyle = kCFNumberFormatterDecimalStyle, 123,456,789
     
     NSNumberFormatterCurrencyStyle = kCFNumberFormatterCurrencyStyle, ￥123,456,789.00
     
     NSNumberFormatterPercentStyle = kCFNumberFormatterPercentStyle, -539,222,988%
     
     NSNumberFormatterScientificStyle = kCFNumberFormatterScientificStyle, 1.23456789E8
     
     NSNumberFormatterSpellOutStyle = kCFNumberFormatterSpellOutStyle, 一亿二千三百四十五万六千七百八十九
     
     };
     
     *
     *  @param num <#num description#>
     *
     *  @return <#return value description#>
     *
     *  @since <#1.1.0#>
     */
    func formatMoneyWithNum() -> String {
        let format = NumberFormatter()
        format.positiveFormat = "###,##0.00;"
        format.numberStyle = .decimal
        let num = NSNumber(floatLiteral: Double(self)!)
        let string = format.string(from: num)
        return string!
    }
    
}
