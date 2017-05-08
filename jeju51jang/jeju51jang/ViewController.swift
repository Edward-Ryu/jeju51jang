//
//  ViewController.swift
//  jeju51jang
//
//  Created by Letsee on 2017. 5. 4..
//  Copyright © 2017년 yhb4ever. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView = WKWebView()
    
    enum Status {
        case 가로
        case 세로
    }
    
    var status = Status.세로
    
    // 상태바 숨기기
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // 가로, 세로 전환할 때, webView frame 갱신
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        switch status {
        case .가로:
            if self.view.bounds.width > self.view.bounds.height {
                webView.frame = CGRect(x: 0, y: 0, width: webView.bounds.height, height: webView.bounds.width)
                status = .세로
                webView.layoutIfNeeded()
            }
        case .세로:
            if self.view.bounds.width < self.view.bounds.height {
                webView.frame = CGRect(x: 0, y: 0, width: webView.bounds.height, height: webView.bounds.width)
                status = .가로
                webView.layoutIfNeeded()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        self.view.addSubview(webView)
        webView.load(URLRequest(url: URL(string: "http://m.jejuall.com/")!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

