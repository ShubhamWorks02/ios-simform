import UIKit

var hello:Bool?
//print(hello)//nil
var gh:Int=5
var another:Bool=false

another=hello ?? ((gh==5) ? true : false)

print((gh==5) ? "true": "false")
print(another)
////String Starting
var str="\0"
print(str)//will print a blank line
print()
str=str+"\\"
print(str)
str=#"""
 sentence with quotation """
"""#
print(str)
var empt=""
print(empt)
empt=String()
print(empt)
print((empt.isEmpty) ? "is empty" : "not a empt one" )
str="hello.\nshubham"
str="hello.\tshubham"
str="hello. \r shubham"

print(str)
print(str.split(separator: " "))
str="for ops"
str.append("on string")
print(str)
var second:String="opswA"
print(second.split(separator: ""))
str.append(contentsOf:second )
print(str)//for opson stringopsw
print(str.count)
print(str.hashValue)
print(str.max())
print(str.contains("or"))
print(str.hasPrefix("for"))//true
print(str.uppercased())
print(str.reversed())

//empt="AZa"
print(empt.max())
for char in str{
    print(char,terminator: " ")
}

print("prefix".hasPrefix("pre"))
print("prefix".hasSuffix("fix"))
var num:String="567"
var eq:String="567"
print(num==eq)
print(num[num.startIndex])

num.insert("h", at: num.index(num.startIndex, offsetBy: 2))
print(num)
num.remove(at: num.firstIndex(of: "7")!)
print(num)
num.insert("p", at: num.firstIndex(of: "5")!)
print(num)
num.remove(at: num.firstIndex(of: "5")!)
print(num)
num.insert("l", at:num.endIndex)

print(num.replacingOccurrences(of: "l", with: "6"))
print(num)

print(num.dropLast())

print(num.dropLast(1))
print(num.removeFirst())
print(num)
let arr : [Character]=["s","h","u"]
let sr=String(arr)
print(sr)
print(type(of: sr))
let four="4" as Character
print(four.isASCII)
print(four.isNumber)
print(num.startIndex)
let start=num.startIndex
let end=num.endIndex
print(num[start])
num.insert("j", at: end)
print(num[num.index(start, offsetBy: 3)])
print(num)
print(num[num.index(end, offsetBy: -2)])
print(num.indices)
var heay:String="shubham"
for index in heay.indices {
    print(heay[index],terminator:"")
}
//SubString
let greeting="good morning"
let subs=greeting.firstIndex(of: " ") ?? greeting.endIndex
var s2=greeting[..<subs]
print(s2)//good
/////
s2.insert("i", at: s2.index(s2.startIndex, offsetBy:3))
print(s2)
/////////
if var range = s2.firstRange(of: "oo"){
    
    s2.replaceSubrange(range, with: "vv")
    
}
print(s2)
////SWITCH////
let day=2
switch day {
case 1:
    print("monday")
   
case 2:
    print("TUesday")
    break;
    //break
    //fallthrough
case 3:print("wed")
default:print("in default")
}
//if else

if 5>3 {
    print("hellop")
}
func hell (){
    guard 3>5 else {
    print("in guard")
    return
}
    print("out of guard")
}
hell()
print("guard ended")

// Array
////
//////
 var number=Array<Int>()
print(number.count)
number.append(5)
print(number.count)
//var number :[Int]=[]
var arr2 :[Int]=Array(repeating: 0, count: 5)
print(arr2)
//var number2 :[Int]=[]
//print(number2.capacity)
for index in 1...4 {
    
    arr2.append(Int.random(in: 1...100))
}
print(arr2)
arr2.insert(897, at:3)
print(arr2)
arr2.remove(at: 3)
print(arr2)
//print(arr2.last)
//print(arr2.firstIndex(of: 95))
//print(arr2.self)
//print(arr2.distance(from: 32, to:70))
//print(arr2.dropLast())
//print(arr2.swapAt(5,7))
arr2.sort()
arr2.sort(by: >)
print(arr2)
var arr3 = ["shubha","dfdf"]
//arr3.insert("null", at: 1)
//print(arr3)
//arr3.removeAll()
//print(arr3.count)
//arr3.removeLast()
//print(arr3)
let hours = 12
let hourInterval = 3
for tick in stride(from: 3, through: hours, by: hourInterval){
    print(tick)
}
//var ghj="jkl"
//var dsfs="dffg \(ghj) dsdf"//output:dffg jkl dsdf

//print(dsfs)
for nums in arr3 {
    print(nums)
}
var first : [Int:String]=[:]
first = [8:"dfjldf"]
first.updateValue("sdfd", forKey: 8)
first[6]="df"
print(first)
var sec : Dictionary<Int,String>=[:]
sec=[1:"hello",2:"how",3:"are",4:"you"]
print(sec.keys.sorted(by: <))
print(sec.values.sorted(by: <))
print(sec.updateValue("who", forKey: 2))
print(sec)
let x = Array(sec.values)
print(x)
sec.removeValue(forKey: 1)
print(sec)
sec.updateValue("hello", forKey: 1)
print(sec)
for (key,value) in sec.sorted(by: >) {
    print("number is \(key) and value \(value)")
}
var ex = ["dsf","dff","fdf"]
var djfj=ex.joined(separator: ",")
print(djfj)
var nbv = ex.joined()
print(nbv)
print(ex.indices)
var indg=0

for kj in ex {
    print("index : \(indg) having value \(kj)")
    indg+=1
}
ex.shuffle()
print(ex)
var ui : [Any] = ["dfsf",9,"k"]
print(ui)

//array of dictionaries
var array : [[String:Int]]=[]
array.append(["Shubham":5])
print(array)
array.append(["name": 8, "age": 25])
print(array.count)
let namet = array[0]["name"]
////////////////

