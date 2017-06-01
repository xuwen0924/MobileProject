//
//  UIFont+Extension.swift
//  MobileProject
//
//  Created by xuwen on 16/6/12.
//  Copyright © 2016年 xuwen. All rights reserved.
//

extension UIFont {
    public class func kFontWithSize(_ size: CGFloat) -> UIFont{
        return UIFont.systemFont(ofSize: size/2)
    }
    
    //MARK: --正文内容字体
    /*!
     正文内容字体--
     
     - returns: <#return value description#>
     */
    public class func fontContent() -> UIFont {
        return kFontWithSize(28)
    }
    
    //MARK: --标题字体
    /*!
     标题字体
     
     - returns: <#return value description#>
     */
    public class func fontTitle() -> UIFont {
        return kFontWithSize(34)
    }
    
    //MARK: --提示信息、三级按钮
    /*!
     提示信息、三级按钮
     
     - returns: <#return value description#>
     */
    public class func fontPrompt() -> UIFont {
        return kFontWithSize(24)
    }
    
    //MARK: --次要内容(时间、标签)
    /*!
     次要内容(时间、标签) 24px
     
     - returns: <#return value description#>
     */
    public class func fontAssistant() -> UIFont {
        return kFontWithSize(20)
    }
    
    //MARK: --大字体 72
    
    /// 大字体 72
    ///
    /// - Returns: <#return value description#>
    public class func fontBig() -> UIFont {
        return kFontWithSize(72)
    }
}

