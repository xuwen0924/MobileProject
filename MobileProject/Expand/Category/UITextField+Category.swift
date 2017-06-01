//
//  UITextField+Category.swift
//  HomePlus
//
//  Created by xuwen on 2017/4/13.
//  Copyright © 2017年 worldunion. All rights reserved.
//

import Foundation

extension UITextField {
    //MARK: --设置文本框右间距
    /// 设置文本框右间距
    ///
    /// - Parameter leftWidth: 间距大小
    public func setTextFieldLeftPaddingWidth(leftWidth: CGFloat) {
        var frame: CGRect = self.frame
        frame.size.width = leftWidth
        let leftView = UIView.init(frame: frame)
        leftViewMode = .always
        self.leftView = leftView
    }
    
    //MARK: --配置Placeholder的颜色
    func setTextColor() {
        if (placeholder?.isEmpty)! {
            placeholder = "请输入"
        }
        attributedPlaceholder = NSAttributedString(string: placeholder!, attributes: [NSForegroundColorAttributeName:UIColor.textPlaceholderColor()])
        textColor = UIColor.textInputEndColor()
    }
}

