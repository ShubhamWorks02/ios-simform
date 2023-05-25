//
//  PickerViewController.swift
//  TableViewCollectionViewCollectionView
//
//  Created by Shubham Bhatt on 24/05/23.
//

import UIKit

class PickerViewController: UIViewController {
    
    // MARK: OUTLETS
    @IBOutlet weak private var txtItem: UITextField!
    let itemList = ["toy", "cutlery", "remote", "nothing"]
        let pickerView = UIPickerView()
        let toolbar = UIToolbar()

        override func viewDidLoad() {
            super.viewDidLoad()
            setupPickerView()
            setupToolbar()
            txtItem.inputView = pickerView
            txtItem.inputAccessoryView = toolbar
            
        }
        
        func setupPickerView() {
            pickerView.delegate = self
            pickerView.dataSource = self
            pickerView.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
            pickerView.center = view.center
            view.addSubview(pickerView)
        }
        
        func setupToolbar() {
            toolbar.sizeToFit()
            let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneBtnPressed))
            toolbar.items = [doneBtn]
        }
        
        @objc func doneBtnPressed() {
            let selectedItem = itemList[pickerView.selectedRow(inComponent: 0)]
            txtItem.text = selectedItem
            txtItem.resignFirstResponder()
        }
}

extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return itemList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Row \(row) is selected in component \(component)")
    }
}
//var itemList = ["toy","cuttlery","remote","nothing"]
//
//let toolbar = UIToolbar()
//override func viewDidLoad() {
//    super.viewDidLoad()
//    let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
//    let pickerView = UIPickerView(frame: containerView.bounds)
//
//    pickerView.delegate = self
//    pickerView.dataSource = self
//    containerView.addSubview(pickerView)
//    containerView.center = view.center
//    view.addSubview(containerView)
//    tfItem.inputView = pickerView
//    toolbar.sizeToFit()
//    let doneBtn = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(doneBtnPressed))
//    toolbar.items = [doneBtn]
//    tfItem.inputAccessoryView = toolbar
//    // Do any additional setup after loading the view.
//}
//
//@objc func doneBtnPressed() {
//    let selectedItem = itemList[pickerView.selectedRow(inComponent: 0)]
//    tfItem.text = selectedItem
//    self.view.endEditing(true)
//}
//
//}
//
//extension PickerViewController: UIPickerViewDelegate,UIPickerViewDataSource {
//func numberOfComponents(in pickerView: UIPickerView) -> Int {
//    return 1
//}
//
//func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//    return itemList.count
//}
//
//func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//    return itemList[row]
//}
//
//func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//    print("row \(row) is selected in component\(component)")
//}
//
