//
//  ViewControllerDemoScrollView.swift
//  UIComponent2
//
//  Created by Shubham Bhatt on 11/05/23.
//

import UIKit
import PhotosUI

class ViewControllerDemoScrollView: UIViewController {
 

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pickImagesButton: UIButton!
    
    var selectedImages: [UIImage] = []
       let imagePicker = PHPickerViewController(configuration: PHPickerConfiguration())
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
                // Set the desired number of images
               
               // Disable scrolling of the scroll view
               scrollView.isScrollEnabled = false
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func pickImagesButtonTapped(_ sender: Any) {
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


extension ViewControllerDemoScrollView: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true, completion: nil)
                
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
                                    imageView.frame.size = CGSize(width: self?.scrollView.bounds.height ?? 0, height: self?.scrollView.bounds.height ?? 0)
                                    
                                    // Position each image view horizontally next to the previous one
                                    let contentWidth = CGFloat(self?.scrollView.subviews.count ?? 0) * imageView.frame.width
                                    imageView.frame.origin.x = contentWidth + 20
                                    self?.scrollView.addSubview(imageView)
                                    
                                    // Adjust the scroll view's content size to fit all the images
                                    self?.scrollView.contentSize = CGSize(width: contentWidth + imageView.frame.width, height: self?.scrollView.frame.height ?? 0)
                                    
                                    // Enable scrolling of the scroll view if needed
                                    self?.scrollView.isScrollEnabled = self?.scrollView.contentSize.width ?? 0 > self?.scrollView.frame.width ?? 0
                                }
                            }
                        }
                    }
                }
    }
    
}
