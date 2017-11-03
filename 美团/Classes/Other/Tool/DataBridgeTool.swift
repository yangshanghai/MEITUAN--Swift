//
//  DataBridgeTool.swift
//  美团
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

// 关键点: 这个类, 是负责数据模型之间的桥接(转换成真正需要的数据模型)

class DataBridgeTool: NSObject {

    // 把分类数据模型, 转换成为左右数据模型
    // 主要思想, 就是遍历需要转换的数据模型数据, 
    // 在内部, 一个一个给目标数据模型, 进行赋值, 并返回
    class func changeCategoryModel(categoryMs: [CategoryModel]) -> [LeftRightModel] {
        
        // 1. 存放所有目标数据模型
        var resultMs = [LeftRightModel]()
        
        // 2. 遍历所有需要转换的数据模型
        for cateM in categoryMs {
            
            // 赋值菜单的主要字段
            // 3. 创建一个目标数据模型, 添加到目标数据模型数组
            let lrM = LeftRightModel()
            resultMs.append(lrM)
            
            // 4. 进行赋值
            if cateM.icon != nil {
                lrM.image = UIImage(named: cateM.icon!)
            }
            
            lrM.title = cateM.name
            
            // 子菜单
            // 赋值子菜单
            guard let subCategory = cateM.subcategories else { continue }
            var subMs = [LeftRightModel]()
            for str in subCategory {
                let sublrM = LeftRightModel()
                sublrM.title = str
                subMs.append(sublrM)
            }
            
            
            lrM.subMenues = subMs
            
            
        }
        
        return resultMs
        
    }
    
    // 将地址模型数组, 改成左右模型数组, 具体思路如上
    class func changeAddressModel(addressMs: [AddressModel]) -> [LeftRightModel] {
        
        var resultLRMs = [LeftRightModel]()
        for adddressM in addressMs {
            
            let lrM = LeftRightModel()
            resultLRMs.append(lrM)
//            lrM.image = 
            lrM.title = adddressM.name
            
            // 解析子模型
            guard let subMs = adddressM.subregions else {             
                continue
            }
            
            
            var subLRMs = [LeftRightModel]()
            for subM in subMs {
                let lrM = LeftRightModel()
                lrM.title = subM
                subLRMs.append(lrM)
                
            }
            
             lrM.subMenues = subLRMs
            
        }
        
        return resultLRMs
        
    }
     // 将排序模型数组, 改成左右模型数组, 具体思路如上
    class func changeSortModel(sortMs: [SortModel]) -> [LeftRightModel] {
        
        var lrMs = [LeftRightModel]()
        for sortM in sortMs {
            
            let leftRightModel = LeftRightModel()
            leftRightModel.title = sortM.label
            lrMs.append(leftRightModel)
        }
        
        return lrMs
    }
}
