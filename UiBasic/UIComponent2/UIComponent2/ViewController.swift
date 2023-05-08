//
//  ViewController.swift
//  UIComponent2
//
//  Created by Shubham Bhatt on 05/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var segmentViewSetter: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    var imagesArr: [UIImage?] = [UIImage(named: "img"),UIImage(named: "round")]

//
//    @IBAction func segmentValueChange(_ sender: UISegmentedControl) {
//        if sender.selectedSegmentIndex == 0 {
//            parentView.bringSubviewToFront(pinkView)
//        } else {
//            parentView.bringSubviewToFront(grayView)
//        }
//    }
    
    // MARK: OUTLETS
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    var progress = Progress(totalUnitCount: 10)
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initValues()
//        imageViewAnimation.animationImages = imagesArr as? [UIImage]
//        imageViewAnimation.animationDuration = 1.0 // 1 second per loop
//        imageViewAnimation.animationRepeatCount = 0
//        imageViewAnimation.startAnimating()
//        // segmentActions()
        // segment.removeAllSegments()
    }
    
    // MARK: SEGMENTCONTROL METHODS
    func segmentActions() {
        let image = UIImage(named: "img")
        segment.setImage(image, forSegmentAt: 1)
        if let img = segment.imageForSegment(at: 1) {
            imageView.image = img
        }
        segment.insertSegment(withTitle: "added", at: 1, animated: true)
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
        let segmentView = UIView()
        //segmentView.backgroundColor = .green
         
        segmentView.frame = segment.subviews[1].bounds
        let lbl = UILabel()
        lbl.text = "customView"
        lbl.frame = segmentView.bounds
        segmentView.addSubview(lbl)
        segment.subviews[1].addSubview(segmentView)
    }
    
    
    private func showAlert() {
            let alert = UIAlertController(title: "Progress Complete", message: "The progress is complete.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
    }
}

