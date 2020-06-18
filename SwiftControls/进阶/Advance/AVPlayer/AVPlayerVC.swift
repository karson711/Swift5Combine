//
//  AVPlayerVC.swift
//  SwiftControls
//
//  Created by jikun on 2020/5/18.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class AVPlayerVC: UIViewController {
    
    var avPlayer: AVPlayer?
    
    var musicArr: Array = [
        "http://up.mcyt.net/?down/46969.mp3",
        "http://up.mcyt.net/?down/46973.mp3",
        "http://up.mcyt.net/?down/46960.mp3",
        "http://up.mcyt.net/?down/46954.mp3"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "AVPlayer/AVPlayerViewController使用"
        
        self.avPlayer = getPlayer()
    }
    
    func getPlayer() -> AVPlayer {
        
        let url = URL(string: musicArr[0])!
        
        let item = AVPlayerItem(url: url)
        
        //获取进度
        let duration : CMTime = item.asset.duration
        //CMTime 转 Second
        let totalTime : Float64 = CMTimeGetSeconds(duration)
        
        print(formatTime(second: totalTime))
        
        let player = AVPlayer(playerItem: item)
        
        //监听播放进度
        player.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, preferredTimescale: 1), queue: DispatchQueue.main) { (CMTime) in
            
            if self.avPlayer!.currentItem?.status == .readyToPlay {
                //更新进度条进度值
                let currentTime = CMTimeGetSeconds(self.avPlayer!.currentTime())
                print(self.formatTime(second: currentTime))
            }
            
        }
        
        return player
    }
    
    //实现00:00格式的播放时间
    func formatTime(second:Float64) -> String {
        
        let total:Int = Int(second)
        //秒
        let s:Int = total % 60
        
        //分
        let m:Int = Int(total / 60)
        var time: String = ""
        
        //判断分
        if m < 10{
            time = "0\(m)"
        }else{
            time = "\(m)"
        }
        
        //判断秒
        //判断分
        if s < 10{
            time += "0\(s)"
        }else{
            time += "\(s)"
        }
        
        return time
    }


    //播放
    @IBAction func play(_ sender: Any) {
        
        self.avPlayer?.play()
    }
    
    //暂停
    @IBAction func pause(_ sender: Any) {
        
        self.avPlayer?.pause()
    }
    
    @IBAction func stop(_ sender: Any) {
        
    }
    
    //切换歌曲
    @IBAction func change(_ sender: Any) {
        
        let index = Int.random(in: 0...musicArr.count-1)
        
        let url = URL(string: self.musicArr[index])
        
        let item = AVPlayerItem(url: url!)
        
        //切换一个item
        self.avPlayer?.replaceCurrentItem(with: item)
        
    }
    
    //播放本地视频
    @IBAction func playLocalVedio(_ sender: Any) {
        
        let filePath = Bundle.main.path(forResource: "yungfan", ofType: "mp4")!
        
        let videoURL = URL(fileURLWithPath: filePath)
        
        //定义一个视频播放器
        let player = AVPlayer(url: videoURL)
        
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = player
        
        self.present(playerViewController, animated: true) {
            
            playerViewController.player!.play()
        }
        
    }
    
    //播放网络视频
    @IBAction func playNetworkVedio(_ sender: Any) {
        
        let videoURL = URL(string: "http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8")
        
        let player = AVPlayer(url: videoURL!)
        
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = player
        
        self.present(playerViewController, animated: true) {
            
            playerViewController.player!.play()
        }
        
    }
    
    

}
