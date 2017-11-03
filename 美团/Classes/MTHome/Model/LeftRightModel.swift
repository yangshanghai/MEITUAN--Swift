//
//  LeftRightModel.swift
//  美团
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

// 左右数据模型的, 数据类型
enum LRType: Int {
    // 图片和标题
    case ImageAndTitle
    // 只有标题
    case Title
}

class LeftRightModel: NSObject {

    // 计算属性, 内部自动判断, 是什么类型, 当然, 也可以通过外界赋值
    var type: LRType {
        
        if image != nil && title != nil {
            return .ImageAndTitle
        }else {
            return .Title
        }
    }
    
    // 记录菜单的图片
    var image: UIImage?
    
    // 菜单的标题
    var title: String?
    
    
    // 是否有子菜单(计算属性)
    var hasSubModel: Bool {
        if subMenues == nil || subMenues!.count == 0 {
            return false
        }
        return true
    }
    
    // 子菜单
    var subMenues: [LeftRightModel]?
    
    
}
