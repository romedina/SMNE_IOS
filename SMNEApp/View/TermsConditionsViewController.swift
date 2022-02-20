//
//  TermsConditionsViewController.swift
//  SMNEApp
//
//  Created by Guillermo Saavedra Dorantes on 15/02/22.
//

import UIKit
import WebKit

class TermsConditionsViewController: UIViewController {
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.C052D6C()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topViewTitle: UILabel = {
        let view = UILabel()
        view.text = "Términos y condiciones"
        view.font = UIFont(name: "Open Sans Bold", size: 14.0)
        view.textColor = UIColor.C00D9CC()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topViewButton: UIButton = {
        let view = UIButton()
        view.setImage(#imageLiteral(resourceName: "arrowL"), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let webView: WKWebView = {
        let view = WKWebView()
        let myURL = URL(string: "https://smne-beta.web.app/privacity")
        let myRequest = URLRequest(url: myURL!)
        view.load(myRequest)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        addViews()
    }
    
    private func addViews() {
        topView.addSubview(topViewTitle)
        topView.addSubview(topViewButton)
        self.view.addSubview(topView)
        self.view.addSubview(webView)
        
        topViewButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 98.0),
            
            topViewButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10),
            topViewButton.centerYAnchor.constraint(equalTo: topViewTitle.centerYAnchor),
            topViewButton.heightAnchor.constraint(equalToConstant: 29),
            topViewButton.widthAnchor.constraint(equalToConstant: 29),
            
            topViewTitle.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            topViewTitle.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -16),
            
            webView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true)
    }

}
