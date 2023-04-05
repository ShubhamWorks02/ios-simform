import UIKit

class Subjects {
   var physics: String
   init(physics: String) {
      self.physics = physics
   }
}

class Chemistry: Subjects {
   var equations: String
   init(physics: String, equations: String) {
      self.equations = equations
      super.init(physics: physics)
   }
}

class Maths: Subjects {
   var formulae: String
   init(physics: String, formulae: String) {
      self.formulae = formulae
      super.init(physics: physics)
   }
}



let samplechem = Chemistry(physics: "solid physics", equations: "Hertz")

print("Instance physics is: \(samplechem.physics)")
print("Instance equation is: \(samplechem.equations)")
let sa = [
   Chemistry(physics: "solid physics", equations: "Hertz"),
   Maths(physics: "Fluid Dynamics", formulae: "Giga Hertz"),
   Chemistry(physics: "Thermo physics", equations: "Decibels"),
   Maths(physics: "Astro Physics", formulae: "MegaHertz"),
   Maths(physics: "Differential Equations", formulae: "Cosine Series")]
var isMath = 0
var isChem = 0
for i in sa {
    if let chem = i as? Chemistry {
        print(chem.physics,chem.equations)
    }else if let mat = i as? Maths {
        print(mat.physics)
    }
}
print(isMath,isChem)
var new1 = Subjects(physics: "subjects papa name")
var new =  new1 as? Chemistry
print(new1 as? Chemistry)
class A {
    
}
class B : A{
     
}
var ins : B = B()
print(type(of: ins))
var stry = "12"
var inIn = Int(stry)
var ins2  =  ins as! A
print(type(of: ins2))

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

var things: [Any] = []

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things {
    
    switch thing {
        
    case 0 as Int:
        print("zero case")
    case let someint as Int :
        print("some int ",someint)
    case let ( x,  y) as (Double,Double) :
        print(x,y)
    
    case let movie as Movie :
        print(movie.name)
    default:
        print("in def")
    }
}

struct blackjack {
    
    enum Suit : Character {
        case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
    }
    
    enum Rank : Int{
        
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        
        struct Values{
            let first: Int, second: Int?
        }
        var value :  Values {
            
            switch self {
            case .ace : return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                            return Values(first: 10, second: nil)
                        default:
                            return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    let rank : Rank, suit : Suit
}
