//
//  SortModel.swift
//  美团
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

// 排序数据模型, (跟plist文件内容保持一致)
class SortModel: NSObject {

    var label: String?
    
    var value: Int = -1
    
    override init() {
        
    }
    
    init(dic: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
