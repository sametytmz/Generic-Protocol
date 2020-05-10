import UIKit

/*
    Intro to Associated Type
    Problem: How to create generic protocols
*/

/*
    Note: Type must be defined before compile
 */

//: Design Generic Struct (Review)
struct GenericStruct<T> {
    var property: T?
}

let explicitly = GenericStruct<Bool>()
// T is Bool
let implicitly = GenericStruct(property: "Samet")
// T is String

//: Design Normal Protocol
protocol NormalProtocol {
    var property: String { get set }
}

//: Design Class
class NormalClass: NormalProtocol {
    var property: String = "Samet"
}


/*
    Introducing Generic Protocol
*/

protocol GenericProtocol {
    associatedtype myType
    var anyProperty: myType { get set }
}

//: Define Associated Type
struct SomeStruct: GenericProtocol {
    var anyProperty = 1996  // myType = Int
}

struct NewStruct: GenericProtocol {
    var anyProperty = "Samet" // myType = String
}

//: Define Associated Type with Typealias
struct ExplicitStruct: GenericProtocol {
    typealias myType = Bool
    var anyProperty = true
}
