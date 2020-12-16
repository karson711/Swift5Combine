//
//  GaoDeMapViewController.swift
//  SwiftControls
//
//  Created by jikun on 2020/6/17.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class GaoDeMapViewController: UIViewController, AMapSearchDelegate {
    
    var search:AMapSearchAPI!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "高德地图"
        //https://lbs.amap.com/api/ios-sdk/guide/map-tool/swift
        
        self.view.backgroundColor = UIColor.white
        
        showMap()
        
        //配置Key，除了key要一致，还必须保证bundle id与配置的一样
        AMapServices.shared().apiKey = "1cbcc8dcd08f7ae47a489d2323f2fce0"
        
        poi()
       
    }
    
    func showMap(){
        
        let mapView = MAMapView(frame: self.view.bounds)
        
        self.view.addSubview(mapView)
    }

    
    func poi(){
        
        //构造主搜索对象 AMapSearchAPI，并设置代理。
        search = AMapSearchAPI()
        search.delegate = self
        //进行关键字检索的请求，其中 keywords 是必设参数。types 为搜索类型。
        let request = AMapPOIKeywordsSearchRequest()
        request.keywords = "高等院校"
        request.requireExtension = true
        request.city = "广州"
        request.types = "高等院校";
        //只搜索本城市的POI
        request.cityLimit = true
        request.requireSubPOIs = true
        
        //发起关键字检索
        search.aMapPOIKeywordsSearch(request)
    }

}

extension ViewController: AMapSearchDelegate{
    
    //当检索成功时，会进到 onPOISearchDone 回调函数
    func onPOISearchDone(_ request: AMapPOISearchBaseRequest!, response: AMapPOISearchResponse!) {
        
        if response.count == 0 {
            return
        }
        
        //解析response获取POI信息，具体解析见 Demo
        for poi in response.pois {
            
            print(poi.name as Any)
        }
    }
    
}

