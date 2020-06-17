//
//  UIAlertViewController.swift
//  SwiftControls
//
//  Created by anfa on 2020/5/15.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class UIAlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "UIAlertController使用"
    }


    @IBAction func alertAction(_ sender: UIButton) {
        let alertVC = UIAlertController(title: "温馨提示", message: "天气转凉，大家注意保暖，小心感冒", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            print("点击了OK")
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
            print("点击了Cancel")
        }
        
        alertVC.addAction(ok)
        alertVC.addAction(cancel)
        
        self.present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func sheetAction(_ sender: UIButton) {
        let sheetVC = UIAlertController(title: "选择头像", message: "请选择合适的方式来处理", preferredStyle: .actionSheet)
        
        let photo = UIAlertAction(title: "相册", style: .default) { (UIAlertAction) in
            print("点击了相册")
        }
        
        let camer = UIAlertAction(title: "相机", style: .destructive) { (UIAlertAction) in
            print("点击了相机")
        }
        
        let cancel = UIAlertAction(title: "取消", style: .cancel) { (UIAlertAction) in
            print("点击了取消")
        }
        
        sheetVC.addAction(photo)
        sheetVC.addAction(camer)
        sheetVC.addAction(cancel)
        
        self.present(sheetVC, animated: true, completion: nil)
    }
    
    @IBAction func customAction(_ sender: UIButton) {
        
        let customVC = JKAlertController(title: "系统提示", message: "天要下雨了~", preferredStyle: .alert)
        
        let photo = UIAlertAction(title: "相册", style: .default) { (UIAlertAction) in
            print("点击了相册")
        }
        
        let camer = UIAlertAction(title: "相机", style: .destructive) { (UIAlertAction) in
            print("点击了相机")
        }
        
        let cancel = UIAlertAction(title: "取消", style: .cancel) { (UIAlertAction) in
            print("点击了取消")
        }
        
        customVC.addAction(photo)
        customVC.addAction(camer)
        customVC.addAction(cancel)
        
        self.present(customVC, animated: true, completion: nil)
        
        
    }
    
}
