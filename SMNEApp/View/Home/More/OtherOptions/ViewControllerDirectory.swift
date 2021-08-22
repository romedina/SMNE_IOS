//
//  ViewControllerDirectory.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/05/21.
//

import UIKit
import WebKit

class ViewControllerDirectory: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let myURL = URL(string: "https://smne-beta.web.app/directory")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
