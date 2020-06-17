//
//  RXPreliminaryVC.swift
//  SwiftControls
//
//  Created by anfa on 2020/6/15.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RXPreliminaryVC: UIViewController ,UITextFieldDelegate {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var scrollow: UIScrollView!
    @IBOutlet weak var label: UILabel!
    
    var person:Person!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        button.rx.tap.bind(onNext: { [weak self] in
            print("点了，小鸡炖蘑菇")
            self?.view.backgroundColor = UIColor.orange
        }).disposed(by: DisposeBag())
        
        
    }

    //MARK: 按钮点击
    func setupButton() {
        button.rx.tap.bind(onNext: { [weak self] in
            print("点了，小鸡炖蘑菇")
            self?.view.backgroundColor = UIColor.orange
        }).disposed(by: DisposeBag())
    }
    
    func setupTextField() {
        textField.rx.text.orEmpty.changed.subscribe(onNext: { (text) in
            print("监听到了输入内容:\(text)")
        }).disposed(by: DisposeBag.init())
    }
    
    func setupScrollowView() {
        scrollow.rx.contentOffset.subscribe(onNext: { [weak self] (content) in
            self?.view.backgroundColor = UIColor.init(red: content.y/255.0 * 0.8, green: content.y/255.0 * 0.6, blue: content.y/255.0 * 0.6, alpha: 1)
        }).disposed(by: DisposeBag.init())
    }
    
    func setupKVO() {
        person.rx.observeWeakly(String.self, "name").subscribe(onNext: { (change) in
            print(change ?? "helloworld")
        }).disposed(by: DisposeBag.init())
    }
    
    func setupNotification() {
        NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification).subscribe{ (event) in
            print(event)
        }.disposed(by: DisposeBag.init())
    }

    func setupGestureRecognizer() {
        let tap = UITapGestureRecognizer()
        label.addGestureRecognizer(tap)
        label.isUserInteractionEnabled = true
        tap.rx.event.subscribe { (event) in
            print("点了label")
        }.disposed(by: DisposeBag.init())
    }
    
    func setupNetwork() {
        let url = URL(string: "https://www.baidu.com")
        URLSession.shared.rx.response(request: URLRequest(url: url!)).subscribe(onNext: { (response,data) in
            print("response ===== \(response)")
            print("data ==== \(data)")
        }, onError: { (error) in
            print("error ==== \(error)")
        }, onCompleted: {
            print("请求完成")
        }).disposed(by: DisposeBag.init())
    }

}
