import UIKit
//
//extension sometype : SomePROtocol{
//
//}

extension Double {

    var km : Double {
        return self*1000
    }
    var m: Double { return self }
        var cm: Double { return self / 100.0 }
        var mm: Double { return self / 1_000.0 }
        var ft: Double { return self / 3.28084 }
}
var meter : Double = 5.km
var meter1 = meter
print( meter1)

class A {
    
}
extension A {
    var x : Int  {return 5} //computed prop
}
var hj = A()
//hj.x = 5 //Cannot assign to property: 'x' is a get-only property
var te = hj
//Extensions can add new computed properties, but they can’t add stored properties, or add property observers to existing properties.
//Extensions can add new computed properties, but they can’t add stored properties, or add property observers to existing properties.

//Extensions can add new convenience initializers to a class, but they can’t add new designated initializers or deinitializers to a class. Designated initializers and deinitializers must always be provided by the original class implementation.
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size : Size
    
}

//let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
    size: Size(width: 5.0, height: 5.0))

extension Rect {
    
    init (center : Point , size : Size){ //convienience init
        print("ext called")
        let oriX = center.x + size.width
        let oriY = center.y + size.height
        self.init(origin:  Point(x: oriX,y: oriY), size: size)
    }
}
var rect = Rect(center: Point(x: 2.0, y: 2.0),size: Size(width: 5.0, height: 5.0))

extension A {
    
    var newCompProp : Int {
        return 1
    }
     
    
}
var edds = A()
edds.newCompProp

extension Int {
    
    func repeating ( num : ()->()){
        
        for _ in 0...self {
            num()
        }
    }
    mutating func sq (){
        self = self*self
    }
    
    subscript (a : Int)->Int {//how to get the Nth last digit for an Integer
        var temp = self       ////how to get the Nth last digit for an Integer
        var count = 0
        var getva = 0
        while(temp>0){
            getva =  temp%10
            temp = temp/10
            count+=1
            if count == a{break}
        }
        return getva
    }
  
}
7.repeating {
    print("prinitng this many times")
}


var someInt = 3
someInt.sq()

print(155418446[5])

extension Int {
    
    enum Kind {
        case pos,neg,zero
    }
    var kind : Kind {
        switch self {
        case 0 :
            return .zero
        case let x where x < 0:
            return .neg
        default :
            return .pos
        }
    }
}
var arr = [0,-1,22]
func printKind (arr : [Int]){
    
    for ar in arr {
        switch ar.kind {
        case .neg:
            print("negative : \(ar)")
        case .pos:
            print("positivi : \(ar)")
        default :
            print("zero")
        }
    }
}
printKind(arr: arr)
(-7889).kind

class Abc {
    
    var i : Int
    var o : Int
    init(i : Int,o : Int){
        self.i = i
        self.o = o
    }
    
}

extension Abc {
    
   convenience init(){
        
       self.init(i: 5,o: 6)
       
     
    }
    
}
var abc = Abc()
abc.i
