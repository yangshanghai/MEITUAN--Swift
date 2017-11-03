//
//  CategoryModel.swift
//  美团
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

// 分类模型(里面的字段名称, 跟plist文件保持一致)
class CategoryModel: NSObject {

    
    var highlighted_icon: String?
    
    var icon: String?
    
    var name: String?
    
    var small_highlighted_icon: String?
    
    var small_icon: String?
    
    var map_icon: String?
    
    var subcategories: [String]?
    
    override init() {
        
    }
    
    init(dic: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
