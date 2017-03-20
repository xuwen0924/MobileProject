//
//  BaseTabBarViewController.swift
//  MobileProject
//
//  Created by xuwen on 2017/3/20.
//  Copyright © 2017年 xuwen. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    class var sharedInstance: BaseTabBarViewController{
        struct Instance{
            static let instance: BaseTabBarViewController = BaseTabBarViewController()
        }
        return Instance.instance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        initTabBarControllers();
        createHomeUI();
    }
    
    func createHomeUI(){
    }
    
    func initTabBarControllers(){
        
        let home : HomePageViewController! = HomePageViewController()
        let homeNav : UINavigationController! = UINavigationController(rootViewController: home)
        
        let product : DiscoveryViewController! = DiscoveryViewController()
        let productNav : UINavigationController! = UINavigationController(rootViewController: product)
        
        let message : MessageViewController! = MessageViewController()
        let messageNav : UINavigationController! = UINavigationController(rootViewController: message)
        
        let personal : PersonalViewController! = PersonalViewController()
        let personalNav : UINavigationController! = UINavigationController(rootViewController: personal)
        
        self.viewControllers = [homeNav, productNav, messageNav, personalNav]
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.gray, NSFontAttributeName: UIFont.systemFont(ofSize: 11)], for: UIControlState())
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: UIFont.systemFont(ofSize: 11)], for: UIControlState.selected)
        
        for i: Int in 0..<(self.viewControllers?.count)! {
            self.viewControllers![i].tabBarItem = UITabBarItem.init(tabBarSystemItem: UITabBarSystemItem.topRated, tag: i)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
