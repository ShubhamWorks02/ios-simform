//: [Previous](@previous)

import Foundation

class A {
    
}
class B  : A {
    
}

class D {
    
}
//class C : B,D {
//
//}
class First {
    func doRunning() {
        print("Do Running from First")
    }
}

class Second {
    func doRunning() {
        print("Do Running from Second")
    }
}

//protocol First {
//    var height: Int {get set}
//}
//
//protocol Second {
//    var width: Int {get set}
//}
 
 
class MyClass: First, Second {
    var height: Int = 80
    
    var width: Int = 40
    
    func getAreaOfSquare() -> Int {
        return height * width
    }
}
 
var objc = MyClass()
objc.getAreaOfSquare()

