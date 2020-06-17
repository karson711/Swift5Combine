//
//  AlamofireViewController.swift
//  SwiftControls
//
//  Created by anfa on 2020/6/12.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

import Alamofire


class AlamofireViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data:[DataItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Alamofire请求列表数据"
        
        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        self.tableView.register(UINib.init(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        
        self.getNewsData()
        
        
    }

}

extension AlamofireViewController{
    func getNewsData() {
        AF.request("http://v.juhe.cn/toutiao/index?type=top&key=d1287290b45a69656de361382bc56dcd").responseJSON {
            response in
            
            if let data = response.data {
                let decoder = JSONDecoder()
                
                do {
                    let newsModel = try decoder.decode(NewsModel.self, from: data)
                    
                    self.data = newsModel.result?.data
                    
                    self.tableView.reloadData()
                    
                } catch  {
                    print(error)
                }
            }
        }
 
    }
    
    
}

extension AlamofireViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let data = self.data {
            
            return data.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: NewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        
        let dataItem = self.data![indexPath.row]
        
        cell.setupCell(item: dataItem)
        
        return cell
    }
    
    
}

extension AlamofireViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dataItem = self.data![indexPath.row]
        
        let detailsVC = DetailsViewController()
        
        detailsVC.selectedItem = dataItem
        
        self.navigationController?.pushViewController(detailsVC, animated: true)
        
    }
    
}
