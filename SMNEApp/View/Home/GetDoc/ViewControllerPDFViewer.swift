//
//  ViewControllerPDFViewer.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/05/21.
//

import UIKit
import WebKit

class ViewControllerPDFViewer: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var parentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url: URL! = URL(string: "http://developer.apple.com/iphone/library/documentation/UIKit/Reference/UIWebView_Class/UIWebView_Class.pdf")
        let webview = WKWebView(frame: CGRect(x: 0.0, y: parentView.frame.minY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 98))
        view.addSubview(webview)
        webview.navigationDelegate = self
        webview.load(URLRequest(url: url))
    }

    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
