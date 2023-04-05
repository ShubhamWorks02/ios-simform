import UIKit

protocol SomeProtocol
{
    var x : Int { get set}
    var y : Int {get}
}
//
//struct SomeStruct : SomeProtocol{
//
//}
//
//If a class has a superclass, list the superclass name before any protocols it adopts, followed by a comma:
//
//class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
//    // class definition goes here
//}
//Always prefix type property requirements with the static keyword when you define them in a protocol. This rule pertains even though type property requirements can be prefixed with the class or static keyword when implemented by a class:
//
//protocol AnotherProtocol {
//    static var someTypeProperty: Int { get set }
//}

//--------------------
//The FullyNamed protocol requires a conforming type to provide a fully qualified name. The protocol doesn’t specify anything else about the nature of the conforming type — it only specifies that the type must be able to provide a full name for itself. The protocol states that any FullyNamed type must have a gettable instance property called fullName, which is of type String.

//Here’s an example of a simple structure that adopts and conforms to the FullyNamed protocol:
protocol FullyNamed{
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String //
    //var number : Int
}
let john = Person(fullName: "John Appleseed")

struct Person1{
    
    var fullName: String //
    //var number : Int
}
let john1 = Person1(fullName: "Shubham")

class Ship : FullyNamed,SomeProtocol1 {
    
    var name : String
    var prefix  :String?
    var fullName: String {
        return(self.prefix != nil ? prefix! + " " : "")
    }
    init (name : String , prefix : String? = nil){
        self.name = name
        self.prefix = prefix
    }
   static func TypeMethod (){
       print("")
   }
}

var chandraYaan = Ship(name: "Rover" , prefix: "Moon")
print(chandraYaan.fullName)
//Method Requirements
//Protocols can require specific instance methods and type methods to be implemented by conforming types. These methods are written as part of the protocol’s definition in exactly the same way as for normal instance and type methods, but without curly braces or a method body. Variadic parameters are allowed, subject to the same rules as for normal methods. Default values, however, can’t be specified for method parameters within a protocol’s definition.
protocol SomeProtocol1
{
    static func TypeMethod ()
}
//
//extension UIViewController {
//    var  x : UIScene {
//       // return UIScene.ActivationState
//        return
//    }
//
//}
//var y : UIViewController

//UIelement
//Category
//defi //dec opt proto // mandatory proto diff // data source // delegate //data passing // delegate one to many one to one //memory effect proto
//1. Factor : Source code
//Categories provide a way to add methods to a class even if its source code is not available to you. ex: NSString
//Extensions are only possible if the source code is available , because compiler compiles the extension & source code at same time.
//2. Factor : Instance variable/Properties
//Category : Not possible
//Extensions : Possible
//3. Factor : Accessibility to Inherited classes.
//Category — All methods defined inside a category are also available to the inherited class
//Extensions — All properties and methods defined inside a class extension are not even available to inherited class.
//When to use :
//Use category when you need to want to add any methods to a class whose source code is not available to you OR you want to break down a class into several files depending on its functionality.
//Use class extensions when you want to add some required methods to your class outside the main interface file. Also when you want to modify a publicly declared variable in the main interface file .
//
//
//Difference between Objective-C category and Swift extension :
//
//Mostly Objective-C category and Swift extension are same.
//
//Diff :
//
//In Objective-C category, Computed property/variable can not be declared.
//In Swift extension, Computed property(not stored property) can be declared.
//
//class A {
//    var x : Int?
//}
//class B : A {
//
//}
//var b  = B()
//b.y// cannot use
//extension A {
//    var y : Int {return 5 }
//}
//b.y //can use
//protocol SomeProtocol {
//    init(someParameter: Int)
//}
//
//You can implement a protocol initializer requirement on a conforming class as either a designated initializer or a convenience initializer. In both cases, you must mark the initializer implementation with the required modifier:
//
//class SomeClass: SomeProtocol {
//    required init(someParameter: Int) {
//        // initializer implementation goes here
//    }
//}
class A : SomeProtoCol{
    var x : String?
    required init(name: String) {
        self.x = name
    }
}

protocol SomeProtoCol {
    init(name : String)
}

var a = A(name: "hello")

class B : A{
    var n : Int
     init(n : Int, name : String){
         self.n = n
         super.init(name: name)
    }
   required init(name : String){
       self.n = 5
       super.init(name: name)
         
    }
   
}

//struct ini : SomeProtoCol {
//    var y : String
//    init(name: String) {
//        self.y = name
//    }
//}

//class Dice {
//    let sides: Int
//    let generator: RandomNumberGenerator
//    init(sides: Int, generator: RandomNumberGenerator) {
//        self.sides = sides
//        self.generator = generator
//    }
//
//    func roll() -> Int {
//
//        return Int(generator.random() * Double(sides)) + 1
//    }
//}
//protocol RandomNumberGenerator {
//    func random() -> Double
//}
//var die = Dice(sides: 4, generator: LinearCongruentialGenerator())

//Delegation
//Delegation

struct Cookie {
    
    var  size:Int = 5
    var hasChocolateChips:Bool = false
    
}
class Bakery {
    
    var delegate : BakeryDelegate?
    
    func makeCookie (){
        
        var cookie =  Cookie()
        cookie.size = delegate?.preferredCookieSize() ?? 6
        cookie.hasChocolateChips =  true
        delegate?.cookieWasBaked(cookie)
        
    }
}

protocol BakeryDelegate {
    
    func cookieWasBaked(_ ccokie : Cookie)
    func preferredCookieSize() -> Int
    
}

class CookieShop: BakeryDelegate
{
    func cookieWasBaked(_ cookie: Cookie)
    {
    
        print("Yay! A new cookie was baked, with size \(cookie.size)")
        
    }
    func preferredCookieSize() -> Int {
        return Int.random(in: 0...100)
    }
}
//Yay! A new cookie was baked, with size \(cookie.size)

let shop = CookieShop()

let bakery = Bakery()
bakery.delegate = shop
bakery.makeCookie()
//
//The UITableView class uses the UITableViewDelegate and UITableViewDataSource protocols to manage table view interaction, displaying cells, and changing the table view layout
//The CLLocationManager uses the CLLocationManagerDelegate to report location-related data to your app, such as an iPhone’s GPS coordinates
//The UITextView uses the UITextViewDelegate to report about changes in a text view, such as inserted new characters, selection changes, and when text editing stops
//When you look at these three delegate protocols, you quickly see one common pattern: Every one of the events that are delegated are initiated by a class outside your control, the user, the operating system or its hardware.
//
//Let’s have a look:
//
//GPS coordinates are provided by the GPS chip, and are delegated to your code whenever the chip has a fix on a GPS position
//A table view uses a mechanism to display cells on screen, and it needs you to provide these cells when they’re needed according to the table view
//A text view responds to arbitrary user input, and calls on delegate functions accordingly
//UITableViewDataSource




//
//Delegation, and the delegation pattern, is a lightweight approach to hand-off tasks and interactions from one class to another.
//You only need a protocol to communicate requirements between classes. This greatly reduces coupling between classes.
//And it separates the responsibilities of the class that generates interactions from the class that responds to these interactions.


//Delegation vs. Subclassing
//An compelling alternative to delegation is subclassing. Instead of using a delegate to get GPS location updates from CLLocationManager, you simply subclass that manager class and respond to location updates directly.
//
//This has a massive disadvantage: you inherit the entire CLLocationManager class, for something as simple as getting a bit of location data. You would need to override some of its default functionality, which you either have to call directly with super or replace entirely.
//
////And lastly, subclassing creates a tightly-coupled class hierarchy, which doesn’t make sense unless your subclass is similar in nature to the class you’re subclassing. This is not likely if you’re merely responding to GPS location updates.
//
protocol ex {

    var x : Int {get }

}

class Yu : ex {

    var x : Int {
            return 5
//        get {
//            return 5
//        }
//
//
//        set(newValue) {
//            self.x = newValue
//        }
    }

}

class Shubham {
    
    
    
}

extension Shubham : ex{
    
    var x : Int {
        return 5
    }
}

var shubham = Shubham()
shubham.x


protocol TextRepresentable {
    var textualDescription: String { get }
}
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}
//
//How to make optional protocol methods

protocol Printable : AnyObject{
    func canPrint(condi : Bool) -> Bool
}

extension Printable {
    func canPrint(condi : Bool = false) -> Bool {
        return condi
    }
}
//struct hello : Printable { //Non-class type 'hello' cannot conform to class protocol 'Printable'
//
//}
class Shubham1 : Printable{
    
    func canPrint(condi: Bool) -> Bool {
        return  condi
    }
    
}
var shu = Shubham1()
//shu.canPrint()
shu.canPrint(condi: true)

struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}

let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
if twoThreeFour == anotherTwoThreeFour {
    print("These two vectors are also equivalent.")
}
// Prints "These two vectors are also equivalent."

//protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
//    // protocol definition goes here
//}
//
//protocol PrettyTextRepresentable: TextRepresentable {
//    var prettyTextualDescription: String { get }
//}
//
//This example defines a new protocol, PrettyTextRepresentable, which inherits from TextRepresentable. Anything that adopts PrettyTextRepresentable must satisfy all of the requirements enforced by TextRepresentable, plus the additional requirements enforced by PrettyTextRepresentable. In this example, PrettyTextRepresentable adds a single requirement to provide a gettable property called prettyTextualDescription that returns a String.
//
//
//Thrusday
//23/03


//------------------------------------------------------------------------------

protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}




typealias proto = Named & Aged // Composition Protocol

func confo  (combine : proto) { // Composition Protocol
    
    print(combine.name,combine.age)
    
}

class Pers : Aged,Named{
    var age : Int = 5
    var name: String = "default string"
}
confo(combine: Pers())


//------------------------------------------------------------------------------
//Checking for Protocol Conformance

protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}

class Country: HasArea {
    
    var area: Double
    init(area: Double) { self.area = area }
    
}

class Animal {
    
    var name : String?
    
}

let obj : [AnyObject] = [

    Circle(radius: 5.6),
    Country(area: 4.5),
    Animal()

]
//if let has = obj[0] as? HasArea {
//    print(type(of: has))
//}

for ob in obj {
    
    if let has = ob as? HasArea {
        print(has.area)
    }else {
        print("doesnt consist Area")
    }

}

//
//for ob in obj {
//
//
//  print(ob as! HasArea)
//
//}

//------------------------------------------------------------------------------

//Optional Protocol Requirements
//You can define optional requirements for protocols. These requirements don’t have to be implemented by types that conform to the protocol. Optional requirements are prefixed by the optional modifier as part of the protocol’s definition. Optional requirements are available so that you can write code that interoperates with Objective-C. Both the protocol and the optional requirement must be marked with the @objc attribute. Note that @objc protocols can be adopted only by classes, not by structures or enumerations.

//When you use a method or property in an optional requirement, its type automatically becomes an optional. For example, a method of type (Int) -> String becomes ((Int) -> String)?. Note that the entire function type is wrapped in the optional, not the method’s return value.


protocol RandomNumberGenerator {
    
    func randomNum ()->Int
    //func hello ()
    var x : Int {get}
    
}

extension RandomNumberGenerator {
    
    func randomNum()->Int{
        
        return Int.random(in: 0...Int.max)
        
    }
    var x :  Int {
        return 5
        
    }
}

class Abc : RandomNumberGenerator {
   
    var x : Int {
        return 1
    }
    
}

var abc = Abc()

abc.randomNum()
abc.x

//
//extension Array where Element : Equatable {
//
//    func allEqual ()->Bool{
//
//        for element in self{
//            if element != self.first{return false}
//        }
//        return true
//    }
//}

var arr1 = [2,3,4]
var arr2 = [2,3,4,5]



extension Array where Element : Equatable { //to find same element in same order
    
    func allEqual (arr : [Int])->Bool{
        
        if (arr.count != self.count){return false}
        
        var count = 0
        
        for element in self{
            
            if element as? Int != arr[count] {return false}
            count+=1
            
        }
        return true
    }
}

print(arr2.allEqual(arr: arr1))

 @objc protocol optPro {
     
    @objc optional func hello ()
     func hello2()
     
 }


