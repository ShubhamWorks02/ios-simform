import UIKit
//contains pattern programs
//contains pattern programs

var range:Int=200
var x:Int=2

for i in 1...range{
    print(x)
    x=x*2
    if((x)>range){break}
    
}

//second

range=3

for i in 1...range {
    print("xxx")
    print()
}

//third

range=4

for i in 1...range{
    
    for k in 1...i{
        print("x",terminator: "")
    }
    print()
  
}
//FOURTH

range=4

for i in 1...range{
    
    for k in 0...range-i{
        
        print(" ",terminator: "")
        
    }
    for j in 1...2*i-1{
        print("*",terminator: "")
    }
    print()
    
}

//fifth
//prime number

var num = 17
var prime = true

if num < 2 {
    prime = false
}else{
    for i in 2..<num {
        if num % i == 0 {
            prime = false
            break
        }
    }
}

if prime {
    print("prime")
} else {
    print("not prime")
}

//below is console output for better code understandibility
//below is console output for better code understandibility

//2
//4
//8
//16
//32
//64
//128
//xxx
//
//xxx
//
//xxx
//
//x
//xx
//xxx
//xxxx
//    *
//   ***
//  *****
// *******
//prime
