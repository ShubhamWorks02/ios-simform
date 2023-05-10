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
        // imageView.image = results[0] as UIImage
        if let images = results as? [UIImage] {
            imageView.animationImages = images
            imageView.animationDuration = 1.0 // 1 second per loop
            imageView.animationRepeatCount = 0
            imageView.startAnimating()
        }
        
//        for result in results {
//            result.itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.image.identifier) { (url, error) in
//                if let error = error {
//                    // Handle error
//                    return
//                }
//
//                if let url = url {
//                    // Use the selected image URL
//                    // Note: You may need to copy the image to a different location if you want to persist it
//                }
//            }
//        }
    }
    

    @IBOutlet weak var btnImagePick: UIButton!
   
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
