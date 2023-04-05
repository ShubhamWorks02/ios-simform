//: [Previous](@previous)

import Foundation


//Bool is Struct

class Person {

 // define two properties
 var name: String = "" //stored properties
 var age: Int = 0
}

var person1 = Person()

// assign values to properties
person1.name = "Kevin"
person1.age = 42

// access properties
print("Name:", person1.name)
print("Age:", person1.age)

//above was example of stored properties


//above was example of stored properties

//Computed properties

//Computed properties

class Calc {
    
    var num1: Int
    var num2: Int
    
    init(num1 : Int, num2 : Int){
        
        self.num1 = num1
        self.num2 = num2
        
    }
    
    var sum : Int {
        print("")
        func prnt (){
            print("calling function")
            
        }
        prnt()
        return num1 + num2
    }
}

var calculator = Calc(num1: 4, num2: 5)

print(type(of: calculator.sum) )
//
//var str = "gh"
//print(str[str.count-1])
//
var set : Set = [1,23,4]
//
//var str = "ddfdszfd"
//print(str.count)
//print(str[str.index(str.startIndex, offsetBy: 6)])
var i = set.firstIndex(of: 1)
print(type(of: i))

class Calculator {
    
    var num1: Int = 0
     var num2: Int = 0

     // create computed property
    var sum : Int {
        
        get {
            print("getter called")
           return num2+num1
            
        }
        set (amount){
            print("setter callld")
            num1+=amount
            num2+=amount
        }
        
    }
}
var obj = Calculator()
obj.num1 = 20
obj.num2 = 50

print("Get value:", obj.sum)

obj.sum = 5
print(obj.num1)
print("Get value:", obj.sum)
//
//In Swift, a static property is a property that belongs to a type rather than an instance of that type. This means that the value of a static property is shared across all instances of a type, and can be accessed without creating an instance of that type.

class University {

 // static property
 static var name: String?

 // non-static property
 var founded: Int = 0
    init(name : String?,found : Int){
        University.name = name
        self.founded = found
    }
}

// create an object of University class
var obj3 = University(name: "LD", found: 3)

// assign value to static property
//University.name = "Kathmandu University"
print(University.name ?? "default")

// assign value to non-static property
obj3.founded = 1991
print(obj3.founded)

//class FixedLengthRange {
//    var firstValue: Int
//    let length: Int
//    init(firstValue: Int, length: Int){
//        self.firstValue = firstValue
//        self.length = length
//    }
//}
//let rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
//// the range represents integer values 0, 1, and 2
//rangeOfThreeItems.firstValue = 6
//print(rangeOfThreeItems.firstValue )
//
//struct FixedLengthRange {
//    var firstValue: Int
//    let length: Int
//}
//var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
//// the range represents integer values 0, 1, and 2
//rangeOfThreeItems.firstValue = 6
//let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//// this range represents integer values 0, 1, 2, and 3
//rangeOfFourItems.firstValue = 6
//// this will report an error, even though firstValue is a variable property
///
//This behavior is due to structures being value types. When an instance of a value type is marked as a constant, so are all of its properties.
//
//The same isn’t true for classes, which are reference types. If you assign an instance of a reference type to a constant, you can still change that instance’s variable properties.
//A lazy stored property is a property whose initial value isn’t calculated until the first time it’s used. You indicate a lazy stored property by writing the lazy modifier before its declaration.
//A lazy stored property is a property whose initial value isn’t calculated until the first time it’s used. You indicate a lazy stored property by writing the lazy modifier before its declaration.

//You must always declare a lazy property as a variable (with the var keyword), because its initial value might not be retrieved until after instance initialization completes. Constant properties must always have a value before initialization completes, and therefore can’t be declared as lazy.
class DataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a nontrivial amount of time to initialize.
    */
    var filename = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property hasn't yet been created
print(manager.importer.filename)//now created instance

struct Calculator2 {
    
    var num1: Int = 0
     var num2: Int = 0

     // create computed property
    var sum : Int {
        
        get {
            print("getter called")
           return num2+num1
            
        }
        set (amount){
            print("setter callld")
            num1+=amount
            num2+=amount
        }
        
    }
}

strucSet.sum = 5

var strucSet = Calculator2(num1: 3, num2: 3)



struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// Prints "the volume of fourByFiveByTwo is 40.0"



// //alternative class , closure
// class func
//convenient
//how to restrict setter
class StepCounter {
    var totalSteps: Int = 5 {
        
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
                    if totalSteps > oldValue  {
                        print("Added \(totalSteps - oldValue) steps")
                    }
                }
            }
        }
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 2
        // About to set totalSteps to 200
        // Added 200 steps
        stepCounter.totalSteps = 360
        // About to set totalSteps to 360
        // Added 160 steps
        stepCounter.totalSteps = 896

@propertyWrapper
struct Fourteen {
     
    var number = 0
    var wrappedValue : Int {
        
        get {
            return number
        }
        set{
            number = min(newValue,14)
        }
    }
    init(wrappedValue: Int) {
           
           number = min(wrappedValue, number)
       }
}

//struct Recta {
//    @Fourteen var x : Int
//    @Fourteen var y : Int
//}
//var rec = Recta()
//print(rec.x)
//rec.x = 67
//print(rec.x)

struct impl {
    @Fourteen(wrappedValue : 45) var xt : Int
}
var imp = impl()
print(imp.xt)

//
//Instance properties are properties that belong to an instance of a particular type. Every time you create a new instance of that type, it has its own set of property values, separate from any other instance.

//You can also define properties that belong to the type itself, not to any one instance of that type. There will only ever be one copy of these properties, no matter how many instances of that type you create. These kinds of properties are called type properties.
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

var somes = SomeStructure()
print(SomeStructure.computedTypeProperty)

struct Rectangle5 {
    static var length = 10.0
    static var width = 5.0
    static var area: Double {
        length * width
    }
}
let areaValue = Rectangle5.area 
