//
//  ViewController.swift
//  UIComponent2
//
//  Created by Shubham Bhatt on 05/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    var progress = Progress(totalUnitCount: 10)
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
        
        // Do any additional setup after loading the view.
        
//        progressBar.layer.sublayers![1].cornerRadius = 10
//        progressBar.subviews[1].clipsToBounds = true
        
       
        
    }
    @IBAction func btnPressed(_ sender: Any) {
        let progress = Progress(totalUnitCount: 10)
            progressBar.setProgress(0.0, animated: false)
            
            // Start a timer to update the progress view
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                // Check if the progress is completed
                guard progress.isFinished == false else {
                    self.submitBtn.setTitle("Finished", for: .normal)
                    timer.invalidate()
                    return
                }
                
                // Increment the completed unit count
                progress.completedUnitCount += 1
                
                // Update the progress view
                let progressFloat = Float(progress.fractionCompleted)
                self.progressBar.setProgress(progressFloat, animated: true)
            }
    }

    private func initValues() {
        progressBar.setProgress(0.2, animated: true)
        progressBar.progressImage = UIImage(named: "img")
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 8)
        progressBar.layer.cornerRadius = 10
        progressBar.clipsToBounds = true
    }
    
    func showAlert() {
            let alert = UIAlertController(title: "Progress Complete", message: "The progress is complete.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
    }
}

