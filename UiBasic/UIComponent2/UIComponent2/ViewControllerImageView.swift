//
//  ViewControllerImageView.swift
//  UIComponent2
//
//  Created by Shubham Bhatt on 08/05/23.
//

import UIKit

class ViewControllerImageView: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var imagesArr: [UIImage?] = [UIImage(named: "img"),UIImage(named: "round")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.animationImages = imagesArr as? [UIImage]
               imageView.animationDuration = 1.0 // 1 second per loop
               imageView.animationRepeatCount = 0
               imageView.startAnimating()
        // Do any additional setup after loading the view.
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
