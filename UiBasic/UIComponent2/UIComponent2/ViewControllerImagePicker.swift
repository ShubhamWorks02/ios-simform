//
//  ViewControllerImagePicker.swift
//  UIComponent2
//
//  Created by Shubham Bhatt on 10/05/23.
//

import UIKit
import Foundation
import MobileCoreServices


class ViewControllerImagePicker: UIViewController {

    // MARK: OUTLETS
    @IBOutlet weak var btnPickImage: UIButton!
    @IBOutlet weak var imageViewSet: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize = UIScreen.main.bounds.size
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height

        print("Screen width: \(screenWidth)")
        print("Screen height: \(screenHeight)")

        // Do any additional setup after loading the view.
    }
    
    // MARK: ACTION METHODS
    @IBAction func btnPickImagePressed(_ sender: UIButton) {
        let actionController = UIAlertController(title: "Select image", message: "select image from?", preferredStyle: .actionSheet)
        let camBtn = UIAlertAction(title: "Camera", style: .default) {(_) in
            self.showImagePicker(selectedSource: .camera)
        }
        let libraryBtn = UIAlertAction(title: "Library", style: .default) {(_) in
            self.showImagePicker(selectedSource: .photoLibrary)
        }
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel,handler: nil)
        actionController.addAction(camBtn)
        actionController.addAction(libraryBtn)
        actionController.addAction(cancelBtn)
        self.present(actionController, animated: true, completion: nil)
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

extension ViewControllerImagePicker: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func showImagePicker(selectedSource: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else {
            return
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = selectedSource
        // imagePickerController.mediaTypes =
        imagePickerController.allowsEditing = true
        self.present(imagePickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
               
               if let image = info[.originalImage] as? UIImage {
                   saveImageToDocumentsDirectory(image: image)
                   displayImageFromDocumentsDirectory()
               }
        
//        if let mediaType = info[.mediaType] as? String {
//                if mediaType == kUTTypeImage as String {
//                    // Handle image media type
//                    print("Picked media type: Image")
//                } else if mediaType == kUTTypeMovie as String {
//                    // Handle movie media type
//                    print("Picked media type: Movie")
//                } else {
//                    // Handle other media types
//                    print("Picked media type: \(mediaType)")
//                }
//            }
//        if let mediaMetadata = info[.mediaMetadata] as? [String: Any] {
//                // Print the media metadata
//                print("Media Metadata: \(mediaMetadata)")
//            }
//        if let selectedImage = info[.editedImage] as? UIImage {
//            print(info[.imageURL] as? URL)
//            imageViewSet.image = selectedImage
//        } else {
//            print("image not found")
//        }
//        picker.dismiss(animated: true)
    }
    
    func saveImageToDocumentsDirectory(image: UIImage) {
            guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                return
            }
            
            let fileURL = documentsDirectory.appendingPathComponent("image.jpg")
            if let data = image.jpegData(compressionQuality: 1.0) {
                do {
                    try data.write(to: fileURL)
                    print("Image saved to documents directory.")
                } catch {
                    print("Error saving image: \(error)")
                }
            }
        }
    
    func displayImageFromDocumentsDirectory() {
            guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                return
            }
            
            let fileURL = documentsDirectory.appendingPathComponent("image.jpg")
            if let imageData = try? Data(contentsOf: fileURL), let image = UIImage(data: imageData) {
                imageViewSet.image = image
            }
        }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
         picker.dismiss(animated: true)
    }
}
