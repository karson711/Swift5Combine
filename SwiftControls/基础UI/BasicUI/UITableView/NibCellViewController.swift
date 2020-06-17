//
//  NibCellViewController.swift
//  SwiftControls
//
//  Created by anfa on 2019/9/11.
//  Copyright © 2019 anfa. All rights reserved.
//

import UIKit

class NibCellViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    let identifier = "NibTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "UITableView代理详解"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib.init(nibName: "NibTableViewCell", bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: identifier)
        
    }

}

extension NibCellViewController:UITableViewDelegate,UITableViewDataSource{
    // 每个分区行数
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
         return 10
     }
     // 行高
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 80
     }
    
     // cell
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! NibTableViewCell
         if indexPath.row == 2 {
             cell.setValueForCell()
         }
         return cell
     }
     // cell点击事件处理
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         
     }
}
