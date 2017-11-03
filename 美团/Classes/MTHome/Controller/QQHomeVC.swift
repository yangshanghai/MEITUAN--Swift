//
//  QQHomeVC.swift
//  美团
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

// 首页控制器
class QQHomeVC: UIViewController {

    
    // 记录当前点击的菜单视图(用作修改)
    var currentMenue: MTMenuView?
    
    // 记录当前弹出的popover
    var currentPopover: UIPopoverController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        navigationItem.leftBarButtonItem
        
        
        // 0. 设置导航栏, 背景图片
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "bg_navigationBar_normal"), for: UIBarMetrics.default)
        
        // 1. 设置导航栏, 左侧的logo
        let logoView = UIImageView(image: UIImage(named: "icon_meituan_logo"))
        let logoItem = UIBarButtonItem(customView: logoView)
        
        
        // 2. 设置左侧的三个菜单
        let menue1 = createItem(imageName: "icon_category_-1", title: "美团网", subTitle: "全部分类")
        menue1.menueView.addTarget(target: self, action: #selector(category))
        
        // 第二个菜单
        let menue2 = createItem(imageName: "icon_district_highlighted", title: "广东省", subTitle: "广州市")
        menue2.menueView.addTarget(target: self, action: #selector(address))
        
        // 第三个菜单
        let menue3 = createItem(imageName: "icon_sort_highlighted", title: "排序", subTitle: "最新发布")
        menue3.menueView.addTarget(target: self, action: #selector(sort))
        
        navigationItem.leftBarButtonItems = [logoItem, menue1.item, menue2.item, menue3.item]
        
    }
    
    // 提供快速创建item的方法
    func createItem(imageName: String, title: String, subTitle: String) -> (item: UIBarButtonItem,  menueView: MTMenuView) {
        let menue = MTMenuView.menueView(icon: UIImage(named: imageName), title: title, subTitle: subTitle)
        
        let menueItem = UIBarButtonItem(customView: menue)
        return (menueItem, menue)

    }
    
    
    
}


extension QQHomeVC {
    
    // 点击分类时调用的方法
    @objc func category() -> () {
        print("fenlei")
        
        // 让之前的popover消失
        currentPopover?.dismiss(animated: true)
        
        // 1. 创建pop(设置内容控制器)
        let contentVC = ContentVC()
        contentVC.delegate =  self
        
        // 在这里, 给内容控制器的数据源赋值
        // 因为内容控制器, 需要的数据模型是leftrightModel. 但是, 我们提供的数据模型, 是分类, 或者地址等数据模型, 没法直接使用在控制器内部, 所以, 需要借助一个桥接工具类, 做好"数据模型之间的桥接"
        
        DataTool.getCategoryData { (datas: [CategoryModel]) in
            print(datas)
            
            let lrMs = DataBridgeTool.changeCategoryModel(categoryMs: datas)
            contentVC.leftRightModels = lrMs
        }
        
        
        // 创建需要弹出的popoverController, 同时设置内容控制器
        let popover = UIPopoverController(contentViewController: contentVC)
         currentPopover = popover
        
        // 2. 弹出
        let item = navigationItem.leftBarButtonItems![1]
        currentMenue = item.customView as? MTMenuView
        popover.present(from: item, permittedArrowDirections: UIPopoverArrowDirection.any, animated: true)
        
    }
    
    // 点击地址时调用的方法
    @objc func address() -> () {
        print("地址")
        currentPopover?.dismiss(animated: true)
        // 1. 创建pop(设置内容控制器)
        let contentVC = ContentVC()
         contentVC.delegate =  self
        // 读取数据内容
        // 因为内容控制器, 需要的数据模型是leftrightModel. 但是, 我们提供的数据模型, 是分类, 或者地址等数据模型, 没法直接使用在控制器内部, 所以, 需要借助一个桥接工具类, 做好"数据模型之间的桥接"
        DataTool.getAddressData { (datas: [AddressModel]) in
            print(datas)
            let lrMs = DataBridgeTool.changeAddressModel(addressMs: datas)
            contentVC.leftRightModels = lrMs
        }
        
        
        let popover = UIPopoverController(contentViewController: contentVC)
        currentPopover = popover
        // 2. 弹出
        let item = navigationItem.leftBarButtonItems![2]
        currentMenue = item.customView as? MTMenuView
        popover.present(from: item, permittedArrowDirections: UIPopoverArrowDirection.any, animated: true)
        
    }
    
    // 点击排序时, 调用的方法
    @objc func sort() -> () {
        
        currentPopover?.dismiss(animated: true)
        print("排序")
        // 1. 创建pop(设置内容控制器)
        let contentVC = ContentVC()
         contentVC.delegate =  self
        // 读取数据内容
        // 因为内容控制器, 需要的数据模型是leftrightModel. 但是, 我们提供的数据模型, 是分类, 或者地址等数据模型, 没法直接使用在控制器内部, 所以, 需要借助一个桥接工具类, 做好"数据模型之间的桥接"
        DataTool.getSortData { (datas: [SortModel]) in
            
            let lrMs = DataBridgeTool.changeSortModel(sortMs: datas)
            contentVC.leftRightModels = lrMs
            
        }
        
        let popover = UIPopoverController(contentViewController: contentVC)
         currentPopover = popover
        // 2. 弹出
        let item = navigationItem.leftBarButtonItems![3]
        currentMenue = item.customView as? MTMenuView
        popover.present(from: item, permittedArrowDirections: UIPopoverArrowDirection.any, animated: true)
    }
    
}


extension QQHomeVC: ContentVCDelegate {
    
    
    // 左右控制器选中某个cell, 传递出来的数据模型
    func contentVCDidLRModel(lrM: LeftRightModel) {
        print("xx", lrM.title)
        
        // 1. 获取需要赋值的菜单
        currentMenue?.image = lrM.image
        currentMenue?.subTitle = lrM.title
        
        // 2. 赋值
        
    }
}



