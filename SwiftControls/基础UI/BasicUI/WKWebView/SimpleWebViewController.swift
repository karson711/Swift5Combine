//
//  SimpleWebViewController.swift
//  SwiftControls
//
//  Created by anfa on 2019/9/11.
//  Copyright © 2019 anfa. All rights reserved.
//

import UIKit
import WebKit

class SimpleWebViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "WKWebView使用"
        self.view.backgroundColor = UIColor.white
        
        let webView = WKWebView.init(frame: self.view.bounds)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        self.view.addSubview(webView)
        webView.load(URLRequest.init(url: URL.init(string: "https://www.baidu.com")!))
    }    

}

extension SimpleWebViewController:WKUIDelegate,WKNavigationDelegate{
    // MARK: - Delegate & DateSoruce
    
    // 处理在发送请求之前决定是否进行跳转
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        decisionHandler(.allow)
    }
    
    // 网页开始加载时候调用该方法
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    // 网页加载失败使用该方法
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
    }
    // 网页内容开始返回该方法
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    // 收到服务器跳转请求之后调用
    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    // 网页加载完成调用该方法
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    // 网页返回内容时失败调用该方法
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
}
