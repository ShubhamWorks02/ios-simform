import UIKit

//Structure is basic building block of program
//You need to make instances of that structure to make use of structure properties.

//value type
//Unlike the C structures and Object-C structures, the Swift structures don't require implementation files and interface. Also, Swift structures allow us to create a single file and to extend its interface automatically to other blocks.

struct Amount {
    
    var money : Int?
    var paisa : Int
    var jkk : A

}



class A {
    var xz : Int = 9
}

var zxz = A()
//print(zxz.xz)
//
//Structures are used to encapsulate simple data values.
//Structures are used to copy the encapsulated data and its associated properties by 'values' rather than by 'references'.


var x = Amount(money: 5, paisa: 6,jkk: zxz)
print(zxz.xz)
x.jkk.xz = 0
print(x.jkk.xz) // classes are ref type experimented

//print(type(of: x))
//print(x.money ?? 0)
//print(x.money)
//
//Use structures by default.
//
//Use classes when you need Objective-C interoperability.
//
//Use classes when you need to control the identity of the data you’re modeling.
//
//Use structures along with protocols to adopt behavior by sharing implementations.
//

struct Point {
    
    var x : Double = 0
    
    var y : Double = 0
    
//   init(x:Int,y:Int) {
//
//        self.x = x
//        self.y = y
//
//    }
    
    func distance(to other: Point) -> Double {
        
        let dx = self.x - other.x
        let dy = self.y - other.y
        return sqrt(dx*dx + dy*dy)
      }
}

var z = Point(x: 4, y: 5)
var d = Point(x: 1, y: 2)
print(z.x)
print(z.distance(to: d))

class VideoMode {
    
    var name : String?
    let frameRate = 5.6
    var resolution = Point(x:1,y:2)
    
}

var vid = VideoMode()
vid.resolution.x = 90.5
print(vid.resolution.x)//struct are value types experiment
print(d.x)

//Unlike structures, class instances don’t receive a default memberwise initializer. Unlike structures, class instances don’t receive a default memberwise initializer.
//In Swift, Self refers to a type – usually the current type in the current context. Just as lowercase self can mean any current object, uppercase Self can mean just about any current type. It’s intriguing!
//In Swift, Self refers to a type – usually the current type in the current context. Just as lowercase self can mean any current object, uppercase Self can mean just about any current type. It’s intriguing!


//req value
//init multiple



struct Rectangle {
    
  let width: Double
  var height: Double

  init(width: Double, height: Double) {
    self.width = width
    self.height = height
  }
    init (){
        
        self.width = 5.6
        self.height = 0
    }
  func area() -> Double {
    return self.width * self.height
  }
}


class Developer{
    
    var name : String
    var jobTitle : String
    var exp : Int?
    
    init(name : String,jobTitle : String,exp:Int){ //'nil' is the only return value permitted in an initializer

        self.name = name
        self.exp = exp

        self.jobTitle = jobTitle

    }
    init (name : String,jobTitle : String){ //'nil' is the only return value permitted in an initializer

        self.name = name
//        self.exp = exp

        self.jobTitle = jobTitle

    }
}
var dev = Developer(name: "shubham", jobTitle: "NativeDev", exp: 1)
print( type(of: dev))

var dev2 = Developer(name: "shubham", jobTitle: "NativeDev")
print( type(of: dev2))

//class Developer2{
//
//    var name : String
//    var jobTitle : String
//    var exp : Int?
//    init (name : String,jobTitle : String){ //'nil' is the only return value permitted in an initializer
//
//        self.name = name
////        self.exp = exp
//
//        self.jobTitle = jobTitle
//
//    }
//    let x = {
//        print("dfdf") //CLOSURE
//    }
//}
//var fgfd = Developer2(name: "", jobTitle: "")
//fgfd.x()


class iosDev : Developer {
    
    var techStack  : String
//    init (name  :String){
//        super.init(name: <#T##String#>, jobTitle: <#T##String#>)
//        super.name = "bhatt"
//    }
    init(techStack  : String){
        //self.name = "dfdft"
        self.techStack = techStack
        super.init(name: "from ", jobTitle: "iosdev") // parent manipulation
       
    }
}
var dsfsdsf = iosDev(techStack: "ios xcode")
print(dsfsdsf.name , dsfsdsf.jobTitle)

print(type(of: dsfsdsf))

