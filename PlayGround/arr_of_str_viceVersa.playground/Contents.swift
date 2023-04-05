import UIKit

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
