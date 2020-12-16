//
//  OtherViewController.swift
//  SwiftControls
//
//  Created by jikun on 2020/6/15.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {
    
    var tableView:UITableView!
    
    var array = [
        ["RXSwift初探"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "其他"
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
}

extension OtherViewController:UITableViewDelegate,UITableViewDataSource{
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
        let titleArr = ["RXSwift"]
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
            //RXSwift
            if indexPath.row == 0{
                vc = RXPreliminaryVC()
            }else if indexPath.row == 1{
                
            }
        }else if indexPath.section == 1{
            
        }
        self.navigationController?.pushViewController(vc, animated: true)
       
    }
}
