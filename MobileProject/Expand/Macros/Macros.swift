//
//  Macros.swift
//  MobileProject
//
//  Created by xuwen on 2017/3/21.
//  Copyright © 2017年 xuwen. All rights reserved.
//

import Foundation
import UIKit

//获取UDID
var _kUdid:String?
var kUdid:String?{
    set {
        _kUdid = newValue
    }
    
    get {
        _kUdid = YYQKeyChain.getUDIDWithUniqueKey(appIdentifier)
        return _kUdid
    }
}

//Int转String
func formatIntToString(val:Int)->String
{return String(format: "%d", val)}

let APP_WINDOW = UIApplication.shared.keyWindow

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

let SCREEN_MAX_LENGTH = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let SCREEN_MIN_LENGTH = min(SCREEN_WIDTH, SCREEN_HEIGHT)

let IS_IPAD = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad
let IS_IPHONE  = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone

let IS_IPHONE_4_OR_LESS = (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
let IS_IPHONE_5 = (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
let IS_IPHONE_6 = (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
let IS_IPHONE_6P = (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

let APP_GLOBAL_COLOR = 0xfdce5e
let APP_Blue_COLOR = 0x22ca9d
let APP_Green_COLOR = 0x50bb5e
let APP_Red_COLOR = 0xe15951
let APP_Orange_COLOR = 0xff9600
let APP_Black_COLOR = 0x1f302f
let APP_BACKGROUND_COLOR = 0xf5f5f5

//图片
func kImage(imageName:String)-> UIImage {
    return UIImage.init(named: imageName)!
}

//日志输出：
func printLog<T>(message: T,
              file: String = #file,
              method: String = #function,
              line: Int = #line) {
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}

//MARK: --工程信息
let infroDictionary = Bundle.main.infoDictionary
//获取项目名称
let executableFile:String = infroDictionary?[kCFBundleExecutableKey! as String] as! String
//获取项目版本号
let version:String = infroDictionary?[kCFBundleVersionKey! as String] as! String
//app名称
let appName:String = infroDictionary?["CFBundleDisplayName"] as! String
//app版本
let appVersion:String = infroDictionary?["CFBundleShortVersionString"] as! String
// app build版本
let appBuild:String = infroDictionary?["CFBundleVersion"] as! String
// app bundleID
let appIdentifier:String = infroDictionary?["CFBundleIdentifier"] as! String







