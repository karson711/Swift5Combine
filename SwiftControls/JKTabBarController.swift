//
//  JKTabBarController.swift
//  SwiftBasicDemo
//
//  Created by jikun on 2020/5/14.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class JKTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildVC(childVC: ViewController(), title: "基础UI", image: "gongzuo")
        addChildVC(childVC: AdvanceViewController(), title: "进阶", image: "kanban")
        addChildVC(childVC: OtherViewController(), title: "其他", image: "wo")
    }

    func addChildVC(childVC:UIViewController,title:String,image:String) -> Void {
        childVC.title = title
        
        var img = UIImage(named: image)
        img = img?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        var selectedImg = UIImage(named: image + "_selected")
        selectedImg = selectedImg?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        childVC.tabBarItem.image = img
        childVC.tabBarItem.selectedImage = selectedImg
        let nav = UINavigationController(rootViewController: childVC)
        addChild(nav)
    }

}
