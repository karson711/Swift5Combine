//
//  OperationVC.swift
//  SwiftControls
//
//  Created by anfa on 2020/6/16.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class OperationVC: UIViewController {
    
    //普通队列
    let operationQueue = OperationQueue()
    //main队列
    let queue = OperationQueue.main

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Operation的使用"
        
        self.view.backgroundColor = UIColor.white
    }
    
    
    // MARK:- 设置OperationQueue
    func setOperationQueue(){
          //并发数
         operationQueue.maxConcurrentOperationCount = 2
    }
    
    // MARK:- 设置Operation
    func setOperation(op:Operation){
        //优先级
        op.queuePriority = .high
    }
    
    // MARK:- Operation使用方式一
    func operationUseOne(){
        operationQueue.addOperation {
            Thread.sleep(forTimeInterval: 2)
            print("\(Thread.current)执行任务一")
        }
        
        operationQueue.addOperation {
            Thread.sleep(forTimeInterval: 2)
            print("\(Thread.current)执行任务二")
        }
        
        operationQueue.addOperation {
            Thread.sleep(forTimeInterval: 2)
            print("\(Thread.current)执行任务三")
        }
        
    }
    
    // MARK:- Operation使用方式二
    func operationUseTwo(){
        let operation1 = BlockOperation {
             print("\(Thread.current)执行任务一")
             Thread.sleep(forTimeInterval: 5)
        }
        
        let operation2 = BlockOperation {
             print("\(Thread.current)执行任务二")
             Thread.sleep(forTimeInterval: 5)
        }
        
        let operation3 = BlockOperation {
             print("\(Thread.current)执行任务三")
             Thread.sleep(forTimeInterval: 5)
        }
        
        let operation4 = BlockOperation {
             print("\(Thread.current)执行任务四")
             Thread.sleep(forTimeInterval: 5)
        }
        
        let operation5 = BlockOperation {
             print("\(Thread.current)执行任务五")
             Thread.sleep(forTimeInterval: 5)
        }
        
        let operation6 = BlockOperation {
             print("\(Thread.current)执行任务六")
             Thread.sleep(forTimeInterval: 5)
        }
        
        operationQueue.addOperations([operation1,operation2,operation3,operation4,operation5,operation6], waitUntilFinished: false)
        
        print("\(Thread.current)执行其他任务")
    }

    // MARK:- Operation开始
    @IBAction func start(_ sender: Any) {
        operationQueue.maxConcurrentOperationCount = 2
        
        //能看到演示效果：1.设置并发数 2.waitUntilFinished: false
        operationUseTwo()
    }
    
    // MARK:- Operation挂起
    //OperationQueue中的那些还没有被CPU调度的线程才会暂停执行，那些已经被CPU调度的程序不会暂停
    
    @IBAction func suspend(_ sender: Any) {
        if (self.operationQueue.operationCount != 0 && self.operationQueue.isSuspended == false) {
            self.operationQueue.isSuspended = true
        }
       
    }
    
    // MARK:- Operation重启
    //OperationQueue中的那些还没有被CPU调度的线程可以继续执行
    @IBAction func resume(_ sender: Any){
        if (self.operationQueue.operationCount != 0 && self.operationQueue.isSuspended == true) {
            self.operationQueue.isSuspended = false
        }
        
    }
    
    // MARK:- Operation取消
    //OperationQueue中的那些还没有被CPU调度的线程才会取消执行，无法再次让它们运行
    @IBAction func cancel(_ sender: Any){
        self.operationQueue.cancelAllOperations()
    }
    
    func dependent(){
        let operation1 = BlockOperation {
            print("\(Thread.current)执行任务一")
            Thread.sleep(forTimeInterval: 2)
        }
        
        operation1.completionBlock = {
            print("\(Thread.current)完成任务一")
        }
        
        let operation2 = BlockOperation {
            print("\(Thread.current)执行任务二")
            Thread.sleep(forTimeInterval: 3)
        }
        
        operation2.completionBlock = {
            print("\(Thread.current)完成任务二")
        }
        
        //operation2在operation1执行之后执行(通过打印可以看出，并不是等completionBlock完成之后才执行，而是BlockOperation体执行完就开始执行)
        operation2.addDependency(operation1)
        
        let operation3 = BlockOperation {
            print("\(Thread.current)执行任务三")
            Thread.sleep(forTimeInterval: 2)
        }
        
        operation3.completionBlock = {
            print("\(Thread.current)完成任务三")
        }
        operation3.addDependency(operation2)
        
        operationQueue.addOperations([operation1,operation2,operation3], waitUntilFinished: false)
        
        print("\(Thread.current)执行其他任务")
    }
       
    //串行队列与依赖之间的区别？
    //1、队列依旧是并发的，并不是串行的
    //2、执行结果看似一样其实不一样，串行队列是将任务添加到队列以后串行执行，而依赖关系是并行执行的
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dependent()
    }

}
