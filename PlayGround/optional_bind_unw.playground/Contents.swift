import UIKit

//OPTIONAL
/* so there is multiple ways to operate with optionals and names are forced unwrapping and optional binding
optional binding is much safer compared to first one */
var first : String?
first="undestanding opt"
//print(first!)//forced unwrapping much riskier
if first != nil{
    print("first has value")
}else
{
    print("value = nil")
}

if let ini = first {
    print("if first has \(ini)")
}else {print("no value move further")}
//Optionals are similar to using nil with pointers in Objective-C
//AUTOMATIC UNWRAPPING
var sec:String!
sec="pole"
if let yo = sec {
    print(yo)
}
else
{
    print("my str has val")
}

//typecasting with opt
//forced wn eays
//how many ways of opt bindi

//as ! ?

let some:Any?=7
print(some)
//let gh:Int=some
//print(gh)
//print(some)
var integerValue = 42
if(integerValue is Int){print("type checking")}
var stringValue = String(integerValue)
//var doubleValue = integerValue as! Double
var floatValue = integerValue as? Float
//floatValue=integerValue??
//if let floatValue = floatValue{
//    print(floatValue)
//}
//
if let x = floatValue{
    print(type(of: x))
}else{print("hhj")}


//print(floatValue)
//if(doubleValue is Optional<Double>) {print(type(of: doubleValue))}
//print(stringValue)
//as! for force downcasting
//as? for optional downcasting
//When you upcast, you cast from a subclass to a superclass (upwards)
//When you downcast, you cast from a superclass to a subclass (downwards)
/*An expression that uses as? will return an optional value. When the downcast fails, the expression returns nil. When it succeeds, it returns a value.
 An expression that uses as! will return a non-optional value. When the downcast fails, your code crashes with a fatal error. When it succeeds, it returns a value.*/
//There is only seven ways to unwrap an optional in Swift
//var a : String?="hello"
//var x:String = a!//forced unwr
//var a = x!//implicit
//guard
//opt binding
// chaining
//pattern
print(floatValue)
var opt:String?
//guard let hellox = opt else {
//
//    print("only two ways for optional binding")
//
//}

var str:String?
str="jhs"
var jhg = str ?? "helaf"
//var uio:Int?
//
//print(uio!)
class A {
    
}
class B : A {
    
}
var someNum:A = A()
var dfdfdg = someNum ?? B()
print(type(of: dfdfdg))

var ty = true
print(ty.hashValue)
ty = false
print(ty.hashValue)
var yuui = true
print(yuui.hashValue)
//var dict : [Bool:Int] = [true:1 , true : 2, false :3]
//print(dict[true].hashValue)

var dic : Int?

dic  =  5

var temp: Any?
//

print(temp)

var temp2 = Int(123.25)
print("TEmp: ", temp2)


//print(dic as? Double)
//dic=nil
print(type(of: dic))

let anotherCharacter: Int = 3
switch 1 {
case ((anotherCharacter%2)):
    print("The letter A")// Invalid, the case has an empty body

   
default:
    print("even")
}

let forTuple = (5,6)

print(type(of: forTuple))

switch forTuple {
    
case let (x,y) where x==(y-1):
    print("executed")
    
default:
    print("def")
}


var anArray:[[String:[String]]] = [ //array of dictionary ,values as array
               [//str : arr
                "name" : [ "One", "Two", "Three" ]
               ],
               [ "name" : [ "Four", "Five", "Six" ] ],
               [ "name" : [ "Seven", "Eight", "Nine" ] ]
]
print(type(of: anArray))

for dictionary in anArray {
    
    for (_, value) in dictionary {
        
        for val in value {
            
            print(val)
            
        }
        
    }
    
}

var secArray = [
    [
        
        1: [1:"semidict1"]
    
    ],
    [
        2: [3:"semidict1"]
    
    ]
]
print(type(of: secArray))

for i in secArray {
    
    for (key,value) in i {
        
        for (k,v) in value {
            print(k,v)
        }
    }
}

for i in secArray {
    
    for (key,value) in i {
        
        print(key)
    }
}

var dictOfArr:[[Int]:[String]] = [
    
    [1,2,3]:["shubham","Bhatt"],
    [4,5]:["darshan","dangar"],
    [6,7]:["Shyam","Buhecha"]
    
]

print(type(of:dictOfArr) )

for (key,val) in dictOfArr {
    
    for k in key {
        print(k)
    }
}
