//
//  ContentVC.swift
//  美团
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

// 用户传递, 内部选中某个数据模型的传递
protocol ContentVCDelegate: NSObjectProtocol {
    
    func contentVCDidLRModel(lrM: LeftRightModel)
    
}


class ContentVC: UIViewController {

    // 代理
    weak var delegate: ContentVCDelegate?
    
    // 负责显示左侧内容
    @IBOutlet weak var leftTableView: UITableView!
    
    // 负责显示右侧内容
    @IBOutlet weak var rightTableView: UITableView!
    
    
    // 数据源 (左侧视图的数据源)
    var leftRightModels: [LeftRightModel] = [LeftRightModel]() {
        didSet {
//            self.leftTableView.reloadData()
            preferredContentSize = CGSize(width: 150, height: 500)
        }
    }
    
    // 数据源(右侧视图的数据源)
    var currentLRM: LeftRightModel = LeftRightModel()
    
   
}


extension ContentVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 根据不同的表格, 确定返回多少行数据
        if tableView == self.leftTableView {
            return leftRightModels.count
        }
        
        if tableView == self.rightTableView {
            
            // 判断当前左侧选中的菜单, 是否有子菜单
            if currentLRM.hasSubModel {
                return currentLRM.subMenues!.count
            }else {
                return 0
            }
  
        }
        
        return 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        // 1. 确定当前现实的数据模型
        let model = (tableView == leftTableView) ? leftRightModels[indexPath.row] : currentLRM.subMenues![indexPath.row]
        
        
        // 2. 根据数据模型的类型, 显示不同的cell 样式
        let cellID = (model.type == .ImageAndTitle) ? "imageAndTitle" : "title"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        }
        
        // 赋值
        cell?.imageView?.image = model.image
        cell?.textLabel?.text = model.title
        
        return cell!
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if tableView == leftTableView {
            // 判断时候有子菜单
            let model = leftRightModels[indexPath.row]
            currentLRM = model
            if model.hasSubModel {
                // 刷新右边表格
                rightTableView.reloadData()
                 preferredContentSize = CGSize(width: 300, height: 500)
            }else {
                
                 preferredContentSize = CGSize(width: 150, height: 500)
                
                delegate?.contentVCDidLRModel(lrM: model)
            }
            
            
        }
        
        // 如果选中右边的表格(代表是最后一级菜单, 直接通过代理, 通知外界)
        if tableView == rightTableView {
            let model = currentLRM.subMenues![indexPath.row]
            
            delegate?.contentVCDidLRModel(lrM: model)
        }
        
    }
    
    
    
    
}
