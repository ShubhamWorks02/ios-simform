//
//  ViewController.swift
//  UiComponent
//
//  Created by Shubham Bhatt on 01/05/23.
//

import UIKit

class ViewController: UIViewController {
    var didTap = true
    @IBOutlet weak var hyperlinkLabel: UILabel!
    @IBOutlet weak var labelWithLink: UILabel!
    @IBOutlet weak var textLabelOutlet: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabelOutlet.text = "Runtime text change when clicked"
        textLabelOutlet.isHighlighted = true
        textLabelOutlet.backgroundColor = UIColor.blue
        let tap = UITapGestureRecognizer(target: self, action: #selector(changeBgColour(sender: )))
        textLabelOutlet.isUserInteractionEnabled = true
//        let tap2 = UITapGestureRecognizer(target: self, action: #selector(printlink(sender: )))
        textLabelOutlet.addGestureRecognizer(tap)
//        hyperlinkLabel.addGestureRecognizer(tap2)
        do {
            let str = try NSAttributedString(markdown: "*github* [link](https://github.com/) ")
            hyperlinkLabel.attributedText = str
            
        }
        catch {
            
        }
        
        // Login Button
        
//        let text =
//        let word = (text as NSString).range(of: "Word")
//        labelWithLink.attributedText =
        // Do any additional setup after loading the view.
    }

//    @objc func printlink(sender: UITapGestureRecognizer){
//        textLabelOutlet.text = hyperlinkLabel.attributedText as? String
//    }
    
    @objc func changeBgColour(sender: UITapGestureRecognizer){
        if(didTap) {
            textLabelOutlet.backgroundColor = UIColor.yellow
            didTap = false
        } else {
            textLabelOutlet.backgroundColor = UIColor.blue
            didTap = true
        }
    }
}

