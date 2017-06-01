//
//  UmengHelper.swift
//  MobileProject
//
//  Created by xuwen on 2017/4/10.
//  Copyright © 2017年 xuwen. All rights reserved.
//

import UIKit

class UmengHelper: NSObject {

    /*!
     * 启动友盟统计功能
     */
    class func UMAnalyticStart() -> Void {
    
        UMAnalyticsConfig.sharedInstance().appKey=kUmengKey
        UMAnalyticsConfig.sharedInstance().channelId="App Store"
        MobClick.start(withConfigure: UMAnalyticsConfig.sharedInstance())
        // version标识
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
        MobClick.setAppVersion(version as! String)
        
        #if DEBUG
        // 打开友盟sdk调试，注意Release发布时需要注释掉此行,减少io消耗
        MobClick.setLogEnabled(true)
        #endif
        return;
    }
    
    /// 在viewWillAppear调用,才能够获取正确的页面访问路径、访问深度（PV）的数据
    class func beginLogPageView(pageView: String) -> Void {
        MobClick.beginLogPageView(pageView)
    }
    
    /// 在viewDidDisappeary调用，才能够获取正确的页面访问路径、访问深度（PV）的数据
    class func endLogPageView(pageView: String) -> Void {
        MobClick.endLogPageView(pageView)
    }
    
    /*!
     * 自定义名称
     */
    /// 在viewWillAppear调用,才能够获取正确的页面访问路径、访问深度（PV）的数据
    class func beginLogPageViewName(pageView: String) -> Void {
        MobClick.beginLogPageView(pageView)
    }
    
    /// 在viewDidDisappeary调用，才能够获取正确的页面访问路径、访问深度（PV）的数据
    class func endLogPageViewName(pageView: String) -> Void {
        MobClick.endLogPageView(pageView)
    }
}
