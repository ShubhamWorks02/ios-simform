import UIKit

var nl : String? = "dgf"
var t = nl?.first?.uppercased() ?? "failed"
print(type(of: t))

//let john = Person()
////john.residence = Residence()
////let roomCount = john.residence!.numberOfRooms
//
//if let roomCount = john.residence?.numberOfRooms {
//    print("John's residence has \(roomCount) room(s).")
//} else {
//    print("Unable to retrieve the number of rooms.")
//}


class Person {
    var residence: Residence?
}

class Residence {
    var rooms : [Room] = []
    var address : Address?
    var numberOfRooms : Int {
        
        return rooms.count
    }
    subscript (i:Int)->Room{
        get{
            return rooms[i]
        }
        set(newValue){
            rooms[i] = newValue
        }
    }
        func printNumberOfRooms() {
            print("The number of rooms is \(numberOfRooms)")
        }
}
class Room {
    let name: String
    init(name: String)
    {
        self.name = name
        
    }
}
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
          return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
          return buildingName
        } else {
          return nil
        }
    }
}

let john = Person()
john.residence = Residence()
var room1 :[Room] = []
room1.append(Room(name: "room1"))
john.residence?.rooms = room1
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress
if let add = john.residence?.address {
    print("Dekh Bhai")
}

func createAddress() -> Address {
    print("Function was called.")

    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"

    return someAddress
}

john.residence?.address = createAddress()

    if john.residence?.printNumberOfRooms() == nil {
        print("printNumberOfRooms if nil")
    }else{
        print("printNumberOfRooms else")

    }

if (john.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}


var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[1] = 45
print(testScores["Dave"]?[1])


print(testScores.first)
print(type(of:john.residence?.address?.street ))
if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
    
} else {
    print("Unable to retrieve the address.")
}//assign details first


