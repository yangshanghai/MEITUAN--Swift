//
//  AddressModel.swift
//  美团
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit
// 地址数据模型(跟plist文件保持一致)
class AddressModel: NSObject {

    
    var name: String?
    
    var subregions: [String]?

    
    override init() {
        
    }
    
    init(dic: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
