import UIKit

enum sessionState : String{

    case connected = "dsfd"
    case connecting
    case lost

}

var user : sessionState = .connected

//sessionState.connected.rawValue = "dsfd" //Cannot assign to property: 'rawValue' is immutable :- ERROR
//Raw values can be of strings, characters, integers, or floating-point number types.
//Raw values can be of strings, characters, integers, or floating-point number types.

print(user.rawValue)

user = sessionState.connecting



print(type(of: user))

switch user {

case sessionState.connected :
    print("user got connected")
case sessionState.connecting:
    print("connecting")
default:
    print("def")
}

enum sessionState2 : CaseIterable {

    case connected // if i give parameter to any case then it will fail and say does not conform  to prootocol
    case connecting
    case lost

}

for cases in sessionState2.allCases {
    print(cases)
}

//var x:String?
//x = "dffd"
//if 9>8 , let xz = x{
//    print("dsfdsfd")
//    print(type(of: xz))
//}else
//{
//    print("dsffgdg")
//}
//

//enum db : Float {
//
//    case one = 8.99
//
//    case two
//
//}

//Swift enum Associated Values

enum laptop  {
    
    case color (String)
    case weight (Int)
    
}

laptop.color("dfdf")
laptop.weight(4)
var branch = laptop.color
print(type(of: branch))
print(type(of: laptop.color))


//var dicofarr : [[Int]:[Int]] = [
//
//    [3,4]:[5,6]
//
//]
//print(type(of: dicofarr))

// TUESDAY 14/03
// TUESDAY
// TUESDAY
//ENUM is group of related values
//enum should be capitalised just for the sake of convention

enum SocialMedia {
    
    case twitter
    case Facebook
    case linkedIn
    
}

func justForEnum (_ platform : SocialMedia ){
    
    switch platform {
        
    case .twitter:
        print("in twtr")
        
    case .Facebook:
        print("in FB")
        
    default:print("in default")
    }
}

let usingEnum : (SocialMedia)->() = { platform in
    
    switch platform {
        
    case .twitter:
        print("in twtr")
        
    case .Facebook:
        print("in FB")
        
    default:print("in default")
        
    }
    
}

usingEnum(.twitter)
justForEnum(.linkedIn)

enum SocialMedia2{
    
    static var twitter = 5
    static let Facebook = 6
    static let linkedIn = 7
    
}
print(type(of: SocialMedia2.twitter))
SocialMedia2.twitter = 4

print(SocialMedia2.Facebook)


//
//enum Laptop2 {
//
//  // associate value
//  case name(String)
//
//}
let gjhk = 5

enum RawValue : String,CaseIterable { //CaseIterable is protocol which returns collection of all cases
    
    case one = "one"
    case two = "two"
    case three = "Three"
    
}
print(type(of: RawValue.one.rawValue)) // string
print(RawValue.one.rawValue)

//
//RawValue.one.rawValue = "changed" //Cannot assign to property: 'rawValue' is immutable
  
for i in RawValue.allCases {
    print(i)
}

//you dont have to have ASSOCIATED VALUE for every case in enum
///you dont have to have ASSOCIATED VALUE for every case in enum

enum Mul {
    
    case insta(followers : ()->())
    case yt   (subs : Int)
    case twtr
}

func checkIncome (inc : Mul){
    
    switch inc {
        
//    case .insta(let follower ) where follower > 1000:
//        print("you are insta influencer ")
    case .insta(let x ) :
        x()
        print("cls executed")
    case .yt(var subs) where subs > 10000 :
        print("youtuber")
        
    case .yt :
        print("normal yt user")
        
    default : print("in def")
        
    }
    
}

checkIncome(inc: .insta(followers: {
    print("closure")
}))

checkIncome(inc: .yt(subs: 6 ))

//enum Mul2 : Mul { // can not take arr enum class in type 
//
//
//
//    case insta
//    case twtr
//}

//enum Beverage: CaseIterable {
//    case coffee, tea, juice
//}
//let numberOfChoices = Beverage.allCases.count
//print("\(numberOfChoices) beverages available")

//// Prints "3 beverages available"                                                                                     ---------------------
//In the example above, you write Beverage.allCases to access a COLLECTION that contains all of the cases of the Beverage enumeration.
//the collection’s elements are instances of the enumeration type, so in this case they’re Beverage values. T
//                                                              -------------

//As an alternative to associated values, enumeration cases can come prepopulated with default values (called raw values), which are all of the same type.As an alternative to associated values, enumeration cases can come prepopulated with default values (called raw values), which are all of the same type.
//Raw values are not the same as associated values. Raw values are set to prepopulated values when you first define the enumeration in your code, like the three ASCII codes above. The raw value for a particular enumeration case is always the same. Associated values are set when you create a new constant or variable based on one of the enumeration’s cases, and can be different each time you do so.
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
print(Planet.earth.rawValue)
//In the example above, Planet.mercury has an explicit raw value of 1, Planet.venus has an implicit raw value of 2, and so on.
//
//When strings are used for raw values, the implicit value for each case is the text of that case’s name.
//
//
//A recursive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases. You indicate that an enumeration case is recursive by writing indirect before it, which tells the compiler to insert the necessary layer of indirection.
//This enumeration can store three kinds of arithmetic expressions: a plain number, the addition of two expressions, and the multiplication of two expressions.

enum ArithMat{
    
    case number(Int)
    indirect case add (ArithMat,ArithMat)
    indirect case mul (ArithMat,ArithMat)
}

let five = ArithMat.number(5)
let sixe = ArithMat.number(6)
let addd = ArithMat.add(five,sixe)
let mul = ArithMat.mul(five ,sixe)
print(addd)

//Optional is actually an enum, defined in relation to a generic type Wrapped. It has two cases: . none to represent the absence of a value, and . some to represent the presence of a value, which is stored as its associated value of type Wrapped.

//hash value
//access modifier
//multiple init in cls struct
//conveinient designated init diff

