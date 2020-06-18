//
//  UILabelViewController.swift
//  SwiftControls
//
//  Created by jikun on 2019/9/11.
//  Copyright © 2019 anfa. All rights reserved.
//

import UIKit

class UILabelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "UILabel详解"
        
        //常规创建
        let label = UILabel(frame:CGRect(x:10, y:20, width:ScreenWidth-20, height:ScreenHeight/4))
        label.backgroundColor = UIColor.lightGray
        label.text = "这是一条测试的显示数据,this is a test data,但是还不够长,suo yi yao gei ta jia chang yi dian dian"
        self.view.addSubview(label)
        
        //label属性
        // 颜色
        label.textColor = UIColor.red
        // 字体
        label.font = UIFont.systemFont(ofSize: 24)
        // 对齐方式
        label.textAlignment = NSTextAlignment.center
        // 多行显示
        label.numberOfLines = 3
        // 阴影
        label.shadowColor = UIColor.yellow
        label.shadowOffset = CGSize.init(width:2, height:2)
        
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        // 高亮
        label.isHighlighted = true
        label.highlightedTextColor = UIColor.green
        
        // 富文本
        let attributeString = NSMutableAttributedString.init(string: "这是一条测试富文本的字符串")
        //从文本0开始6个字符字体HelveticaNeue-Bold,16号
        attributeString.addAttribute(NSAttributedString.Key.font, value: UIFont.init(name: "HelveticaNeue-Bold", size: 23) ?? UIFont.boldSystemFont(ofSize: 23), range: NSRange.init(location: 0, length: 6))
        //设置富文本字体颜色
        attributeString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.brown, range: NSMakeRange(0, 6))
        //设置文字背景颜色
        attributeString.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.red, range: NSMakeRange(6, 5))
        label.attributedText = attributeString
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
