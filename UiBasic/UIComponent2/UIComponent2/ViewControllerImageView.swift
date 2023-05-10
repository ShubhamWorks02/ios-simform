//
//  ViewControllerImageView.swift
//  UIComponent2
//
//  Created by Shubham Bhatt on 08/05/23.
//

import UIKit

class ViewControllerImageView: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak var imageView: UIImageView!
    // MARK: VARIABLES
    var imagesArr: [UIImage?] = [UIImage(named: "img"),UIImage(named: "round")]
    var currentImageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeLeftGesture.direction = .left
        imageView.addGestureRecognizer(swipeLeftGesture)
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        swipeRightGesture.direction = .right
        imageView.addGestureRecognizer(swipeRightGesture)
        
        // Enable user interaction on image view
        imageView.isUserInteractionEnabled = true
        
        // imageViewAnimation()
    }
    
    // MARK: IMAGEVIEW ACTION METHODS
    private func imageViewAnimation() {
        imageView.animationImages = imagesArr as? [UIImage]
        imageView.animationDuration = 1.0 // 1 second per loop
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
    }
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
            showNextImage()
        } else if gesture.direction == .right {
            showPreviousImage()
        }
    }
    
    private func showNextImage() {
        currentImageIndex = (currentImageIndex + 1) % imagesArr.count
        imageView.image = imagesArr[currentImageIndex]
    }
    
    private func showPreviousImage() {
            currentImageIndex = (currentImageIndex - 1 + imagesArr.count) % imagesArr.count
            imageView.image = imagesArr[currentImageIndex]
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
