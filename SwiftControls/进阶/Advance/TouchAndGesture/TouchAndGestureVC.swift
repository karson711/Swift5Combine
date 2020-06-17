//
//  TouchAndGestureVC.swift
//  SwiftControls
//
//  Created by anfa on 2020/5/15.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class TouchAndGestureVC: UIViewController {
    
     @IBOutlet weak var blueView: UIView!
    
    @IBOutlet weak var pinWheel: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "触摸和手势"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(imgClick))
        
        tap.numberOfTapsRequired = 2
        
        self.pinWheel.isUserInteractionEnabled = true
        
        self.pinWheel.addGestureRecognizer(tap)
        
        self.addGesture()
        
    }
    
    @objc func imgClick(gesture:UIGestureRecognizer){
        
        print("pinWheel clicked")
        
    }
    
    func addGesture() {
        
        let gestureRecongizer = UIPinchGestureRecognizer(target: self, action: #selector(gesture))
        
        //        let gestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(gesture))
                
        //        let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(gesture))

        //        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(gesture))
                
        //        let gestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(gesture))
        //
        //        gestureRecognizer.edges = UIRectEdge.left
                
        //        self.view.addGestureRecognizer(gestureRecognizer)
        
        gestureRecongizer.delegate = self
        
        self.blueView.addGestureRecognizer(gestureRecongizer)
        
    }
    
    @objc func gesture(gestureRecongizer:UIGestureRecognizer){
        print(#function)
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //打印触摸坐标
        print((touches.first?.location(in: self.view)) as Any)
        
        //打印触摸次数
        print((touches.first?.tapCount) as Any)
    }

}

extension TouchAndGestureVC:UIGestureRecognizerDelegate{
    //手势识别器是否解释此次手势
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        
        if gestureRecognizer.state == .possible {
            
            print("手势开始作用")
            
            return true
        }
        
        else if gestureRecognizer.state == .cancelled {
            
            print("手势结束")
            
            return true
        }
        
        return true
    }
}
