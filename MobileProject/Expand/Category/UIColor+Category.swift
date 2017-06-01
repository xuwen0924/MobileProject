//  SwiftColors.swift
//
// Copyright (c) 2014 Doan Truong Thi
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#if os(iOS)
  import UIKit
  typealias SWColor = UIColor
#else
  import Cocoa
  typealias SWColor = NSColor
#endif

public extension SWColor {
    
    //16进制颜色值转UIColor
    public class func hexStringToColor(_ hexString: String) -> UIColor{
        var cString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if cString.characters.count < 6 {return UIColor.black}
        if cString.hasPrefix("0X") {cString = cString.substring(from: cString.characters.index(cString.startIndex, offsetBy: 2))}
        if cString.hasPrefix("#") {cString = cString.substring(from: cString.characters.index(cString.startIndex, offsetBy: 1))}
        if cString.characters.count != 6 {return UIColor.black}
        
        var range: NSRange = NSMakeRange(0, 2)
        
        let rString = (cString as NSString).substring(with: range)
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        var r: UInt32 = 0x0
        var g: UInt32 = 0x0
        var b: UInt32 = 0x0
        Scanner.init(string: rString).scanHexInt32(&r)
        Scanner.init(string: gString).scanHexInt32(&g)
        Scanner.init(string: bString).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(1))
    }
    
    //MARK:-主颜色
    //TODO:xxxxxx
    /*!
     主颜色
     
     - returns: <#return value description#>
     */
    public class func mainColor() -> UIColor {
        return hexStringToColor("f03059")
    }
    
    //MARK: --按钮高亮颜色
    /*!
     
     - author: xuwen
     - date: 16-07-05 15:07:38
     按钮高亮颜色
     
     - returns: <#return value description#>
     */
    public class func highLightColor() -> UIColor {
        return hexStringToColor("51bfca")
    }
    
    //MARK:-背景颜色
    //FIXME:
    /*!
     背景颜色
     
     - returns: <#return value description#>
     */
    public class func backgroundColor() -> UIColor {
        return hexStringToColor("f3f4f5")
    }
    
    //MARK: -边框颜色
    /*!
     边框颜色
     
     - returns: <#return value description#>
     */
    public class func borderColor() -> UIColor {
        return hexStringToColor("e7eaf0")
    }
    
    //MARK: --深黑色
    /// 深黑色
    ///
    /// - Returns: <#return value description#>
    public class func darkColor() -> UIColor {
        return hexStringToColor("303135")
    }
    
    //MARK: -文字颜色，黑色
    /*!
     文字颜色，黑色
     
     - returns: <#return value description#>
     */
    public class func fontBlack() -> UIColor {
        return hexStringToColor("141414")
    }
    
    //MARK: -文字颜色，灰色
    /*!
     文字颜色，灰色
     
     - returns: <#return value description#>
     */
    public class func fontGray() -> UIColor {
        return hexStringToColor("9ea3a6")
    }
    
    //MARK: -文字颜色，次级灰色
    /*!
     文字颜色，次级灰色
     
     - returns: <#return value description#>
     */
    public class func fontLightGray() -> UIColor {
        return hexStringToColor("dce2e6")
    }
    
    //MARK: -金额颜色，红色
    /*!
     金额颜色，红色
     
     - returns: <#return value description#>
     */
    public class func priceColor() -> UIColor {
        return hexStringToColor("cb151a")
    }
    
    //MARK: --TextFieldColor
    //MARK: -- 提示
    public class func textPlaceholderColor() -> UIColor {
        return hexStringToColor("cfd6db")
    }
    
    //MARK: -- 输入后
    public class func textInputEndColor() -> UIColor {
        return hexStringToColor("141414")
    }
    
    //MARK: --不可修改
    public class func textNoEditColor() -> UIColor {
        return hexStringToColor("9ea3a6")
    }
    
    //MARK: --按钮Normal颜色
    /// --按钮Normal颜色
    ///
    /// - Returns: UIColor
    public class func buttonNormalColor() -> UIColor {
        return hexStringToColor("e33553")
    }
    
    //MARK: --按钮Highlighted颜色
    /// --按钮Highlighted颜色
    ///
    /// - Returns: UIColor
    public class func buttonHighlightedColor() -> UIColor {
        return hexStringToColor("ee5a69")
    }
    
    //MARK: --按钮Disabled颜色
    /// --按钮Disabled颜色
    ///
    /// - Returns: UIColor
    public class func buttonDisabledColor() -> UIColor {
        return backgroundColor()
    }
    
    //MARK: --按钮Selected颜色
    /// --按钮Selected颜色
    ///
    /// - Returns: UIColor
    public class func buttonSelectedColor() -> UIColor {
        return fontLightGray()
    }
    
    //MARK: --按钮Focused颜色
    /// --按钮Focused颜色
    ///
    /// - Returns: UIColor
    public class func buttonFocusedColor() -> UIColor {
        return fontLightGray()
    }
    
    //MARK: --按钮点击颜色
    
    
    //主题色
    public class func applicationMainColor() -> UIColor {
        return UIColor(red: 238/255, green: 64/255, blue: 86/255, alpha:1)
    }
    
    //第二主题色
    public class func applicationSecondColor() -> UIColor {
        return UIColor.lightGray
    }
    
    //警告颜色
    public class func applicationWarningColor() -> UIColor {
        return UIColor(red: 0.1, green: 1, blue: 0, alpha: 1)
    }
    
    //链接颜色
    public class func applicationLinkColor() -> UIColor {
        return UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha:1)
    }
    
    //MARK: --颜色转图片
    public func createImageWithColor() -> UIImage {
        let rect = CGRect(x:0.0, y:0.0,width:1.0,height:1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(self.cgColor)
        context!.fill(rect)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return theImage!
    }
    
    /**
     Create non-autoreleased color with in the given hex string
     Alpha will be set as 1 by default
     
     - parameter   hexString:
     - returns: color with the given hex string
     */
    public convenience init?(hexString: String) {
        self.init(hexString: hexString, alpha: 1.0)
    }
    
    /**
     Create non-autoreleased color with in the given hex string and alpha
     
     - parameter   hexString:
     - parameter   alpha:
     - returns: color with the given hex string and alpha
     */
    public convenience init?(hexString: String, alpha: Float) {
        var hex = hexString
        
        // Check for hash and remove the hash
        if hex.hasPrefix("#") {
            hex = hex.substring(from: hex.characters.index(hex.startIndex, offsetBy: 1))
        }
        
        if (hex.range(of: "(^[0-9A-Fa-f]{6}$)|(^[0-9A-Fa-f]{3}$)", options: .regularExpression) != nil) {
            
            // Deal with 3 character Hex strings
            if hex.characters.count == 3 {
                let redHex   = hex.substring(to: hex.characters.index(hex.startIndex, offsetBy: 1))
                let greenHex = hex.substring(with: (hex.characters.index(hex.startIndex, offsetBy: 1) ..< hex.characters.index(hex.startIndex, offsetBy: 2)))
                let blueHex  = hex.substring(from: hex.characters.index(hex.startIndex, offsetBy: 2))
                
                hex = redHex + redHex + greenHex + greenHex + blueHex + blueHex
            }
            
            let redHex = hex.substring(to: hex.characters.index(hex.startIndex, offsetBy: 2))
            let greenHex = hex.substring(with: (hex.characters.index(hex.startIndex, offsetBy: 2) ..< hex.characters.index(hex.startIndex, offsetBy: 4)))
            let blueHex = hex.substring(with: (hex.characters.index(hex.startIndex, offsetBy: 4) ..< hex.characters.index(hex.startIndex, offsetBy: 6)))
            
            var redInt:   CUnsignedInt = 0
            var greenInt: CUnsignedInt = 0
            var blueInt:  CUnsignedInt = 0
            
            Scanner(string: redHex).scanHexInt32(&redInt)
            Scanner(string: greenHex).scanHexInt32(&greenInt)
            Scanner(string: blueHex).scanHexInt32(&blueInt)
            
            self.init(red: CGFloat(redInt) / 255.0, green: CGFloat(greenInt) / 255.0, blue: CGFloat(blueInt) / 255.0, alpha: CGFloat(alpha))
        }
        else {
            // Note:
            // The swift 1.1 compiler is currently unable to destroy partially initialized classes in all cases,
            // so it disallows formation of a situation where it would have to.  We consider this a bug to be fixed
            // in future releases, not a feature. -- Apple Forum
            self.init()
            return nil
        }
    }

    /**
     Create non-autoreleased color with in the given hex value
     Alpha will be set as 1 by default
     
     - parameter   hex:
     - returns: color with the given hex value
     */
    //  public convenience init?(hex: Int) {
    //    self.init(hex: hex, alpha: 1.0)
    //  }
    
    /**
     Create non-autoreleased color with in the given hex value and alpha
     
     - parameter   hex:
     - parameter   alpha:
     - returns: color with the given hex value and alpha
     */
    public convenience init?(hex: Int, alpha: Float) {
        let hexString = NSString(format: "%2X", hex)
        self.init(hexString: hexString.description , alpha: alpha)
    }
    
    //MARK: --获取随机颜色
    class func randomColor() -> UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(256)), green: CGFloat(arc4random_uniform(256)), blue: CGFloat(arc4random_uniform(256)), alpha: 1.0)
//        return UIColor(red: CGFloat(arc4random_uniform(256)), greed: CGFloat(arc4random_uniform(256)), blue: CGFloat(arc4random_uniform(256)),alpha:1.0)
    }
}


