//
//  ViewControllerPageControl.swift
//  UIComponent2
//
//  Created by Shubham Bhatt on 08/05/23.
//

import UIKit

class ViewControllerPageControl: UIViewController {

    @IBOutlet weak var imageViewForPageContr: UIImageView!
    var imagesArray: [UIImage?] = [UIImage(named: "img"),UIImage(named: "round")]
    @IBOutlet weak var pageControl1: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        configPageControl()

        // Do any additional setup after loading the view.
    }
    
    private func configPageControl() {
        imageViewForPageContr.image = imagesArray[pageControl1.currentPage]
        // pageControl1.currentPageIndicatorTintColor = .green
        // pageControl1.preferredIndicatorImage = UIImage(named: "round")
        pageControl1.allowsContinuousInteraction = true
        pageControl1.preferredCurrentPageIndicatorImage = UIImage(named: "round.png")
        
        
//        pageControl1.pref
    }

    @IBAction func pageControlValueChanged(_ sender: UIPageControl) {
        imageViewForPageContr.image = imagesArray[pageControl1.currentPage] ?? UIImage(named: "round")
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
