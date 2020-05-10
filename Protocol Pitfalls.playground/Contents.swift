import UIKit

/*
    Protocol Pitfalls
    Problem: Can't be used it as a type
*/


//: Design File Type
struct Folder {}
struct Cell {}

//: Design Protocol
protocol Listable {
    associatedtype FileType = Cell
    func getFileType() -> String
}

//: Design Classes
class FolderCell: Listable {
    typealias FileType = Folder
    func getFileType() -> String {
        return "FolderCell with \(FileType.self) type"
    }
}

print(FolderCell().getFileType())


class CollectionCell: Listable {
    typealias FileType = Cell
    func getFileType() -> String {
        return "CollectionCell with \(FileType.self) type"
    }
}

print(CollectionCell().getFileType())

class ListCell: Listable {
    typealias FileType = Cell
    func getFileType() -> String {
        return "ListCell with \(FileType.self) type"
    }
}

print(ListCell().getFileType())


//: **Problem**

// let cell: Listable = CollectionCell()
//: > 'Listable' can only be used as a generic constraint because it has Self or associated type requirements

func enterListCell<T: Listable>(enterCell: T) {}
enterListCell(enterCell: FolderCell())
enterListCell(enterCell: ListCell())


let cell: Listable = arc4random() * 2 == 0 ? FolderCell() : ListCell()
//let cells: [Listable] = [CollectionCell(), ListCell()]
