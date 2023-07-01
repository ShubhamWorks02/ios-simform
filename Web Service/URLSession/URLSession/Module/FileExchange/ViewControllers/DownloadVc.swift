//
//  DownloadVc.swift
//  URLSession
//
//  Created by Shubham Bhatt on 29/06/23.
//

import UIKit

class DownloadVc: UIViewController, URLSessionDownloadDelegate {
    
    // MARK: Outlets
    @IBOutlet weak var progressView: UIProgressView!
    
    // MARK: Variables
    var coordinator: ExchangeCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressView.progress = 0
    }
    
    // MARK: Action Method
    @IBAction func startDownload(_ sender: UIButton) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1.5) {
            let config = URLSessionConfiguration.default
            let opQ = OperationQueue()
            let session = URLSession(configuration: config, delegate: self, delegateQueue: opQ)
            guard let url = URL(string: "https://i.ibb.co/Z6zP5BQ/wallpaperflare-com-wallpaper-12.jpg") else {
                return
            }
            let downloadTask = session.downloadTask(with: url ) // change
            downloadTask.resume()
        }
    }
    
    
    @IBAction func getRoot(_ sender: UIButton) {
        coordinator?.gotoRoot()
    }
    
    // MARK: URLSessionDownloadDelegate
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Download completed: \(location.absoluteString)")
        
        let fileManager = FileManager.default
        let documentsDirectoryURL = try? fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) // change
        guard let destinationURL = documentsDirectoryURL?.appendingPathComponent(downloadTask.response?.suggestedFilename ?? "file.pdf") else {
            return
        }
        
        do {
            try fileManager.moveItem(at: location, to: destinationURL )
            print("File moved to: \(destinationURL.absoluteString)")
        } catch {
            print("Error while moving file: \(error)")
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        DispatchQueue.main.async {
            let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
            self.progressView.setProgress(progress, animated: true)
        }
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            print("Download task error: \(error)")
        }
    }
}
