//
//  AdvanceViewController.swift
//  SwiftControls
//
//  Created by anfa on 2020/5/15.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class AdvanceViewController: UIViewController {

    var tableView:UITableView!
    
    var array = [
        ["UIView动画入门","关键帧动画","转场动画","动画案例"],
        ["触摸和手势"],
        ["AudioToolbox的使用","AVAudioPlayer播放音频","AVAudioRecorder录音","AVPlayer/AVPlayerViewController播放音视频"],
        ["数据存储"],
        ["系统请求","封装方法使用","Alamofire基本使用","Alamofire使用案例","网络信息获取"],
        ["Thread的使用","GCD的使用","Operation的使用","线程间通讯","多线程-互斥锁"],
        ["定位"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "进阶"

        // Do any additional setup after loading the view.
        tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }

}

extension AdvanceViewController:UITableViewDelegate,UITableViewDataSource{
    // 多少个分区（默认分区为一个）
    func numberOfSections(in tableView: UITableView) -> Int{
        return array.count
    }
    // 每个分区行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return array[section].count
    }
    // 行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    // header高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    // footer高度
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    // header标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let titleArr = ["动画","触摸与手势","多媒体","数据存储","网络","多线程","定位与地图"]
        return titleArr[section]
    }
    // header视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    // footer视图
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CellIdentifier")
        let content = array[indexPath.section][indexPath.row]
        cell.textLabel?.text = "\(indexPath.row+1).\(content)"
        return cell
    }
    // cell点击事件处理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        var vc = UIViewController()
        if indexPath.section == 0 {
            //动画
            if indexPath.row == 0{
                vc = BasicAnmiationUseVC()
            }else if indexPath.row == 1{
                vc = KeyFrameAnimationVC()
            }else if indexPath.row == 2{
                vc = TransitionAnimationVC()
            }else if indexPath.row == 3{
                vc = AnimationDemoVC()
            }
        }else if indexPath.section == 1{
            //触摸与手势
            if indexPath.row == 0{
                vc = TouchAndGestureVC()
            }
        }else if indexPath.section == 2{
            //多媒体
            if indexPath.row == 0{
                vc = AudioToolboxVC()
            }else if indexPath.row == 1{
                vc = AVAudioPlayerVC()
            }else if indexPath.row == 2{
                vc = AvAudioRecorderVC()
            }else if indexPath.row == 3{
                vc = AVPlayerVC()
            }
        }else if indexPath.section == 3{
            //数据存储
            if indexPath.row == 0{
                vc = DataStoreViewController()
            }
        }else if indexPath.section == 4{
            //网络
            if indexPath.row == 0{
                vc = SystemRequestVC()
            }else if indexPath.row == 1{
                vc = ToolUseViewController()
            }else if indexPath.row == 2{
                vc = AlamofireBasicUseVC()
            }else if indexPath.row == 3{
                vc = AlamofireViewController()
            }else if indexPath.row == 4{
                vc = NetworkInfoViewController()
            }
        }else if indexPath.section == 5{
            //多线程
            if indexPath.row == 0{
                vc = MultithreadingVC()
            }else if indexPath.row == 1{
                vc = GCDViewController()
            }else if indexPath.row == 2{
                vc = OperationVC()
            }else if indexPath.row == 3{
                vc = ThreadCommunicationVC()
            }else if indexPath.row == 4{
                vc = MutexViewController()
            }
        }else if indexPath.section == 6{
            //定位与地图
            if indexPath.row == 0{
                vc = LocationVC()
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
       
    }
}
