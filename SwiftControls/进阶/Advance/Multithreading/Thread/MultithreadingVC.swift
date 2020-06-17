//
//  MultithreadingVC.swift
//  SwiftControls
//
//  Created by anfa on 2020/6/16.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class MultithreadingVC: UIViewController {
    
    var count:NSInteger = 10

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Thread的使用"
        
        print(Thread.main)
        
        self.view.backgroundColor = UIColor.white
        
        //方式三(会直接启动线程，不需要手动调用start方法来启动线程执行任务)
        Thread.detachNewThread {
            Thread.sleep(forTimeInterval: 3)
            self.printCurrentThread()
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //方式一
        let thread1 = Thread(target: self, selector: #selector(runThread), object: nil)
        
        //设置名称
        thread1.name = "thread1"
        
        thread1.start()
        
        
        //方式二
        let thread2 = Thread {
            
            for _ in 0...10 {
                Thread.sleep(forTimeInterval: 1)
                print("线程2报数\(self.count)")
                
                self.count = self.count - 1
                if self.count <= 0 {
                    break
                }
            }
            
            //子线程中调用的方法任然处于子线程
            self.printCurrentThread()
            
            print("线程2执行完毕")
        }
        
        thread2.name = "thread2"
        thread2.start()
 
    }
    
    @objc fileprivate func runThread(){
        for _ in 0...10 {
            
            //休眠1秒
            Thread.sleep(forTimeInterval: 1)
            
            print("线程1报数\(count)")
            
            count = count - 1
            
            if count <= 0 {
                
                break
            }
        }
        
        printCurrentThread()
        
        print("线程1方法执行完毕")
    }
    
    func printCurrentThread(){
        
        print(Thread.current)
        
    }

}
