//
//  SystemRequestVC.swift
//  SwiftControls
//
//  Created by jikun on 2020/6/13.
//  Copyright © 2020 anfa. All rights reserved.
//

import UIKit

class SystemRequestVC: UIViewController {
    
     @IBOutlet weak var uploadInfoLb: UILabel!
     
     @IBOutlet weak var downloadProgress: UIProgressView!
     
    @IBOutlet weak var textView: UITextView!
    
     let YFBoundary = "AnHuiWuHuYungFan"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getMethod(_ sender: Any) {
        get()
    }
    
    @IBAction func postMethod(_ sender: Any) {
        post()
    }
    
    @IBAction func downloadMethod(_ sender: Any) {
        download()
    }
    
    
    /**
       1.创建一个URL对象，设置请求资源的路径
       2.通过URL创建一个URLRequest对象，设置请求头和请求体
       3.定义URLSessionConfiguration用于创建URLSession时设置工作模式和网络设置
       4.创建URLSession
       5.构建一个URLSessionTask，共有三种任务
           URLSessionDataTask：请求数据的Task
           URLSessionUploadTask：上传用的Task
           URLSessionDownloadTask：下载用的Task
       6.启动任务
       7.使用Delegate或者CompletionHandler处理任务执行过程的事件
     */
       func post(){
           
           let url = URL(string: "http://v.juhe.cn/toutiao/index")
           
           var urlRequest = URLRequest(url: url!)
           
           urlRequest.httpMethod = "POST"
           
           let params = "type=top&key=d1287290b45a69656de361382bc56dcd"
           
           urlRequest.httpBody = params.data(using: .utf8)
           
           let config = URLSessionConfiguration.default
           
           let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue())
           /**
           let task = session.dataTask(with: urlRequest) { (data, response, error) in
               
               if error != nil {
                   
                   print(error!)
               }
                   
               else {
                   
                   print(Thread.current)
                   
                   print(response!)
                   
                   if let data = data{
                       
                       print(String(data: data, encoding: .utf8)!)
                       
                   }
               }
            
               
           }*/
           
           let task = session.dataTask(with: urlRequest)
           
           task.resume()
       }


       
       func get(){
           
           let url = URL(string: "http://v.juhe.cn/toutiao/index?type=top&key=d1287290b45a69656de361382bc56dcd")
           
           let urlRequest = URLRequest(url: url!)
           
           let config = URLSessionConfiguration.default
           
           let session = URLSession(configuration: config)
           
           let task = session.dataTask(with: urlRequest) { (data, response, error) in
               
               
               if error != nil {
                   
                   print(error!)
               }
               
               else {
                   
                   print(Thread.current)
                   
                   print(response!)
                   
                   if let data = data{
                       
                        print(String(data: data, encoding: .utf8)!)
                        
                        DispatchQueue.main.async {
                            self.textView.text = String(data: data, encoding: .utf8)!
                        }
                        
                       
                   }
               }
               
               
           }
           
           
           task.resume()
       }
    
    
    func download(){
        
        let url = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592027775847&di=3a290c4aa50d082c1d8d0756455a3eca&imgtype=0&src=http%3A%2F%2Fc.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F5882b2b7d0a20cf49b1f0c3676094b36adaf9948.jpg")
        
        let urlRequest = URLRequest(url: url!)
        
        let config = URLSessionConfiguration.default
        
        
        //代理处理比较好
        let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        
        let task = session.downloadTask(with: urlRequest)
        
        task.resume()
        
        
    }
    
    
    func upload(){
        
        //1、确定URL
        let url = URL(string: "http://localhost:8080/AppTestAPI/UploadServlet")
        
        //2、确定请求
        var request = URLRequest(url: url!)
        
        //3、设置请求头
        let head = "multipart/form-data;boundary=\(YFBoundary)"
        
        request.setValue(head, forHTTPHeaderField: "Content-Type")
        
        //4、设置请求方式
        request.httpMethod = "POST"
    
        
        //5、创建NSURLSession
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main)
        
        //6、获取上传的数据（按照固定格式拼接）
        var data = Data()
        
        let header = headerString(mimeType: "image/png", uploadFile: "wall.png")
        
        data.append(header.data(using: .utf8)!)

        data.append(uploadData())
        
        let tailer = tailerString()
        
        data.append(tailer.data(using: .utf8)!)
        
        //7、创建上传任务 上传的数据来自getData方法
        let task = session.uploadTask(with: request, from: data) { (data, response, error) in
            
            //上传完毕后
            if error != nil{
                
                print(error!)
                
            }else{
                
                print(Thread.current)
                
                DispatchQueue.main.async {
                    
                    self.uploadInfoLb.text = "上传成功"
                }
            
                //self.uploadInfo.text = "上传成功"

            }
        }
        //8、执行上传任务
        task.resume()
        
    }
    
    //开始标记
    func headerString(mimeType:String, uploadFile: String) -> String{
        
        var data = String();
        
        //--Boundary\r\n
        data.append("--" + YFBoundary + "\r\n")
        
        //文件参数名 Content-Disposition: form-data; name="myfile"; filename="wall.jpg"\r\n
        data.append("Content-Disposition:form-data; name=\"myfile\";filename=\"\(uploadFile)\"\r\n")
        
        //Content-Type 上传文件的类型 MIME\r\n\r\n
        data.append("Content-Type:\(mimeType)\r\n\r\n")
        
        return data
        
    }
    
    
    //结束标记
    func tailerString() -> String {
        
        //\r\n--Boundary--\r\n
        return "\r\n--" + YFBoundary  + "--\r\n"
        
    }
    
    func uploadData() -> Data{
        
        let image = UIImage(named: "wall.png")
        
        let imageData = image!.pngData()
        
        return imageData!
    }

}

extension SystemRequestVC: URLSessionDataDelegate{
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        
        completionHandler(URLSession.ResponseDisposition.allow)
        
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        
        print("Delegate\(Thread.current)")
        
        let result = String(data: data, encoding: .utf8)
        
        if let  result  = result {
            
            print(result)
            
            DispatchQueue.main.async {
                self.textView.text = String(data: data, encoding: .utf8)!
            }
        }
        
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        
        if let error = error {
            
            print(error)
        }
        else {
            
            print("=======成功=======")
        }
    }
}

extension SystemRequestVC: URLSessionDownloadDelegate{
    //计算进度
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        self.downloadProgress.setProgress(Float(totalBytesWritten/totalBytesExpectedToWrite), animated: true)
        
    }
    
    
    //下载完成
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        print(Thread.main)
        
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
        
        let filePath = docPath + "/123.png"
        
        print(filePath)

        try? FileManager.default.moveItem(at: location, to: URL(fileURLWithPath: filePath))
        
        self.uploadInfoLb.text = "下载成功"

    }
}

extension SystemRequestVC: URLSessionTaskDelegate{
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        
        self.downloadProgress.setProgress(Float(totalBytesSent / totalBytesExpectedToSend), animated: true)
        
         print("Delegate \(Thread.current)")
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
        
    }
    
//    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
//        if let error = error {
//            print(error)
//        }
//    }

}

