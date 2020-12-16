//
//  MutexViewController.swift
//  SwiftControls
//
//  Created by jikun on 2020/6/17.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class MutexViewController: UIViewController {

    var count:NSInteger = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "互斥锁"
        
        self.view.backgroundColor = UIColor.white
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let thread1 = Thread(target: self, selector: #selector(self.buyTicker), object: nil)
        thread1.name = "窗口1"
        thread1.start()
        
        let thread2 = Thread(target: self, selector: #selector(self.buyTicker), object: nil)
        thread2.name = "窗口2"
        thread2.start()
        
        let thread3 = Thread(target: self, selector: #selector(self.buyTicker), object: nil)
        thread3.name = "窗口3"
        thread3.start()
        
    }
    
    //对于临界资源 多线程访问往往会出现问题 加锁可以解决 (互斥锁)
    
    //加锁的结果：每次只有一个线程可以访问临界资源
    //加锁是一个标志，当该资源没有线程访问的时候，🔒标志为0，当第一个线程来的时候，🔒的标志为1，第一个线程开始访问临界资源
    //如果此时有其他线程来访问该临界资源，先要看看🔒是不是为0，如果是1，则阻塞自己，等待上一个线程访问结束。
    //第一个线程访问结束以后，🔒的标志为0，这时候通知那些准备访问该资源的线程可以来访问了，这时候按照顺序（CPU调度）来继续访问
    @objc fileprivate func buyTicker(){
        while true {
            
            //休眠1秒
            Thread.sleep(forTimeInterval: 1)
            
            if count <= 0 {
                print("票卖完了")
                break
            }
            
            //互斥锁开始
            objc_sync_enter(self)
            
            count = count - 1
            
            print("\(Thread.current)卖出去一张，还剩\(count)张票")

            //互斥锁结束
            objc_sync_exit(self)
        }
    }

}
