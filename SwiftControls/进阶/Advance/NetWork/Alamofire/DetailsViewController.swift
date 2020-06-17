//
//  DetailsViewController.swift
//  SwiftControls
//
//  Created by anfa on 2020/6/12.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController {
    
    var selectedItem:DataItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = selectedItem?.title
        
        let wkWebView = WKWebView(frame: self.view.frame)
        
        let request = URLRequest(url: URL(string: (selectedItem?.url)!)!)
        
        wkWebView.load(request)
        
        self.view.addSubview(wkWebView)
        
    }
    


}
