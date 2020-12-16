//
//  FristViewController.swift
//  SwiftControls
//
//  Created by jikun on 2020/6/18.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class FristViewController: UIViewController {

    @IBOutlet weak var passBackValue: UILabel!
    
//    //该方法的优先级极高 有了它 其他加载view的方式都失效
//    override func loadView() {
//
//       //不要调用其父类方法
//       print("loadView")
//
//       // 必须在这里给控制器的view赋值
//       self.view = UIView(frame: UIScreen.main.bounds)
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "控制器的跳转和传值"
        
        self.view.backgroundColor = UIColor.white
        
        // 方法3--通知传值：先监听通知 后发送
        NotificationCenter.default.addObserver(self, selector: #selector(handlerNoti), name: NSNotification.Name("passValue"), object: nil)
    }
    
    @objc func handlerNoti(noti:Notification){
        let userInfo = noti.userInfo
        self.passBackValue.text = userInfo!["info"] as? String
    }

    @IBAction func pushBtnAction(_ sender: Any) {
        let secVC = UIStoryboard(name: "SkipAndPassValue", bundle: nil).instantiateViewController(withIdentifier: "second") as! SecondViewController
        
        secVC.delegate = self
        
        self.navigationController?.pushViewController(secVC, animated: true)
    }
    
    @IBAction func storyBoardPushAction(_ sender: Any) {
        
        self.performSegue(withIdentifier: "btnPushSecond", sender: nil)
    }
    
    @IBAction func modelBtnAction(_ sender: Any) {
        
        let secVC = UIStoryboard(name: "SkipAndPassValue", bundle: nil).instantiateViewController(withIdentifier: "second") as! SecondViewController
        
        secVC.discloure = {
            (info:String?) -> Void in
            
            self.passBackValue.text = "Second页面反向传回来的值是:\(info ?? "")"
        }
        self.present(secVC, animated: true, completion: nil)
    }
    
    @IBAction func storyBoardModelAction(_ sender: Any) {
        self.performSegue(withIdentifier: "btnModelSecond", sender: nil)
    }
    
    // MARK: - Navigation

    //self.performSegue以调用就会立马调用这个方法
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "btnModelSecond" {
            //属性传值
            let secVC:SecondViewController = segue.destination as! SecondViewController
            secVC.passedValueStr = "FristVC通过Model方式传值到SecondVC"
            
        }else if segue.identifier == "btnPushSecond" {
            
            let secVC:SecondViewController = segue.destination as! SecondViewController
            secVC.passedValueStr = "FristVC通过Push方式传值到SecondVC"
            
        }
        
    }

}


//遵循协议
extension FristViewController : PassValueProtocol{
    func passValue(info:String?){
        self.passBackValue.text = "协议传值结果:\(info!)"
    }
    
}
