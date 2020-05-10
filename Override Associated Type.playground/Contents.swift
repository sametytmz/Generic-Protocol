import UIKit

/*
    Override Protocol Associated Type
    Problem: How to override typed-defined protocol?
*/

//: Design Protocol
protocol FamilyProtocol {
    associatedtype familyType
    var familyMembers: [familyType] { get set }
}

//: Design Struct
struct NumberFamily: FamilyProtocol {
    var familyMembers: [Int] = [1, 2, 3]
}


let numberFam = NumberFamily()  // familyType == Int

//: Override Associated Type Directly
struct NormalFamily: FamilyProtocol {
    typealias familyType = String
    var familyMembers = ["Samet", "iOS Developer"] // familyType == String
}


//: How to apply generic protocol with generics
struct SametFamily<T>: FamilyProtocol {
    var familyMembers: [T] = [] // familyType --> T
}

let family = SametFamily(familyMembers: ["Samet", "iOS", "Developer"])
// 1. T becomes String ["Samet", "iOS", "Developer"]
// 2. familyType now becomes String based on T
