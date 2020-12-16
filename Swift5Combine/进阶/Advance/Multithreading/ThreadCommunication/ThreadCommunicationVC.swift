//
//  ThreadCommunicationVC.swift
//  SwiftControls
//
//  Created by jikun on 2020/6/16.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class ThreadCommunicationVC: UIViewController {
    
    @IBOutlet weak var infoLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "线程间通讯"
        
        self.view.backgroundColor = UIColor.white
        
    }

    // MARK:- Thread模式
    func threadMode(){
        let thread = Thread {
            print("\(Thread.current)执行任务")
            Thread.sleep(forTimeInterval: 2)
            
            self.perform(#selector(self.updateUI), on: Thread.main, with: nil, waitUntilDone: false)
        }
        thread.start()
    }
    
    @objc fileprivate func updateUI(){
        self.infoLb.text = "Thread方案更新UI"
    }
    
    // MARK:- GCD模式
    func gcdMode(){
        DispatchQueue.global().async {
            print("\(Thread.current)执行任务")
            Thread.sleep(forTimeInterval: 2)
            
            DispatchQueue.main.async {
                self.infoLb.text = "GCD方式更新UI"
            }
        }
    }
    
    
    // MARK:- Operation模式
    func operationMode(){
        OperationQueue().addOperation {
            print("\(Thread.current)执行任务")
            Thread.sleep(forTimeInterval: 2)
            
            OperationQueue.main.addOperation {
                self.infoLb.text = "Operation方式更新UI"
            }
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //threadMode()
        gcdMode()
        //operationMode()
    }
    
}
