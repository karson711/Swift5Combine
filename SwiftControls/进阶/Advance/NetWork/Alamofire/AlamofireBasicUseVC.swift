//
//  AlamofireBasicUseVC.swift
//  SwiftControls
//
//  Created by anfa on 2020/6/12.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireBasicUseVC: UIViewController {

    @IBOutlet weak var largeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Alamofire基础使用"
        
//        self.get()
        
//        self.post()
        
//        self.download()
        
//        self.upload()
        
//        self.callsendImageAPI(param: <#T##[String : Any]#>, arrImage: <#T##[UIImage]#>, imageKey: <#T##String#>, URlName: <#T##String#>, controller: <#T##UIViewController#>, withblock: <#T##(AnyObject?) -> Void#>)
    }
    
    func get() {
        AF.request("http://v.juhe.cn/toutiao/index?type=top&key=d1287290b45a69656de361382bc56dcd").responseJSON { response in
            
            print("Request: \(String(describing: response.request))")   // original url request
            
            print("Response: \(String(describing: response.response))") // http url response
            
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.value {
                print("JSON: \(json)")
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
    }

    func post() {
        
        let parameters: Parameters = ["type": "top", "key":"d1287290b45a69656de361382bc56dcd"]

        AF.request("http://v.juhe.cn/toutiao/index", method: .post, parameters: parameters).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
        
    }
    
    func download() {
    
        
        //下载图片
//        AF.download("https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=103152146,1641089711&fm=26&gp=0.jpg").responseJSON { response in
//            if let data = response.value {
//                self.largeImage.image = UIImage(data: data as! Data)
//            }
//        }
        
        //下载文件
        let destination: DownloadRequest.Destination = { _, _ in
            
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            
            let fileURL = documentsURL.appendingPathComponent("pig.png")
            
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        
        AF.download("https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=103152146,1641089711&fm=26&gp=0.jpg", to: destination)
            //下载进度
            .downloadProgress { progress in
                print("Download Progress: \(progress.fractionCompleted)")
            }
            .response { response in

            //获取图片显示出来
            if response.error == nil, let imagePath = response.fileURL?.path {
                
                let image = UIImage(contentsOfFile: imagePath)
                
                self.largeImage.image = image
            }
        }
    }
    
    func upload() {
        let imageData = UIImage(named: "aa")?.pngData()
        
        let headers: HTTPHeaders
        headers = ["Content-type": "multipart/form-data",
                   "Content-Disposition" : "form-data"]
        
        AF.upload(multipartFormData: { multipartFormData in
            
             multipartFormData.append(imageData!, withName: "myfile", fileName: "aa.png", mimeType: "image/png")
            
        }, to: "http://localhost:8080/AppTestAPI/UploadServlet",
           method: .post,
           headers: headers).response { response in
            
              if((response.error != nil)){
                  do{
                      if let jsonData = response.data{
                          let parsedData = try JSONSerialization.jsonObject(with: jsonData) as! Dictionary<String, AnyObject>
                          print(parsedData)
                      }
                  }catch{
                      print("error message")
                  }
              }else{
                   print(response.error!.localizedDescription)
              }
        }
        
    }
    
    //上传多张图片
    func callsendImageAPI(param:[String: Any],arrImage:[UIImage],imageKey:String,URlName:String,controller:UIViewController, withblock:@escaping (_ response: AnyObject?)->Void){

        let headers: HTTPHeaders
        headers = ["Content-type": "multipart/form-data",
                   "Content-Disposition" : "form-data"]

        AF.upload(multipartFormData: { (multipartFormData) in

            for (key, value) in param {
                multipartFormData.append((value as! String).data(using: String.Encoding.utf8)!, withName: key)
            }

            let date = Date()
            let dateFormat = DateFormatter()
            dateFormat.dateFormat="yyyy-MM-dd HH:mm:ss"
            
            for img in arrImage {
                guard let imgData = img.jpegData(compressionQuality: 1) else { return }
                multipartFormData.append(imgData, withName: imageKey, fileName: dateFormat.string(from: date) + ".jpeg", mimeType: "image/jpeg")
            }


        },to: "", usingThreshold: UInt64.init(),
          method: .post,
          headers: headers).response{ response in

            if((response.error != nil)){
                do{
                    if let jsonData = response.data{
                        let parsedData = try JSONSerialization.jsonObject(with: jsonData) as! Dictionary<String, AnyObject>
                        print(parsedData)

                        let status = parsedData["status"] as? NSInteger ?? 0

                        if (status == 1){
                            if let jsonArray = parsedData["data"] as? [[String: Any]] {
                                withblock(jsonArray as AnyObject)
                            }

                        }else if (status == 2){
                            print("error message")
                        }else{
                            print("error message")
                        }
                    }
                }catch{
                    print("error message")
                }
            }else{
                 print(response.error!.localizedDescription)
            }
        }
    }

}
