import UIKit

//String practicals

var inputStr: String = "example"
var outputStr: String = String()

//if (inputStr.count<2){
//
//    outputStr=inputStr
//    print(outputStr)
//    //program over
//}else{

for i in inputStr{
    outputStr = outputStr+String(i)
    if(outputStr.count == 2){ break }
}
print(outputStr)

// second

inputStr = "example"
outputStr = String()

if(inputStr.count<2){
    print("lenght is less than 2")
}else{
    inputStr.removeFirst()
    inputStr.removeLast()
    print(inputStr)
}

//Third

var input1: String = "hello"
var input2: String = "shubham"
var output: String = String()

if((input1.isEmpty)||(input2.isEmpty)){
    print("concatenation cant happen")
}else{
    input1.removeFirst()
    input2.removeFirst()
    outputStr=input1+input2
    print(outputStr)
}

//fourth

input1 = "swift"
input2 = "sw"//string for checking
if(input1.isEmpty)
{
    print("empty string")
}else{
    print(input1.hasPrefix(input2))
}

//fifth

var inputInt: Int = 3
input1 = "helloworld"
outputStr = ""

if((input1.count<inputInt)||inputInt==0)
{
    print("failed case")
}
else
{
    outputStr=String((input1.prefix(inputInt)))+String((input1.suffix(inputInt)))
}
             


