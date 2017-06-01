//
//  BaseViewController+Extension.swift
//  MobileProject
//
//  Created by xuwen on 16/6/7.
//  Copyright © 2016年 xuwen. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    
    func viewDidLoadForChangeTitleColor() {
        self.viewDidLoadForChangeTitleColor()
        if self.isKind(of: UINavigationController.classForCoder()) {
            self.changeNavigationBarTextColor(self as! UINavigationController)
        }
    }
    
    func changeNavigationBarTextColor(_ navController: UINavigationController) {
//        let nav = navController as UINavigationController
//        let dic = NSDictionary(object: UIColor.applicationMainColor(),
//                               forKey:NSForegroundColorAttributeName)
//        nav.navigationBar.titleTextAttributes = dic as? [String : AnyObject]
//        nav.navigationBar.barTintColor = UIColor.applicationSecondColor()
//        nav.navigationBar.tintColor = UIColor.applicationMainColor()
        
    }
    
    func swizzlingMethod(_ clzz: AnyClass, oldSelector: Selector, newSelector: Selector) {
        let oldMethod = class_getInstanceMethod(clzz, oldSelector)
        let newMethod = class_getInstanceMethod(clzz, newSelector)
        method_exchangeImplementations(oldMethod, newMethod)
    }
}
