//
//  ViewControllerPDFViewer.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 26/05/21.
//

import UIKit
import CoreTelephony
import WebKit

class ViewControllerPDFViewer: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    public var url = ""
    var pdfUrl: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        guard let url = URL(string: url) else { return }
        if !docExist(url: url) {
            let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
            let downloadTask = urlSession.downloadTask(with: url)
            downloadTask.resume()
        } else {
            downloadFinished()
        }
        
//        let url: URL! = URL(string: url)
    }
    
    private func docExist(url: URL) -> Bool {
        let docsPath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let urlC = NSURL(fileURLWithPath: docsPath.absoluteString)
        if let pathComponent = urlC.appendingPathComponent("\(url.lastPathComponent)") {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath) {
                let complete = "\(filePath)"
                self.pdfUrl = URL(fileURLWithPath: complete)
                self.downloadFinished()
                return true
            }
        }
        return false
    }
    
    private func downloadFinished() {
        DispatchQueue.main.async {
            guard let url = self.pdfUrl else { return }
            let webview = WKWebView(frame: CGRect(x: 0.0, y: self.parentView.frame.minY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 98))
            self.view.addSubview(webview)
            webview.navigationDelegate = self
            webview.load(URLRequest(url: url))
            self.activityIndicator.stopAnimating()
        }
    }

    @IBAction func backTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ViewControllerPDFViewer : URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let url = downloadTask.originalRequest?.url else {
            return
        }
        
        let docsPath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        
        let destinationPath = docsPath.appendingPathComponent(url.lastPathComponent)
        
        try? FileManager.default.removeItem(at: destinationPath)
        
        try? FileManager.default.copyItem(at: location, to: destinationPath)
        self.pdfUrl = destinationPath
        self.downloadFinished()
    }
}
