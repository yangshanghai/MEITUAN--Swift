//
//  DataTool.swift
//  美团
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

// 统一提供数据源
class DataTool: NSObject {

    
    // 提供分类的数据源
    class func getCategoryData(result: ([CategoryModel])->()) {
        
        // 1. 获取categories.plist
        guard let path = Bundle.main.path(forResource: "categories.plist", ofType: nil) else {
            result([CategoryModel]())
            return
        }
        
        // 1.1 读取里面的内容
        guard let dicArray = NSArray(contentsOfFile: path) else {
            result([CategoryModel]())
            return
        }

        // 2. 转换成模型
        var models = [CategoryModel]()
        for dic in dicArray {
            // 字典转模型
            let dicResult = dic as! [String: AnyObject]
            let model = CategoryModel(dic: dicResult)
            models.append(model)
            
            // 解析子菜单
            
            
            
        }
        
        
        result(models)
 
    }
    

    // 获取地址数据模型
    class func getAddressData(result: ([AddressModel])->()) {
        
        // 1. 获取categories.plist
        guard let path = Bundle.main.path(forResource: "gz.plist", ofType: nil) else {
            result([AddressModel]())
            return
        }
        
        // 1.1 读取里面的内容
        guard let dicArray = NSArray(contentsOfFile: path) else {
            result([AddressModel]())
            return
        }
        
        // 2. 转换成模型
        var models = [AddressModel]()
        for dic in dicArray {
            
            let dicResult = dic as! [String: AnyObject]
            let model = AddressModel(dic: dicResult)
            models.append(model)
            
            
            // 解析子菜单
            
            
            
        }
        
        print(models)
        result(models)
        
        
        
    }
    
    
    // 提供排序的数据源
    class func getSortData(result: ([SortModel])->()) {
        
        // 1. 获取categories.plist
        guard let path = Bundle.main.path(forResource: "sorts.plist", ofType: nil) else {
            result([SortModel]())
            return
        }
        
        // 1.1 读取里面的内容
        guard let dicArray = NSArray(contentsOfFile: path) else {
            result([SortModel]())
            return
        }
        
        // 2. 转换成模型
        var models = [SortModel]()
        for dic in dicArray {
            
            let dicResult = dic as! [String: AnyObject]
            let model = SortModel(dic: dicResult)
            models.append(model)
            
            
            // 解析子菜单   
        }
        
        result(models)

        
        
    }
    
    
    
}
