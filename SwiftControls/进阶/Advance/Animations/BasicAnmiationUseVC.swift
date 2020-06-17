//
//  BasicAnmiationUseVC.swift
//  SwiftControls
//
//  Created by anfa on 2020/5/15.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class BasicAnmiationUseVC: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var pinWheel: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "UIView动画入门"
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //frame、bounds、center、backgroundColor、alpha、transform
        
        /*
         UIView.animate(withDuration: 2.0) {
            self.redView.frame = CGRect(x: 100, y: 500, width: 55, height: 200)
             
             self.redView.center = self.view.center
             
             self.redView.backgroundColor = UIColor.blue
             
             self.redView.alpha = 0.5
             
             
             self.redView.transform = CGAffineTransform.init(translationX: 100, y: 100)
            
             self.redView.transform = CGAffineTransform.init(scaleX: 0.5, y: 1.5)
             
             self.pinWheel.transform = CGAffineTransform.init(rotationAngle: CGFloat(Float.pi))
        }
        */
        
        /*带completion
         UIView.animate(withDuration: 3.0, animations: {
             self.pinWheel.transform = CGAffineTransform.init(rotationAngle: CGFloat(Float.pi))
         }) { (isFinshed) in
             self.pinWheel.isHidden = true
         }
         */
        
        /*//带延迟与动画选项
        UIView.animate(withDuration: 4.0, delay: 1.0, options: .curveEaseOut, animations: {
            self.redView.frame = CGRect(x: 100, y: 500, width: 55, height: 200)
            
        }) { (isFinshed) in
            
        }
        */
        
        //弹簧动画
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.redView.center = self.view.center
            
        }, completion: nil)
        
    }
}
