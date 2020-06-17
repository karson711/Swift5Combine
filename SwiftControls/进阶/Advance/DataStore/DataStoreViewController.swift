//
//  DataStoreViewController.swift
//  SwiftControls
//
//  Created by anfa on 2020/5/19.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class DataStoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "数据存储"
        
//        self.setDataStorePath()
        
//        self.readWriteFile()
        
        self.saveData()
        
        self.getData()
        
    }

    //数据存储目录
    func setDataStorePath() {
        print(Bundle.main.bundlePath)
        
        print(Bundle.main.path(forResource: "Info", ofType: "plist")!)
        
        //沙盒的入口
        print(NSHomeDirectory())
        //tmp文件夹
        print(NSTemporaryDirectory())
        
        //Documents文件夹
        let documentDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        print(documentDir!)
        
        //Library文件夹
        let libraryDir = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first
        print(libraryDir!)
        
    }
    
    func readWriteFile() {
        let path = Bundle.main.path(forResource: "cityData", ofType: "plist")
        
        if let path = path {
            
            let root = NSDictionary(contentsOfFile: path)
            print(root!.allKeys)
            
            print(root!.allKeys[31])
            
            let cities = root![root!.allKeys[31]] as! NSArray
            print(cities)
            
            let documentDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
            print(documentDir!)
            
            let filePath = documentDir! + "/Area.plist"
            
            cities.write(toFile: filePath, atomically: true)
            
        }
    }
    
    //UserDefaults存取
    func saveData() {
        UserDefaults.standard.set(1.0, forKey: "localVersion")
        
        UserDefaults.standard.synchronize()
    }
    
    func getData() {
         print("结果为：\(UserDefaults.standard.double(forKey: "localVersion"))")
    }

}
