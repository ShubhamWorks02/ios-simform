import Foundation

//
//class A {
//
//    var x : Int
//    var y : Int
//    required init(z : Int){
//
////        self.x = 5
//        self.x = z
//        self.y = 6
//        //print(self.x)
//
//    }
//}
//
//class B  : A{
//
//    var z : Int
//    required init(){
//
//        self.z = 4
//
//        super.init(_ z : Int)
////        self.x = 1
////        print(self.x)
//
//    }
//}
//
//var b = B()
//
//struct Celsius {
//    var temperatureInCelsius: Double
//    init( fahrenheit: Double) {
//        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
//    }
//    init( kelvin: Double) {
//        temperatureInCelsius = kelvin - 273.15
//    }
//}
//let boilingPointOfWater = Celsius( kelvin: 212.0)

//class SurveyQuestion {
//    var text: String
//    var response: String?
//    init(text: String, respo : String?) {
//        self.text = text
//        self.response = respo
//    }
//    func ask() {
//        print(text)
//    }
//}
//let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?",respo:  "binding" )
//cheeseQuestion.ask()
//// Prints "Do you like cheese?"
//print(cheeseQuestion.response)
//cheeseQuestion.response = "Yes, I do like cheese."
//print(cheeseQuestion.response)

class Vehicle {
    var numberOfWheels: Int
    var color: String
    
    required init(numberOfWheels: Int, color: String) {
        print(" req  parent")
        self.numberOfWheels = numberOfWheels
        self.color = color
    }
}

class Car: Vehicle {
    var brand: String
    
//    init(brand: String, color: String) {
//        self.brand = brand
//        super.init(numberOfWheels: 4, color: color)
//    }
    init(brand : String,color : String){
        print("init Subc")
        self.brand = brand
        super.init(numberOfWheels: 4, color: color)
    }
    required init(numberOfWheels: Int, color: String ) {
        print("init req sub")
        self.brand = "Honda"
        super.init(numberOfWheels: numberOfWheels, color: color)
    }
}

let myCar = Car(brand : "maruti", color: "yellow")
print("My car has \(myCar.numberOfWheels) wheels, is \(myCar.color), and is a \(myCar.brand)") // Output: "My car has 4 wheels, is blue, and is a Honda"
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
//delegate in init
struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        print("default param called")
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        print("delegate")
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
    size: Size(width: 3.0, height: 3.0))



class Vehicle1 {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}


class Bicycle: Vehicle1 {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}


class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
//    convenience init() {
//        self.init(name: "[Unnamed]")
//    }
}
//let namedMeat = Food()
//print(namedMeat.name)

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
//    override convenience init(name: String) {
//        self.init(name: name, quantity: 1)
//    }
}
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
//disc rsult
//final
//deinit
//release notific
