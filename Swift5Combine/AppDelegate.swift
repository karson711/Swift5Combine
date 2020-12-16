//
//  AppDelegate.swift
//  Swift5Combine
//
//  Created by bonade on 2020/12/16.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let screen = UIScreen.main.bounds        //获得设备尺寸
        window = UIWindow.init(frame: screen) //给“输出窗口“实例化并设置frame
        window?.rootViewController = JKTabBarController()//将“输出窗口”的根视图设置为导航栏
        window?.makeKeyAndVisible()       //  设置"输出窗口可见"
        return true
    }

    


}

