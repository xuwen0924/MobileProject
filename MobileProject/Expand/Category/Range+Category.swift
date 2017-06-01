//
//  Range+Category.swift
//  HomePlus
//
//  Created by xuwen on 2017/5/11.
//  Copyright © 2017年 worldunion. All rights reserved.
//

import Foundation
//扩展NSRange，添加转换成Range的方法
extension NSRange {
    func toRange(string: String) -> Range<String.Index> {
        let startIndex = string.index(string.startIndex, offsetBy: self.location)
        let endIndex = string.index(startIndex, offsetBy: self.length)
        return startIndex..<endIndex
    }
}
