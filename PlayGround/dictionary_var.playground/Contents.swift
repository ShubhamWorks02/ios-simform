import UIKit

var greeting = "Hello, playground"
//string traversing

for i in 0..<greeting.count{
    let ch = greeting[greeting.index(greeting.startIndex,offsetBy: i)]
    print(ch,terminator: "")
}
        
print()

// let char = str[str.index(str.startIndex, offsetBy: i)]

for i in greeting {
    print(i,terminator: "")
}

//variable exercise in lms

greeting+="welcome"//another way to concatenate with assignment op
print(greeting)
var height:Int=5
print("height")
var length:Float=8.9
print(length)
var name:String="sdff"
print(name)
var yu : Double = 9.8
print(yu)
var isStudent: Bool = true
print(isStudent)

//PRN calculate interest

let R: Double = 0.15
var P: Double = 1000.0
var N: Double = 2.0
var finAmout:Double = P*R*N

print(finAmout)

let num1: Int = 10
let num2: Int = 20
let sum = num1 + num2
let product = num1 * num2
let quotient = num2 / num1

let num11: Float = 3.14
let num21: Float = 2.0
let num31: Float = 1.5
let floatSum = num11 + num21 + num31
let floatProduct = num21 * num11 * num31
let floatQuotient = num21 / num31

print("Float ops:")
print("\(num11) + \(num21) + \(num31) = \(floatSum)")
print("\(num11) * \(num21) * \(num31) = \(floatProduct)")
print("\(num21) / \(num31) = \(floatQuotient)")

print("moving on to dict")

//dictionary

var code = [

"a" : "b",
"b" : "c",
"c" : "d",
"d" : "e",
"e" : "f",
"f" : "g",
"g" : "h",
"h" : "i",
"i" : "j",
"j" : "k",
"k" : "l",
"l" : "m",
"m" : "n",
"n" : "o",
"o" : "p",
"p" : "q",
"q" : "r",
"r" : "s",
"s" : "t",
"t" : "u",
"u" : "v",
"v" : "w",
"w" : "x",
"x" : "y",
"y" : "z",
"z" : "a"

]

var newCode: [String:String] = [:]

for  (keyss,valss) in code {
    
    newCode[valss]=keyss
    
}

//print(newCode)

var encodedMessage = "uijt nfttbhf jt ibse up sfbe"
var decodedMsg:String=String()

for ch in encodedMessage {
    
    if (ch == " "){
        decodedMsg+=" "
    }else if let decodeCh = newCode[String(ch)]{
       decodedMsg=decodedMsg+decodeCh
    }

}
print(decodedMsg)

//second AND THIRD

var people: [[String:String]] = [
["firstName": "Calvin","lastName": "Newton"],
["firstName": "Garry","lastName": "Mckenzie"],
["firstName": "Leah","lastName": "Rivera"],
["firstName": "Sonja","lastName": "Moreno"],
["firstName": "Noel","lastName": "Bowen"]
]

var arr: [String] = []

for manas in people {
    
    var temp : String
    temp=manas["firstName"]!+" "+manas["lastName"]!
    arr.append(temp)// i can save space by not declaring variable temp but it looks good so i did it , will do optimization later
    
}

print(arr)

//NOTE ------ SECOND PROBLEM IS SUBPROBLEM OF THIRD PROBLEM SO I SOLVED THIRD PROBLEM AND SECOND ALSO GETS SOLVED
//FOURTH

var peoples: [[String:Any]] = [
["firstName": "Calvin","lastName": "Newton","score": 13],
["firstName": "Garry","lastName": "Mckenzie","score": 12],
["firstName": "Leah","lastName": "Rivera","score": 10],
["firstName": "Sonja","lastName": "Moreno","score": 3],
["firstName": "Noel","lastName": "Bowen","score": 16]
]

var score: Int=0
var naam: String=""
for manas in peoples {
    //checking for lowest score
    
    if let x = manas["score"] as? Int{
        if(score < x){
            score=x
            naam=manas["firstName"] as! String
            naam+=manas["lastName"] as! String
        }
    }
    
}
print(naam)

//sixth

var numbers  = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]
numbers.sort(by: <)
print(numbers)

var dictForUpdate: [Int:Int] = [:]

//var another  = Dictionary<Int,Int>()

for i in numbers {
    dictForUpdate[i]=0
    //dict.updateValue(dict[i]!+1, forKey: i)
}

print(dictForUpdate)

for i in numbers {
    dictForUpdate.updateValue(dictForUpdate[i]!+1, forKey: i)
}

print(dictForUpdate)
let another = dictForUpdate.sorted(by: <)
print(another)
