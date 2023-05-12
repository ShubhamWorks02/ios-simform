//
//  ViewControllerScrollOffset.swift
//  UIComponent2
//
//  Created by Shubham Bhatt on 12/05/23.
//

import UIKit

class ViewControllerScrollOffset: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: view.bounds.width * 3, height: scrollView.bounds.height)
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        setLabelOnScrollView(numberOfLabels: 5)
    }
    
    private func setLabelOnScrollView(numberOfLabels: Int) {
    
        for i in 0..<numberOfLabels {
           let label = UILabel(frame: CGRect(x: CGFloat(i) * view.frame.width, y: 0, width: view.frame.width, height: contentView.frame.height))
           label.textAlignment = .center
           label.font = UIFont.systemFont(ofSize: 30)
           label.text = "Page \(i + 1)"
           scrollView.addSubview(label)
       }
    }

}

// MARK: DELEGATE METHODS
extension ViewControllerScrollOffset: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Content Offset: \(scrollView.contentOffset.x)")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            // Calculating the current page based on the content offset
        let pageWidth = scrollView.bounds.width
        let currentPage = Int(scrollView.contentOffset.x / pageWidth)
        print("Current Page: \(currentPage + 1)")
    }
}

