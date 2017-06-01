//
//  BaseTabBarViewController.swift
//  MobileProject
//
//  Created by xuwen on 2017/3/20.
//  Copyright © 2017年 xuwen. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class BaseTabBarViewController: ESTabBarController, UITabBarControllerDelegate {
    
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
        
        let v1 : HomePageViewController! = HomePageViewController()
        let nav1 : UINavigationController! = UINavigationController(rootViewController: v1)
        
        let v2 : DiscoveryViewController! = DiscoveryViewController()
        let nav2 : UINavigationController! = UINavigationController(rootViewController: v2)
        
        let v3 : MessageViewController! = MessageViewController()
        let nav3 : UINavigationController! = UINavigationController(rootViewController: v3)
        
        let v4 : FavorViewController! = FavorViewController()
        let nav4 : UINavigationController! = UINavigationController(rootViewController: v4)
        
        let v5 : PersonalViewController! = PersonalViewController()
        let nav5 : UINavigationController! = UINavigationController(rootViewController: v5)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.gray, NSFontAttributeName: UIFont.systemFont(ofSize: 11)], for: UIControlState())
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: UIFont.systemFont(ofSize: 11)], for: UIControlState.selected)
        
        v1.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v2.tabBarItem = UITabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = UITabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v4.tabBarItem = UITabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v5.tabBarItem = UITabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        v1.tabBarItem.badgeValue = "New"
        v2.tabBarItem.badgeValue = "99+"
        v3.tabBarItem.badgeValue = "1"
        
        if let tabBarItem = v3.tabBarItem as? ESTabBarItem {
            tabBarItem.badgeColor = UIColor.blue
        }
        
        v4.tabBarItem.badgeValue = ""
        v5.tabBarItem.badgeValue = nil
        
        self.viewControllers = [nav1, nav2, nav3, nav4, nav5]
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
