import UIKit

struct subs {
    
    let decrement  : Int
    
    subscript (index  : Int) -> Int {
        
        return decrement-index
        
    }
    
    
}
var sub = subs(decrement: 5)
print(sub[3])

class Week {
    var days  : [String] = ["Monday","Tuesday","sunday"]
    
    subscript (posOfDays : Int) -> String {
       
        get{
            
            return days[posOfDays]
        }
     
        set (newValue){
            print("insubs")
            self.days[posOfDays] = newValue
        }
    }
    subscript (posOfDayss : String) -> (){
       
        self.days.append(posOfDayss)
        
    }
}

var wk = Week()
print(wk["added"])
print(wk.days)
print(wk[2])
print(wk[0])
wk[3] = "setter"
print(wk.days)
//let grid = [
//
//    [1,1,1,1],
//    [2,5,2,2],
//    [3,3,3,3]
//
//
//]
//print(grid[1][1])
