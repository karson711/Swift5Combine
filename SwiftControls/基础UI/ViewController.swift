//
//  ViewController.swift
//  SwiftControls
//
//  Created by anfa on 2019/9/11.
//  Copyright © 2019 anfa. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    var tableView:UITableView!
    
    var array = [["UITableView使用"],["UICollectionView使用"],["WKWebView使用","UITextView使用","UITextField使用","UIButton使用","UILabel使用","UIPickerView/UIDatePicker使用","UISwitch、UISlider、UIsegmentControl","UIImageView使用","UIAlertViewController使用"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "基础UI控件"
        self.view.backgroundColor = UIColor.white
        
        //自定义返回按钮
        let backItem = UIBarButtonItem.init(title: "", style: UIBarButtonItem.Style.done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
                
        tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
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
        let titleArr = ["UITableView","UICollectionView","Others"]
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
            if indexPath.row == 0{
                vc = NibCellViewController()
            }
        }else if indexPath.section == 1{
            if indexPath.row == 0{
                vc = CollectionViewController()
            }
        }else if indexPath.section == 2{
            if indexPath.row == 0{
                vc = SimpleWebViewController()
            }else if indexPath.row == 1{
                vc = UITextViewViewController()
            }else if indexPath.row == 2{
                vc = UITextFieldViewController()
            }else if indexPath.row == 3{
                vc = UIButtonViewController()
            }else if indexPath.row == 4{
                vc = UILabelViewController()
            }else if indexPath.row == 5{
                vc = UIPickerViewController()
            }else if indexPath.row == 6{
                vc = UISwitchViewController()
            }else if indexPath.row == 7{
                vc = UIImageViewController()
            }else if indexPath.row == 8{
                vc = UIAlertViewController()
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
       
    }
}

