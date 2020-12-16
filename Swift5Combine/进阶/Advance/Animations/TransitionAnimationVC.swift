//
//  TransitionAnimationVC.swift
//  SwiftControls
//
//  Created by jikun on 2020/5/15.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class TransitionAnimationVC: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    
    var orangeView:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "转场动画"
        
        
        orangeView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        orangeView.backgroundColor = UIColor.orange
        
        orangeView.center = self.view.center
        
        let btn = UIButton(type: .contactAdd)
        
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        
        orangeView.addSubview(btn)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //方式一
        UIView.transition(with: self.view, duration: 2.0, options: .transitionCurlUp, animations: {

            self.redView.isHidden = true
            self.view.addSubview(self.orangeView)

        }, completion: nil)
        
        /**
        //方式二
        self.redView.addSubview(self.orangeView)
        
        UIView.transition(from: self.redView, to: self.orangeView, duration: 2.0, options: .transitionFlipFromRight, completion: nil)
         */
        
    }

    @objc func btnClick() {
        UIView.transition(with: self.view, duration: 2.0, options: .transitionCurlDown, animations: {
            
            self.redView.isHidden = false
            
            self.orangeView.removeFromSuperview()
            
        }, completion: nil)
    }

}
