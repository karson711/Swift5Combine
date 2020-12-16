//
//  JKNavigationController.swift
//  SwiftControls
//
//  Created by anfa on 2020/6/18.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class JKNavigationController: UINavigationController,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.black]
        navigationBar.barTintColor = UIColor.white

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get{
            return .default
        }
    }

    override var modalPresentationStyle: UIModalPresentationStyle{
        get{
            return .fullScreen
        }
        
        set{
            
        }
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        
        if self.viewControllers.count > 0 {
            viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
            
            viewController.hidesBottomBarWhenPushed = true
        }

        super.pushViewController(viewController, animated: animated)
    }
    
    

}
