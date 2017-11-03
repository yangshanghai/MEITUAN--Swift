//
//  MTMenuView.swift
//  美团
//
//  Created by 杨上海 on 2017/3/27.
//  Copyright © 2017年 tcl. All rights reserved.
//

import UIKit

// 自定义的菜单视图(导航栏上面加的 菜单视图)
class MTMenuView: UIView {

    // 负责事件传递
    @IBOutlet weak var clickBtn: UIButton!
    
    // 显示的图标
    @IBOutlet weak var iconImageView: UIImageView!
    
    // 显示的标题
    @IBOutlet weak var titleLabel: UILabel!
    
    // 显示的子标题
    @IBOutlet weak var subTtileLabel: UILabel!
    
    
    // 应该, 在这里, 写一个数据模型, 封装里面的子控件数据
//    var data: AnyObject {
//        didSet {
//            
//            
//        }
//    }
    

    // 提供给外界赋值的数据源
    var image: UIImage? {
        didSet {
            if image != nil {
                iconImageView.image = image
            }
            
        }
    }
    // 提供给外界赋值的数据源
    var subTitle: String? {
        didSet {
            subTtileLabel.text = subTitle
        }
    }
    
    
    // 转换事件响应者
    func addTarget(target: AnyObject?, action: Selector) {
        clickBtn.addTarget(target, action: action, for: UIControlEvents.touchDown)
    }
    
    // 提供快捷创建菜单的方法
    class func menueView(icon: UIImage?, title: String, subTitle: String) -> MTMenuView {
        let view = Bundle.main.loadNibNamed("MTMenuView", owner: nil, options: nil)?.first as? MTMenuView
        
        view?.iconImageView.image = icon
        view?.titleLabel.text = title
        view?.subTtileLabel.text = subTitle
        
        return view!
    }
    
}
