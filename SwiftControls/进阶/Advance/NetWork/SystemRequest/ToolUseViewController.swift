//
//  ToolUseViewController.swift
//  SwiftControls
//
//  Created by anfa on 2020/6/13.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class ToolUseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "系统请求方法封装"
        
        getTest()
    }
    

    func getTest(){
        
        let networkTools = NetworkTools()
        
        let urlString = "http://v.juhe.cn/toutiao/index?type=top&key=d1287290b45a69656de361382bc56dcd"
        
        let url = URL(string: urlString)
        
        networkTools.get(url!, parameters: nil, success: { (responseObject: Any?) in
            
             print("post responseObject =\(responseObject!) ")
            
        }) { (error: Error?) -> Void in
            
        }
    }
    
    func postTest(){
        
        let networkTools = NetworkTools()
        
        let urlString = "http://v.juhe.cn/toutiao/index"
        
        let url = URL(string: urlString)
        
        let params = "type=top&key=d1287290b45a69656de361382bc56dcd"
        
        networkTools.post(url!, parameters: params, success: { (responseObject: Any?) in
            
            print("post responseObject =\(responseObject!) ")
            
        }) { (error: Error?) -> Void in
            
        }
    }
    
    
    func postDictionaryTest(){
        
        let networkTools = NetworkTools()
        
        let urlString = "http://v.juhe.cn/toutiao/index?type=top&key=d1287290b45a69656de361382bc56dcd"
        
        let url = URL(string: urlString)
        
        let params = ["type": "top", "key": "d1287290b45a69656de361382bc56dcd"]
        
        networkTools.post(url!, parameters: params, success: { (responseObject: Any?) in
            
            print("post Dictionary responseObject =\(responseObject!) ")
            
        }) { (error: Error?) -> Void in
            
        }
    }
}
