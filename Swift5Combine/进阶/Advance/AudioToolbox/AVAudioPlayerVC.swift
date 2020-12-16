//
//  AVAudioPlayerVC.swift
//  SwiftControls
//
//  Created by jikun on 2020/5/16.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit
import AVFoundation

class AVAudioPlayerVC: UIViewController {
    
    //播放器
    var player:AVAudioPlayer?
    
    //定时器
    var timer : Timer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "AVAudioPlayer播放音频"
        
        self.setBackMode()
        
        player = self.getPlayer()
        
        print(player?.duration)
        
    }
    
    func creatTimer() {
        
        timer = Timer(timeInterval: 1, repeats: true, block: { (timer) in
            print(self.player?.currentTime)
        })
        
        RunLoop.current.add(timer!, forMode: .common)
        
    }


    func getPlayer() -> AVAudioPlayer? {
        //    1.初始化AVAudioPlayer对象，此时通常指定本地文件路径。
        //    2.设置播放器属性，例如重复次数、音量大小等。
        //    3.调用play方法播放。
        
        let path = Bundle.main.path(forResource: "ddz.mp3", ofType: nil)
        
        let url = URL(fileURLWithPath: path!)
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            
            //循环次数 0表示不循环
            player.numberOfLoops = 0
            
            //将音频文件加载到缓冲区
            player.prepareToPlay()
            
            //代理
            player.delegate = self
            
            return player
            
        } catch {
            return nil
        }
    }
    
    //后台播放设置
    func setBackMode() {
        
        //在iOS中每个应用都有一个音频会话，这个会话就通过AVAudioSession来表示
        let session = AVAudioSession()
        
        do {
            
            //设置后台播放模式
            try session.setCategory(.playback, mode: .default, options: .allowBluetooth)
            
            //设置完音频会话类型之后需要调用setActive::方法将会话激活才能起作用
            try session.setActive(true, options: .notifyOthersOnDeactivation)
            
        } catch  {
            print(error)
        }
    }
    
    //播放
    @IBAction func start(_ sender: Any) {
        
        player?.play()

        creatTimer()
    }
    
    //暂停
    @IBAction func pause(_ sender: Any) {
        
        player?.pause()
        
        timer?.invalidate()
        
    }
    
    //停止
    @IBAction func stop(_ sender: Any) {
        
        player?.stop()
        
        timer?.invalidate()
    }
    
    
    @IBAction func seekMusic(_ sender: UISlider) {
        
        
        let progress = sender.value
        
        
        player?.currentTime = Double(progress) * (player?.duration)!
        
        
    }

}

extension AVAudioPlayerVC : AVAudioPlayerDelegate {
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        timer?.invalidate()
        
        print("播放完毕")
    }
    
}
