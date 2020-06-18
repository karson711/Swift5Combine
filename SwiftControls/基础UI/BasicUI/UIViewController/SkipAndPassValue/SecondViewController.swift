//
//  SecondViewController.swift
//  SwiftControls
//
//  Created by jikun on 2020/6/18.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

typealias Disclosure = (String?)->Void


//定义一个协议
protocol PassValueProtocol {
    func passValue(info:String?)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var passValue: UILabel!
    //方法1：声明一个属性 用来接受传过来的值
    var passedValueStr:String?
    
    //方法2：声明一个闭包类型的属性
    var discloure:Disclosure?
    
    //方法3：在被代理的对象中声明一个属性delegate 遵循协议
    var delegate : PassValueProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "跳转页"
        
        self.view.backgroundColor = UIColor.white
        
        self.passValue.text = passedValueStr
        
    }
    
    @IBAction func pushBackAction(_ sender: Any) {
        
        //方法4：通知传值
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "passValue"), object: nil, userInfo: ["info":self.inputField.text!])
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func modelBackAction(_ sender: Any) {
        
        //闭包反向传值
        discloure?(self.inputField.text)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func protocolBackAction(_ sender: Any) {
        
        self.delegate?.passValue(info: self.inputField.text)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
