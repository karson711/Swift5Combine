//
//  UIPickerViewController.swift
//  SwiftControls
//
//  Created by jikun on 2020/5/15.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class UIPickerViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var birthday: UITextField!
    
    var cityDict:NSDictionary?
    
    var provinces:[String] = [String]()
    
    var cities:[String] = [String]()
    
    var selectedProvince:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "UIPickerView/UIDatePricker使用"
        
        self.setBirthdayUI()
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        //读取plist文件
        if let path = Bundle.main.path(forResource: "cityData", ofType: "plist") {
            
            //将plist文件转成字典
            self.cityDict = NSDictionary(contentsOfFile: path)
            
            //获取省份
            self.provinces = self.cityDict?.allKeys as! [String]
            
            //获取第一个省份
            self.selectedProvince = self.provinces.first!
            
            self.pickerView.reloadAllComponents()
        }
        
    }
    
    func setBirthdayUI() {
        
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 200))
        
        datePicker.datePickerMode = .dateAndTime
        
        //当空间datePicker发生valueChnaged事件时 会调用target的action方法
        datePicker.addTarget(self, action: #selector(getBirthday), for: .valueChanged)
        
        self.birthday.inputView = datePicker
    }
    
    @objc func getBirthday(datePicker:UIDatePicker){
        
        //获取日期
        let date = datePicker.date
        
        //Date转String
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy.MM.dd HH:mm:ss"
        
        self.birthday.text = dateFormatter.string(from: date)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.birthday.resignFirstResponder()
    }
    
}

extension UIPickerViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    //UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            
            return self.provinces.count
        }
        else {
        
            //通过所选省份 获取对应的城市
            self.cities = (self.cityDict?[selectedProvince] as? [String])!
            
            return self.cities.count
        }
    }
    
        
    //UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            
            return self.provinces[row]
        }
            
        else{
            
            //通过所选省份 获取对应的城市
            self.cities = (self.cityDict?[selectedProvince] as? [String])!
            
            return self.cities[row]
        }
        
    }
    
    //选择的数据列
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        //选择第一列的时候
        if component == 0 {
            
            //获取用户选择的省份
            self.selectedProvince = self.provinces[row]
            
            //重新加载第二列数据
            self.pickerView.reloadComponent(1)
            
            //让第二列数据滚动到第一行
            self.pickerView.selectRow(0, inComponent: 1, animated: true)
            
            
        }
        
        
    }
    
    
}
