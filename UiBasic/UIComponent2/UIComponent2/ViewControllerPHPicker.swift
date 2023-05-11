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
        
        //var imageIndex = 0
        var images = [UIImage]() // Array to store the selected images
        
        //let dispatchGroup = DispatchGroup()
        
        for result in results {
            //dispatchGroup.enter()
            
            result.itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.image.identifier) { (url, error) in
                if let error = error {
                    // Handle error
                    //dispatchGroup.leave()
                    return
                }
                
                if let url = url {
                    if let image = UIImage(contentsOfFile: url.path) {
                        print(results.count)
                        print(images.count)
                        images.append(image)
                    }
                }
                
                
//                if images.count == results.count {
//                    DispatchQueue.main.async {
//                        self.displayImagesWithTimeInterval(images)
//                    }
//                }
                //dispatchGroup.leave()
                
            }
            
            
        }
        if images.count == results.count {
             print("same images as per result")
            self.displayImagesWithTimeInterval(images)
        }
        
//        dispatchGroup.notify(queue: .main) {
//            self.displayImagesWithTimeInterval(images)
//        }
    }
    
    func displayImagesWithTimeInterval(_ images: [UIImage]) {
        var imageIndex = 0
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.imageView.image = images[imageIndex]
            imageIndex += 1
            
            if imageIndex == images.count {
                imageIndex = 0
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
