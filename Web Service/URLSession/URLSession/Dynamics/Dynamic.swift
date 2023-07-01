//
//  Dynamic.swift
//  URLSession
//
//  Created by Shubham Bhatt on 01/07/23.
//

import UIKit
class Dynamic<T> {
    
    // MARK: Typealias
    typealias Listener = (T) -> Void
    
    // MARK: Vars & Lets
    var listener: Listener?
    var value: T {
        didSet {
            self.fire()
        }
    }
    
    // MARK: Initialization
    init(_ v: T) {
        value = v
    }
    
    // MARK: Public func
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    internal func fire() {
        self.listener?(value)
    }
    
}
