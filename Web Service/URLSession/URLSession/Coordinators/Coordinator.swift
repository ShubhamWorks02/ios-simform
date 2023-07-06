//
//  Coordinator.swift
//  URLSession
//
//  Created by Shubham Bhatt on 01/07/23.
//
import UIKit

// Coordinator to manage the flow this method are requird to implement in every coordinator
@objc protocol Coordinator {

    var navigationController: UINavigationController { get set }
    @objc optional func popToVc()
}
