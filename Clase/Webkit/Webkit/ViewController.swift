//
//  ViewController.swift
//  Webkit
//
//  Created by Sofìa Gutièrrez on 10/25/19.
//  Copyright © 2019 unam. All rights reserved.
//
import UIKit


import WebKit

class ViewController: UIViewController, WKNavigationDelegate{

    var webView: WKWebView!
    
    
    override func loadView() {
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.apple.com")
        webView.load(URLRequest(url: url!))
    }

    func webView(_webView: WKWebView, didCommit navigation: WKNavigation!){
        print("hola")
        
        
    }
}

