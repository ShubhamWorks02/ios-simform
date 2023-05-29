//
//  ViewControllerPHPicker.swift
//  UIComponent2
//
//  Created by Shubham Bhatt on 10/05/23.
//

import UIKit
import PhotosUI

class ViewControllerPHPicker: UIViewController,PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        
        var imageIndex = 0
        var images = [UIImage]() // Array to store the selected images
        
        let dispatchGroup = DispatchGroup()
        
        for result in results {
            dispatchGroup.enter()
            
            result.itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.image.identifier) { (url, error) in
                if let error = error {
                    // Handle error
                    dispatchGroup.leave()
                    return
                }
                
                if let url = url {
                    if let image = UIImage(contentsOfFile: url.path) {
                        print(results.count)
                        print(images.count)
                        images.append(image)
                    }
                }
                dispatchGroup.leave()
            }
        }

        
        dispatchGroup.notify(queue: .main) {
            self.displayImagesWithTimeInterval(images)
        }
    }
    
    func displayImagesWithTimeInterval(_ images: [UIImage]) {
        var imageIndex = 0
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.imageView.image = images[imageIndex]
            imageIndex += 1
            if imageIndex == images.count {
                imageIndex = imageIndex % images.count
            }
        }
        
    }

    @IBOutlet weak var btnImagePick: UIButton!
    var imagesArr : [UIImage] = []
    @IBAction func pickImagePressed(_ sender: Any) {
        showPicker()
    }
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    private func showPicker() {
       var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 4
        configuration.filter = .any(of: [.videos, .images])
       let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
       self.present(picker, animated: true, completion: nil)
    }

}
