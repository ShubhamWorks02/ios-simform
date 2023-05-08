//
//  ViewControllerSegment.swift
//  UIComponent2
//
//  Created by Shubham Bhatt on 08/05/23.
//

import UIKit

class ViewControllerSegment: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var lblForStepper: UILabel!
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var segmentViewSetter: UISegmentedControl!
    @IBOutlet weak var pinkView: UIView!
    @IBOutlet weak var grayView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepperConfig()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        lblForStepper.text = String(sender.value)
        progressView.progress = Float(stepper.value)/Float(stepper.maximumValue)
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        // place the subview in front from the view heirarchy whichever segment is selected
        if sender.selectedSegmentIndex == 0 {
                   parentView.bringSubviewToFront(pinkView)
               } else {
                    parentView.bringSubviewToFront(grayView)
               }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: STEPPER
    
    private func stepperConfig() {
        let image = UIImage(named: "img")
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 12
        stepper.minimumValue = 2
        stepper.setDecrementImage(image, for: .highlighted)
    }
}
