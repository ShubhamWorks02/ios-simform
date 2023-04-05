import UIKit

//{
//    (param)->return type in
//    logic
//}

let p = {
    
    print("in closure")
    
}
p()
print(type(of: p))

var arr: [Int] = [1,2,3,4,5]
//print(arr.replacing(arr[2], with: arr[0]))
arr.removeAll(keepingCapacity: true)
//arr = []
//arr.reserveCapacity(10)
print(arr)
print(arr.capacity)

//arr.replace(arr.firstIndex(of: 3), with: arr.firstIndex(of: 1))

//arr.swapAt(0, 2)

print(arr)


// func ref or value type
//
//////
///10/03
///10/03
///
func hesf (a:Int,b:String) -> (Int,String){//return type tuple can hold mulitple datatype in same tuple
    
    return (a,b)
    
}

let ghn =  hesf(a: 4, b: "ddsf")
print(ghn)

//Closure
//Closures are self-contained blocks of functionality that can be passed around and used in your code.
//a closure is a block of code that you can assign to a variable.
//QUESTIONS
//why need of closure
//how it works
// from which version it is introduced
//closure type of
//
//var birthday = {
//    print("happy birthday")
//}
//birthday()

let birthday : (String,Int)->() =  { wish,number in

    print("happy birthday \(wish)")


    print(type(of: wish))
}

birthday("shubham",4)
birthday("dsf",4)

// optional binding in closure

let optBirthday1 : (String?)->() =  { wish in // Closure expression
    
    print("happy birthday \(wish)")
    //wish = ""
    if let name = wish {
        print("binded")
        print(type(of: name))
    }
    print(type(of: wish))
}

var ghi : String?
ghi = "sff"

optBirthday1(ghi)
print(type(of: optBirthday1))


//The parameters of a closure aren’t named, unlike Swift functions.

let param: (String) -> () = { name in
    
}

var arrrr = [1,2,3,4,5]

//arrrr.swapAt(arrrr.firstIndex(of: 1)!, arrrr.firstIndex(of: 3)!)
arrrr[2]=arrrr[0]
//arrrr.insert(arrrr[0], at: 2)
print(arrrr)

//A closure is a block of code that you can pass around in your code

//arrrr.replace(arrrr[2], with: arrrr[0])



//switch dfdf {
//
//case 1:
//    print("dfdf")
//    retur
//default:print("df")
//}

//lifecycle
//types
//ways
//life ezz
//closure and completion
//func ret (){
//
//    var dfdf = 1
//    switch dfdf {
//
//    case 1:
//        print("dfdf")
//        return
//
//    case 2:
//        print("fs")
//    default:print("df")
//    }
//
//}
//ret()

//The in keyword separates the closure parameters and the closure body.

let birthday2 = { (name:String,number:Int) -> () in // type inference and CLOSURE expression syntax
    
    print(name)

}

birthday2( "nother type of closure",5)
 
//SYNTAX for closure
//let closureName:(parameter types) -> return type = { (parameter name:parameter type) -> return type in
//
//}


//A closure with no parameters and no return type, has the following closure type:

// () -> ()



let birthday3 = { (name:String,number:Int) -> Void in // PAssing Void instead of ()
    
    
    print(name)

}

birthday3( "nother type of closure",5)
//
//
let goodOfM  = { (name : String,hi : String)->String  in
    return "\(name) , \(hi)" //

}

print( goodOfM("dffgdf","dsfdfd"))


//let greeting:(String, String) -> String = { return “ Good \($0), \($1)! ” }
//let sdfj = greeting("good","morning")
//print(sdfj)

//Any closure parameter type or return type can be optional, like this: (String?, Int) -> Int?. You can also make the closure itself optional, which means that the variable, constant or property that references the closure can be nil.


let namexx = "dfdf"


let consf = { // we can use parent scope variable in closure
    print("dfdfd",namexx)
}

consf()

print(type(of: consf))

func namedfd () {
    
    consf()
    print(namexx)
    
}

namedfd()


func capture (namez :String)-> String{ // Closures & Capturing In Swift
    
    let x1 = "1"
    
    let capt = {
     
        return "local \(x1) and global namexx having \(namexx) and func param having \(namez)"
        
    }
    
    return capt()
    
}

print(capture(namez: "dsdsfdff"))

//First things first. When a closure captures a value, it automatically creates a strong reference to that value. When Bob has a strong reference to Alice, then Alice isn’t removed from memory until Bob is removed from memory.

//Strong References & Capture Lists
//First things first. When a closure captures a value, it automatically creates a strong reference to that value. When Bob has a strong reference to Alice, then Alice isn’t removed from memory until Bob is removed from memory.


//The weak keyword indicates that the captured value can become nil
//The unowned keyword indicates that the captured value never becomes nil

//You typically use unowned when the closure and the captured value will always refer to each other, and will always be deallocated at the same time. An example is [unowned self] in a view controller, where the closure will never outlive the view controller.
//In swift, the completion handler is a block of code that is used to perform and handle the completion state of a task.

//func normal (par : Bool){
//
//
//}
//
//normal(par: true)

func normalclosure (cls: (Int,Int)->Int ){
    
    print(cls(1,2))
    
}

normalclosure { q, s in

    return q+s

}
//
//let inp = (Int,Int) -> Int {
//
//}
//normalclosure (  let inp = (Int,Int) -> Int = { q, s in
//
//    return q+s
//
//})
//
var de = [4:5 , 5:6]

//retain count

//memory management
//which type when
//
let prac = { (a:Int,b:Int)->(Int,Int)
    in
    print(a,b)
    return (a,b)
}

prac(4,5)

//
//Monday 13/03

//
// Print "Hello, World!" message
print("Hello, World!")

// let hello = {(s1: Int,s2: Int)-> Bool in s1>s2}
let hello = { print("sff")}
hello()
func expWithTrail(cls: ()-> Void ){
    
    print("func called ")
    cls()
    
}
// expWithTrail(cls : {
//     print("fdjhbvc")//without using trailing
// }
// )

// expWithTrail {
//     print("fdjhbvc")//without using trailing
// }

expWithTrail() {
    print("fdjhbvc")//with using trailing
}

func expWithTrail2(cls: ()-> Void , cls2 : () -> Void ){
    
    print("func called ")
    cls()
    cls2()
    
}

// expWithTrail2(){
//     print("cls1")
// } cls2 : {
//     print("cls2")
// }

// expWithTrail2(cls : {
//     print("cls1")
// }, cls2 : {
//     print("cls2")
// })
//
//var a = ({print("dff")},3)
//print(a)

let xd = { (  a : inout Int, b  : inout Int) in
    
    var temp = a
    a=b
    b=temp

}
var ab = 5
var bc = 6

xd(&ab,&bc)
print(ab,bc)

let optcls: (( Int,Int) -> Void)? = { a,b in // opt closure
    print("")
}

//A completion handler in Swift is a function that calls back when a task completes. This is why it is also called a callback function.

//A callback function is passed as an argument into another function. When this function completes running a task, it executes the callback function.

func greet (_ completion: ()->(),yo :String) -> () { //Completion Handler
    
    print(yo)
    completion()
    
}
//callbacks are useful in Swift when dealing with asynchronous tasks.

//In an asynchronous function, you can start the next task before the previous one completes. This way, you can deal with multiple requests simultaneously and complete more tasks in a shorter timeframe.

//
//
//greet({ print("Task complete")}, yo: "Completion Hndler")
//
//let url = URL(string: "https://github.com/ShubhamWorks02/Learn_Swift/blob/main/loop.playground/Contents.swift")!
//
//let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response , error) in //class URLSession : NSObject, @unchecked Sendable
//
//    guard let data = data else {return}
//
//    var htmlContent = String(data: data, encoding: .utf8)!
//
//    print(htmlContent)
//})
//
//task.resume()

//URLSession.shared.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
//class     variable func

//sync async
// escaping non by default
//weak strong use in cls
//API ma kayo closure

//lifecycle of cls including types
//@noescape was an attribute in swift 2. This is deprecated from swift 3. The @noescape attribute is applied by default in Swift 3. Because closures are by default non-escaping in Swift 3, escaping closures need to be marked as such. And the @escaping attribute lets us do that.
//A good example of an escaping closure is a completion handler. It’s executed in the future, when a lengthy task completes, so it outlives the function it was created in.
//

//Lifecycle of the @nonescaping closure:
//1. Pass the closure as function argument, during the function call.
//2. Do some additional work with function.
//3. Function runs the closure.
//4. Function returns the compiler back.



//func expWithClsEsc (a : Int, handler  : ()->()){
//
////    handler()
//    print("executing non escp",a)
//
//
//}
//
//expWithClsEsc(a: 4){
//
//    print("handleer executing")
//
//}

func getcls (name : String , cls : @escaping ()->()) {
    
    print(name)
    let seconds = 3.0
    
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        
        // Put your code which should be executed with a delay here
        cls()
        
        
    }
    
}

getcls(name: "dfdsfdf"){
    
    print("escaping try")
    
}
//

//Lifecycle of the @escaping closure:
//1. Pass the closure as function argument, during the function call.
//2. Do some additional work in function.
//3. Function execute the closure asynchronously
//4. Function returns the compiler back.

//compiler store memory for escaping closure

//There are many different benefits of making non-escaping as by default. The most important benefits are performance and code optimisation by the compiler, because if the compiler knows that the closure is non-escaping, will take care about the memory allocation for the closure.

//API call ma escaping
//completion handler uses escaping

func impleAuto (_ atCls : @autoclosure ()->()) {
    
    atCls()

    
}

impleAuto( print("Autoclosure"))


//Weak References
//As the name suggests, a weak reference keeps a weak reference to the instance it references. This means that the reference to the instance is not taken into account by ARC. Remember that an instance is deallocated if no other objects have a strong reference to the instance.
//Unowned References
//Unowned references are similar to weak references in that they don't keep a strong reference to the instance they are referencing. They serve the same purpose as weak references, that is, they avoid strong reference cycles.
//
//But there are several key differences between weak and unowned references that are important to understand.
//
//
//
/////The first difference you need to know about is that an unowned reference is always expected to have a value. This is not true for weak references, which are set to nil if the instance they reference is deallocated. When that happens, the reference is set to nil./
//Because a weak reference can be set to nil, it is always declared as an optional. That is the second difference between weak and unowned references
class A  {
    
    weak var ane : B?
    
}
class B {
    
}

//
//class Account1 {
//
//    // MARK: - Properties
//
//    var plan: Plan
//
//}
//
//class Plan {
//
//    // MARK: - Properties
//
//    var account: Account1
//
//    // MARK: - Initialization
//
//    init(account: Account1) {
//        self.account = account
//    }
//
//}

class Account {

    // MARK: - Properties

    var plan: Plan?

}

class Plan {

    // MARK: - Properties

    unowned var account: Account

    // MARK: - Initialization

    init(account: Account) {
        self.account = account
    }

}

//typealias exd =   (Int)->(Any)
//class Ty{
//    func esccls (  cl : @escaping (Int)->(Any)){
//
//        //code
//        
//
//    }
//    esccls({ (Int)->(Any)[weak self](sum) in
//        print("escaping ")
//    }
//}
//

class Ab {
    
    var clsx : ((Int)->())?
    var num : Int?
    
}
class Ba {
    
    var ref = Ab()
   
    init(){
        
        ref.clsx =   {[weak ref] a in
            
            print("dfhg")
            print(a)
            
        }}
    
}
var ba = Ba()
ba.ref.clsx?(5)

class Play {
    
    func game(){
        print("Play game")
    }
    
}
// self / Self find diff

//
//func playing()->()->() { // Strong reference
//
//    var arena = Play()
//
//    let lol = {
//
//        arena.game()
//        return
//
//    }
//
//    return lol
//
//}
//
//var strng = playing()
//strng()


func playing()->()->() { // weak reference
    
    var arena = Play()
    
    let lol = { [weak arena] in // weak arena part is captur list
        
        arena?.game()
        return
        
    }
    
    return lol
    
}

var strng = playing()
print( strng())

//Unowned capturing
//An alternative to weak is unowned, which behaves more like implicitly unwrapped optionals. Like weak capturing, unowned capturing allows values to become nil at any point in the future.
//you don’t need to unwrap optionals.
//You should use unowned very carefully indeed.
//When thing A owns thing B, and thing B owns thing A, you have what’s called a strong reference cycle, or often just a retain cycle.
//When thing A owns thing B, and thing B owns thing A, you have what’s called a strong reference cycle, or often just a retain cycle.
//When thing A owns thing B, and thing B owns thing A, you have what’s called a strong reference cycle, or often just a retain cycle.

