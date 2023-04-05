import UIKit

//ARRAY OPS
//FIRST

var arr: [Int]=[3,4,5,3]
if(arr.count>0)
{
    print(arr.last==arr.first ? "are same":"not same")
}else{
    print("arr is empt")
}

//SECOND
//there is not a condition mentioned in sheet to check if array is empty

var inpArr: [Int] = [4,5,6,7]
arr = Array(repeating: 0, count: 2*(inpArr.count))
arr[arr.count-1] = inpArr[inpArr.count-1]
print(arr)

//THIRD

var inpArray: [Int] = [0, 1, 2, 3]
var outArray: [Int]

if inpArray.count >= 2 {
    outArray = Array(inpArray[0...1])
} else {
    outArray = inpArray
}

print(outArray)

//Fourth

if let x = inpArray.max(){
    print(x)
}else{
    print("array is empty")
}

//fifth

inpArray.sort(by: >)
print(inpArray)

//LAST one

let listOfNumbers = [1, 2, 3, 10, 100]
let divisors = [2, 5]

for number in listOfNumbers {
    for divisor in divisors {
        if number % divisor == 0 {
            print(number,terminator: " ")
            break
        }
    }
}

