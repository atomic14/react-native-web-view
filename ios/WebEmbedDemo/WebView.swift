//
//  WebView.swift
//  WebEmbedDemo
//
//  Created by Chris Greening on 08/06/2020.
//

import UIKit
import WebKit

@objcMembers
class WebView: UIView, WKNavigationDelegate {
  let webView = WKWebView()
  
  var onLoaded : RCTDirectEventBlock?
  
  init() {
    super.init(frame: CGRect.zero)
    webView.translatesAutoresizingMaskIntoConstraints = false;
    addSubview(webView)
    addConstraint(NSLayoutConstraint(item: webView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0))
    addConstraint(NSLayoutConstraint(item: webView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0))
    addConstraint(NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0))
    addConstraint(NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0))
    webView.navigationDelegate = self;
  }
  
  func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    decisionHandler(.allow)
  }
  
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    if let eventHandler = onLoaded {
      eventHandler([ "uri": webView.url?.absoluteString as Any])
    }
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  var uri: String? {
    didSet {
      if let uri = uri {
        if let url = URL(string: uri) {
          webView.load(URLRequest(url: url))
          return
        }
      }
      webView.loadHTMLString("<html><body>No content</body></html>", baseURL: nil)
    }
  }
}
