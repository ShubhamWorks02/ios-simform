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
    
    //
    var tempURl: URL?
  
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
            if let url = saveImageToDocumentsDirectory(image: image) {
                displayImageFromDocumentsDirectory(displayURL: url)
            }
            
        }
        
    }
    
    func saveImageToDocumentsDirectory(image: UIImage) -> URL? {
        if let data = image.jpegData(compressionQuality: 1.0) {
            do {
                guard let fileURl = createDocumentDirectory() else {
                    print("returned from save else")
                    return nil
                }
            tempURl = fileURl
                try data.write(to:  fileURl)
                print("Image saved to documents directory.")
            } catch {
                print("Error saving image: \(error)")
            }
        }
        return tempURl
    }
    
    func createDocumentDirectory() -> URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        let fileURL = documentsDirectory.appendingPathComponent(generateRandomString())
        return fileURL
    }
    

        
        func generateRandomString() -> String {
            let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
            let randomString = String((0..<10).map{ _ in letters.randomElement()! })
            return randomString + ".jpg"
        }
        
        
    func displayImageFromDocumentsDirectory(displayURL: URL) {
            print("displayImageFromDocumentsDirectory")
            print("fileurl",displayURL)
            if let imageData = try? Data(contentsOf: displayURL), let image = UIImage(data: imageData) {
                print("image setted")
                imageViewSet.image = image
            }
        }
        
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }

