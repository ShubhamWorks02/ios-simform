//
//  WebViewController.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 25/05/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    // MARK: OUTLETS
    @IBOutlet weak private var webViewContent: WKWebView!
    @IBOutlet weak var txtEnterUrl: UITextField!
    @IBOutlet weak var btnDone: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configWebView()
        // Do any additional setup after loading the view.
    }
    
    private func configWebView() {
        webViewContent.uiDelegate = self
        webViewContent.navigationDelegate = self
        let urlStr = "https://google.com"
        webViewContent.load(URLRequest.init(url: URL(string: urlStr)!))
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.webViewContent.reload()
//        }
        let canGoBack = webViewContent.canGoBack
        // Check if the web view can go forward
        let canGoForward = webViewContent.canGoForward
        
        // Perform goBack() after a delay of 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            print("entered")
            if let pdfURL = Bundle.main.url(forResource: "first", withExtension: "pdf") {
                // Load the PDF file into the web view
                print("loading")
                self.webViewContent.loadFileURL(pdfURL, allowingReadAccessTo: pdfURL)
            }
        }

        // Perform goForward() after a delay of 6 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 12) {
            if canGoForward {
                self.webViewContent.goForward()
            }
        }
    }

    
    
    
}

extension WebViewController: UIWebViewDelegate, WKNavigationDelegate, WKUIDelegate {
    
}
