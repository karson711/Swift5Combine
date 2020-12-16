//
//  JKAlertController.swift
//  SwiftControls
//
//  Created by jikun on 2020/5/15.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class JKAlertController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //标题字体样式
        let titleFont = UIFont.systemFont(ofSize: 18)
        let titleAttribute = NSMutableAttributedString(string: self.title!)
        titleAttribute.addAttributes(
            [NSAttributedString.Key.font:titleFont,NSAttributedString.Key.foregroundColor:UIColor.systemYellow], range: NSMakeRange(0, (self.title?.count)!))
        self.setValue(titleAttribute, forKey: "attributedTitle")
        
        
        //消息内容样式
        let messageFontDescriptor = UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.family:"Arial"])
        let messageFont = UIFont(descriptor: messageFontDescriptor, size: 15.0)
        let messageAttribute = NSMutableAttributedString(string: self.message!)
        messageAttribute.addAttributes([NSAttributedString.Key.font:messageFont,NSAttributedString.Key.foregroundColor:UIColor.blue], range: NSMakeRange(0, (self.message?.count)!))
        self.setValue(messageAttribute, forKey: "attributedMessage")
    }
    
    override func addAction(_ action: UIAlertAction) {
        super.addAction(action)
        
        //1.通过tintColor统一修改按钮颜色
//        self.view.tintColor = UIColor.orange
        
        //2.根据不同按钮设置
        //设置确定按钮图标和样式
        if action.style == .default {
            
            let iconImage = UIImage(named: "ok")
            
            action.setValue(iconImage, forKey: "image")
            
            action.setValue(UIColor.green, forKey: "titleTextColor")
            
        }else if action.style == .cancel {
            
            let iconImage = UIImage(named: "error")
            
            action.setValue(iconImage, forKey: "image")
            
            action.setValue(UIColor.red, forKey: "titleTextColor")
            
        }else if action.style == .destructive {
            
            let iconImage = UIImage(named: "error")
            
            action.setValue(iconImage, forKey: "image")
            
            action.setValue(UIColor.purple, forKey: "titleTextColor")
            
        }
        
    }
    

}
