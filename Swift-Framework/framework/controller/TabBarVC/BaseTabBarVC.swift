//
//  BaseTabBarVC.swift
//  Swift-Framework
//
//  Created by wujun on 2019/4/27.
//  Copyright © 2019 wujun. All rights reserved.
//

import UIKit

class BaseTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setChildViewController(HomeVC(), title: "首页", imageName: "home-2")
        setChildViewController(ShoppingMallVC(), title: "购物中心", imageName: "shopping-bag")
        setChildViewController(ShoppingCarVC(), title: "购物车", imageName: "shopping-cart")
        setChildViewController(MineVC(), title: "我的", imageName: "user")
    }
    
    
    private func setChildViewController(_ childController: UIViewController, title: String, imageName: String) {
        //设置 tabbar 文字和图片
        childController.title = title
//        childController.tabBarItem.image = UIImage(named: imageName + "nor")
//        childController.tabBarItem.selectedImage = UIImage(named: imageName + "pressed")
        childController.tabBarItem.image = UIImage.init(named: imageName)
        childController.tabBarItem.selectedImage = UIImage.init(named: imageName)
        //添加导航控制器为 childController 的子控制器
        self.addChild(childController)
        
    }
    

}
