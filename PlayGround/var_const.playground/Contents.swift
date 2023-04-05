import UIKit

var greeting:String
greeting="shubhm"
print(greeting)
let con:Int
con=4

print(con)
let num=5
let label="name"
let fin:String=String(num)+label
print(fin)
let str="number is \(num)"
print("number is \(num)")
let quotation = """
    I said "I have \(num) apples."
And then I said "I have  pieces of fruit."
"""//in triple quoting indentation is kept in mind
print(quotation)
var hello:Int//if i leave this variable not initialized then it will give me error
//print(hello)
hello=5
print(hello)
// cant assign nil to object if you want to do that then prefer as optional

print(1...5)
print(1,2,3,separator: "+")
print(quotation.uppercased())
var forIf=19
if forIf>18 {
    print("you are eligible for voting")
}else {
    print("you are not adult")
}
print("😂")
var optiona:String?
//var lol = "hello"+optiona
var _a:Int=78
    print(_a)
//naming convention
var HE:Int=78
    print(HE)
print(Int8.max)
//var her:Unit = -3 error will occur compile time
var ch:Character="l"
print(ch)
ch="\u{101}"
print(ch)//with unicode
var df:Float=6.7
var dd:Double=8.9
//Cannot assign value of type '(Float).Type' to type 'Float'
print(df)
print(234)
print(7)
var fl=5.6e14
print(fl)
//below typealias
typealias shubham=Int
var jhg:shubham=89
print(jhg)
///////
var yui = -90
//yui="type safety"
print(yui)//Cannot assign value of type 'String' to type 'Int'
//yui=yui+0.9
//print(yui)
var (xx, y) = (10, 20)
print(xx)

print(xx%4)//remainder operator
var a = 10
a += 20
//compound assignment oper 30
forIf=18

if forIf==18 {//Comparison Operator
    print("you are eligible for voting")
}else {
    print("you are not adult")
}
 
print((a==30) ? true : false)//ternary conditional oper

