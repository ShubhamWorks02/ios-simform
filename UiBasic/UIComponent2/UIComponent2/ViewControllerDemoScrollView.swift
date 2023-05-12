//
//  ViewControllerDemoScrollView.swift
//  UIComponent2
//
//  Created by Shubham Bhatt on 11/05/23.
//

import UIKit
import PhotosUI

class ViewControllerDemoScrollView: UIViewController {
 
    // MARK: OUTLETS
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pickImagesButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    // MARK: VARIABLES
    var selectedImages: [UIImage] = []
    let imagePicker = PHPickerViewController(configuration: PHPickerConfiguration())
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Disable scrolling of the scroll view
        scrollView.isScrollEnabled = false
        pageControl.numberOfPages = 0
        scrollView.delegate = self
    }
    
    // MARK: ACTIONS
    @IBAction func pickImagesButtonTapped(_ sender: Any) {
        
        scrollView.isPagingEnabled = true
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 5 // Set the desired number of images
        
        let imagePicker = PHPickerViewController(configuration: configuration)
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
        
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

// MARK: DELEGATE METHODS
extension ViewControllerDemoScrollView: PHPickerViewControllerDelegate, UIPageViewControllerDelegate, UIScrollViewDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true, completion: nil)
        pageControl.numberOfPages = results.count
        for result in results {
            if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] (image, error) in
                    if let error = error {
                        print("Error loading image")
                    } else if let image = image as? UIImage {
                        DispatchQueue.main.async {
                            // Track the selected images
                            self?.selectedImages.append(image)
                            
                            // Create an image view for each selected image
                            let imageView = UIImageView(image: image)
                            imageView.contentMode = .scaleAspectFit
                            imageView.frame.size = CGSize(width:  self!.view.bounds.width ?? 0, height: self?.scrollView.bounds.height ?? 0)
                            
                            // Position each image view horizontally next to the previous one
                            let contentWidth = CGFloat(self!.selectedImages.count - 1 ?? 0) * imageView.frame.width
                            imageView.frame.origin.x = contentWidth
                            self?.scrollView.addSubview(imageView)
                            
                            // Adjust the scroll view's content size to fit all the images
                            self?.scrollView.contentSize = CGSize(width: contentWidth + imageView.frame.width, height: self?.scrollView.frame.height ?? 0)
                            
                            // Enable scrolling of the scroll view if needed
                            self?.scrollView.isScrollEnabled = self?.scrollView.contentSize.width ?? 0 > self?.scrollView.frame.width ?? 0
                            
                            // Update the number of pages in the page control
                            self?.pageControl.numberOfPages = self?.selectedImages.count ?? 0
                        }
                    }
                }
            }
        }
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollViewDidScroll")
        
    }
    
    @IBAction func pageControlValueChanged(_ sender: UIPageControl) {
        var currentPage = pageControl.currentPage
        scrollView.setContentOffset(CGPoint(x: (view.bounds.width)*CGFloat(currentPage) , y: 0), animated: true)
        print(sender.currentPage)
        print("value changed")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Calculating the current page based on the content offset
        let pageWidth = scrollView.bounds.width
        let currentPage = Int(scrollView.contentOffset.x / pageWidth)
        print("Current Page: \(currentPage + 1)")
        pageControl.currentPage = currentPage
    }
    
    
}
