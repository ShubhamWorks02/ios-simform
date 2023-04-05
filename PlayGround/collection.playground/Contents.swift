import UIKit
//SET IS HASHABLE STRUCT
//Set is a collection and implements Collection.hashableCollection
let arr = [34,4,45,6,676]

arr.forEach {
    
    print($0)
    
}

var set : Set = [45,6,6,7,3,1]

print(set.distance(from: set.startIndex, to: set.firstIndex(of: 7)!))

var set2 : Set = [6]
set.forEach {
    
    print(set2.insert(set.remove($0)!))
    
}
//opt binding for removed value
if let removed = set2.remove(45) {
    
print(type(of: set2.remove(45)))
    print(set2)

}
else {
    print("is not removed")
}
print( type(of: set2.remove(6)) )
let tyyi = set2.remove(at: set2.index(set2.startIndex, offsetBy:0))
print(type(of: tyyi))
print(type(of: set2.remove(at: set2.index(set2.startIndex, offsetBy:0))))


//index aapine remove karo to type int
// element value aapine remove karo to type optional

set2.insert(7)

//Set operations in Swift

var a: Set = [1, 3, 5, 7, 9]
let b: Set = [0,1,2, 4, 6, 8]
//a.formUnion(b) insert the sub seq
//var tyud = a.sorted()
//print(tyud)
//var tyud  = a.

print(a.sorted())//also gives sorted array
let c = a.union(b)
print(a.symmetricDifference(b))
print(a.popFirst())//not just pops it but it removes and give and in remove method it just removes it
print(a.count)
print(a.popFirst())
print(a.count)
a.reversed()
print(a.subtracting(b))
print(type(of: c))

print(a.intersection(b))

let sfdf: String? = ""
let sdfdf: String? = ""
 
if let helo =  sfdf , let hellow = sdfdf {
    print(type(of: helo),type(of: hellow))
}
//else{
//    print()
//}
//var greetings: [String]? = ["Howdy!", "Hello!"]
//var salutations: [String]? = ["Hi!", "Hey!"]
//if let g = greetings, let s = salutations {
//    print(g)
//    print(s)
//}
func lol() {
    
    guard let x = sfdf, 9>8,10>9 else {
        
        print("condi wrng")
        return
    }
    
    print("true")
    
}

lol()


let numbers = [1, 2, 3, 4, 5]

for number in numbers {
    print(number)
}

numbers.forEach {
    print($0)
}


var z : Int? = nil
z = 10

print(z)

//Void is basically empty tuple

//var integ : Int = 1

//switch integ {
//
//case 2:
//    break
//
//case 3:
//    break
//
//default:break
//}
    
//var stones : Set<String> = ["Amethist", "Lapis Lazuli", "Emerald"]
//var stones1 : Set<String> = []
//var stones1 : Set<String> = []

//print(stones)
//Merging two Dict
var dict: [Int:Int] = [1:2]
var dict1: [Int:Int] = [1:4]
print(dict)
//dict+=dict1
print(dict)
dict.merge(dict1){( _, second) in second}//with combining closure


dict1.merge(dict){(first, _) in first }
print(dict1)

for (key,value) in dict1 {
    
    dict.updateValue(value, forKey: key)//with for loop
    
}
print(dict)

for (index,value) in numbers.enumerated(){
    
    print(" \(index) has \(value)")
    
}

var ab = Array(set2)//converting set into array

print(ab)

var set3 : Set<Int> = Set( ab)
print(set3)

if let xyz = a.remove(1){//binding
    
    print(type(of: xyz),xyz)
    
}
else
{
    
    print("in else")
    
}

for i in set3.sorted(){
    print(i)
}

var houseAnimals: Set<String> = []
var farmAnimals: Set<String> = []

print(type(of: farmAnimals))
print(farmAnimals.isSuperset(of: houseAnimals))

print(farmAnimals.isSubset(of: houseAnimals))
print(farmAnimals.isDisjoint(with: houseAnimals))

//farmAnimals = ["dgser","gfgf","dfdf"]

farmAnimals.forEach{
    
    print($0)//for each in sets
    
}


var setA: Set = [1, 3, 5]
let setB: Set = [3, 5, 1]

if setA == setB {
  print("Set A and Set B are equal")
}
else {
  print("Set A and Set B are different")
}

print(setA.elementsEqual(setB))
print(setA.sorted().elementsEqual(setB.sorted())) //.elementEqual checks for element and also for same order
for i in setA {
    
    print(setA.remove(setA.randomElement()!))
    
}
print(setA.count)

print(setA.randomElement())
///////////////////////////
///////////////////////////
//TYPEALIASE

typealias helo = Set
typealias Void = String
//var newdg : Void = "dshghefs"
//print(newdg)

typealias String = Double
var newDouble : String = 4
print(newDouble)



