//
//  JKNavigationController.swift
//  SwiftControls
//
//  Created by anfa on 2020/6/18.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class JKNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        
        super.pushViewController(viewController, animated: true)
    }

}
