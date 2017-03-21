//
//  Macros.swift
//  MobileProject
//
//  Created by xuwen on 2017/3/21.
//  Copyright © 2017年 xuwen. All rights reserved.
//

import Foundation
import UIKit

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








