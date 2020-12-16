//
//  AudioToolboxVC.swift
//  SwiftControls
//
//  Created by jikun on 2020/5/16.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit
import AVKit


class AudioToolboxVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "AudioToolbox使用"
        
    }

    @IBAction func palySystemVoice(_ sender: Any) {
        
        //建立的SystemSoundID对象
        var soundID:SystemSoundID = 0
        //获取声音地址
        let path = Bundle.main.path(forResource: "wangzha", ofType: "mp3")
        //地址转换
        let baseURL = NSURL(fileURLWithPath: path!)
        //赋值
        AudioServicesCreateSystemSoundID(baseURL, &soundID)
        //播放声音
        AudioServicesPlaySystemSound(soundID)
        
    }
    
    @IBAction func playAlertVoice(_ sender: Any) {
        
        //建立的SystemSoundID对象
        var soundID:SystemSoundID = 0
        //获取声音地址
        let path = Bundle.main.path(forResource: "wangzha", ofType: "mp3")
        //地址转换
        let baseURL = NSURL(fileURLWithPath: path!)
        //赋值
        AudioServicesCreateSystemSoundID(baseURL, &soundID)
        //提醒（同上面唯一的一个区别）
        AudioServicesPlayAlertSound(soundID)
        
    }
    
    @IBAction func playVibration(_ sender: Any) {
        //建立的SystemSoundID对象
        let soundID = SystemSoundID(kSystemSoundID_Vibrate)
        //振动
        AudioServicesPlaySystemSound(soundID)
    }
    

}
