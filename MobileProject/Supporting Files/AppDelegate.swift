//
//  AppDelegate.swift
//  MobileProject
//
//  Created by xuwen on 2017/3/20.
//  Copyright © 2017年 xuwen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //加载TabBarVC
        let vc: BaseTabBarViewController = BaseTabBarViewController.sharedInstance
        window?.rootViewController = vc
        
        // Configure global setting
        applicationApperance()
        
        //友盟数据统计、社会化
        UmengHelper.UMAnalyticStart()
        
        //高德地图
        
        //信鸽推送
        
        //启动广告
        
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func applicationApperance(){
        
        //  1、获取导航条
        let navBar = UINavigationBar.appearance();
        //  2、设置导航条背景
//        navBar.setBackgroundImage(UIImage(named: "red_bar"), forBarMetrics: UIBarMetrics.Default);
        //  3、设置字体属性
        navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: UIFont.boldSystemFont(ofSize: 18)];
        
        navBar.tintColor = UIColor.black
        
        navBar.shadowImage = UIImage()
        
    }

}

