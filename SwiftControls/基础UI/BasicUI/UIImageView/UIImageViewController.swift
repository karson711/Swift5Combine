//
//  UIImageViewController.swift
//  SwiftControls
//
//  Created by jikun on 2020/5/15.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class UIImageViewController: UIViewController {
    
    var imageArray:[UIImage] = [UIImage]()

    @IBOutlet weak var tomcat: UIImageView!
    
    let imageCountArr = [79,24,11,23,39,55,29,29]
    
    let imageNameArr = ["drink","angry","cymbal","pie","eat","scratch","footLeft","footRight"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /*
         pie - 23      派
         footLeft - 29
         stomach - 31   胃
         knockout - 80
         footRight - 29
         eat - 39
         scratch - 55  刮伤
         angry - 24
         cymbal - 11  铙钹
         drink - 79
         */
        
        
        self.navigationItem.title = "Tom猫示例"
    }

    @IBAction func funcationBtnAction(_ sender: UIButton) {
        
        self.imageArray.removeAll()
                
        var imgName = ""
        
        for index in 0...self.imageCountArr[sender.tag - 100] {
            
            if index < 10 {
                imgName = "\(self.imageNameArr[sender.tag - 100])_0\(index).jpg"
            }else{
                imgName = "\(self.imageNameArr[sender.tag - 100])_\(index).jpg"
            }
            
            let image = UIImage.init(named: imgName)
            
            imageArray.append(image!)
            
        }
        
        //图片动画播放
        self.tomcat.animationImages = imageArray
        //动画时间
        self.tomcat.animationDuration = 2.0
        //动画次数
        self.tomcat.animationRepeatCount = 1
        //开始动画
        self.tomcat.startAnimating()
        
        
    }
    
}
