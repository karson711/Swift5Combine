//
//  UIButtonViewController.swift
//  SwiftControls
//
//  Created by anfa on 2019/9/11.
//  Copyright © 2019 anfa. All rights reserved.
//

import UIKit

class UIButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "UIButton详解"
        
        
        // 创建一个常规的button
        let button = UIButton(type:.custom)
        button.frame = CGRect(x:ScreenWidth/2-40, y:150, width:120, height:30)
        button.setTitle("FirstBtn", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        //无参数点击事件
        //button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        //带button参数传递
        button.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
        self.view.addSubview(button)
        
        //字体
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        //设置圆角
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5.0
        //设置边框
        button.layer.borderColor = UIColor.purple.cgColor
        button.layer.borderWidth = 1.5
        
        //图片文字按钮
        let button1 = UIButton(frame:CGRect(x:ScreenWidth/2-60, y:250, width:120, height:120))
        self.view.addSubview(button1)
        button1.setTitle("图片按钮", for: .normal)
        button1.setImage(UIImage(named:"cellPhoneImage"), for: .normal)
        button1.backgroundColor = UIColor.red
        // 上左下右 根据自己图片和文字布局自行调整参数设置
        button1.imageEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 50, right: 0)
        button1.titleEdgeInsets = UIEdgeInsets(top: 0, left: -25, bottom: -50, right: 10)
    }

    
    @objc func buttonClick(button:UIButton ){
        button.isSelected = !button.isSelected
        if button.isSelected {
            button.setTitle("Selected", for: .normal)
        }else{
            button.setTitle("NoSelected", for: .normal)
        }
    }


}
