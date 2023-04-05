import UIKit

//class Overr {
//
//    var  x : Int = 0
//
//
//    class func stats (){
//
//        print("class function")
//    }
//     static func stats (){
//
//        print("static function")
//
//    }
//
//
////    func stat2(){
////
////    }
//}
//
//
//class Inheri  : Overr {
//
////    override func stats(){
////
////    }
//}
//
//var xs = Inheri()
////xs.
//
//class MyClass {
//    class func classMethod() {
//        print(" class method")
//    }
//
//    static func staticMethod() {
//        print("static method")
//    }
//    func export (){
//        print("exp")
//    }
//    let x = {
//        print("dsfgd")
//    }
//
//}
//
//class MySubclass: MyClass {
//    override class func classMethod() {
//        print("subclass method")
//    }
//}
//
//let myObj = MySubclass()
//MyClass.classMethod() //  class method
//MySubclass.classMethod() // subclass method
//MyClass.staticMethod() // static method
//MySubclass.staticMethod() // "static method
////myObj.staticMethod() //Error
//class Class {
//    let x = {
//        print("dsfgd")
//    }
//    enum EnuInClass : String{
//        case a = "sdf"
//        case b
//    }
//}
//var cls = Class()
//cls.x()
//var a = Class.EnuInClass.a.hashValue // .rawValue also possible
//print(a)
////Class.EnuInClass = Class.EnuInClass.a
////print(Class.EnuInClass.a)

//METHODS
//METHODS
//
//class calculations {
//   let a: Int
//   let b: Int
//   let res: Int
//
//   init(a: Int, b: Int) {
//      self.a = a
//      self.b = b
//      res = a + b
//   }
//
//   func tot(c: Int) -> Int {
//      return res - c
//   }
//
//   func result() {
//      print("Result is: \(tot(c: 20))")
//      print("Result is: \(tot(c: 50))")
//   }
//}
//let pri = calculations(a: 600, b: 300)
//pri.result()
//print("mehtods in class")

//access modifier
//ACESS CONTROL
//
//open class Class1 {
//     var x : Int
//     init(){
//         self.x = 0
//     }
//
//}
//
//var class1 = Class1()
//
//

struct Point {
    
    var x = 0.0, y = 0.0
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double) { //mutating
                                                                //mutating
        x += deltaX
        y += deltaY
        //self = Point(x: x + deltaX, y: y + deltaY)
        
    }
}

var point = Point(x: 10.0, y: 20.0)
point.moveBy(x: 5.0, y: 5.0)
print("The point is now at (\(point.x), \(point.y))")


class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
   
}

let counter = Counter()
counter.increment(by: 59)
print(counter.count)

let cout2 = counter
cout2.increment(by: 55)
print(cout2.count)


