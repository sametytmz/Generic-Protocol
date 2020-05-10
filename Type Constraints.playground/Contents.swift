import UIKit

/*
    Protocol Extension and Type Constraints
    Problem: Limit the scope of Protocol Extension with where and Self
 */


 //: Generic Function (Review)
class LOL {}
func addLOLClassOnly<T: LOL>(array: [T]) { }
addLOLClassOnly(array: [LOL()])

//: Design Protocol
protocol GenericProtocol {
    associatedtype myType
}

class SomeClass: GenericProtocol {
    typealias myType = String
}

struct SomeStruct: GenericProtocol {
    typealias myType = Int
}

extension GenericProtocol where myType == String {
    static func introduce() {
        print("Hey, I'm Samet")
    }
}

SomeClass.introduce()
// SomeStruct.introduce() // You can not call this function.

extension GenericProtocol where Self == SomeStruct {
    static func saySomething() {
        print("Hey, I'm some struct")
    }
}

SomeStruct.saySomething()
// SomeClass.saySomething() // You can not call this function


//: Design Pre-Defined Associated Type
// Don't do this
protocol FamilyProtocol {
    associatedtype familyType = Int
    var familyMembers: [familyType] { get set }
}

struct NumberFamily: FamilyProtocol {
    var familyMembers: [Int] = [1, 2, 3]
}

struct StringFamily: FamilyProtocol {
    //var familyMembers: [String] = ["Samet"] // familyType == String
}
