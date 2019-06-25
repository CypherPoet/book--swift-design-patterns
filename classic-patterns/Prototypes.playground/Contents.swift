import UIKit

/**
    An implementation of a TableView type that works similar to Apple’s UITableView: you
    can register cell types with it as string identifiers, then dequeue and enqueue
    cells as needed.
 */

protocol TableViewCell {
    var identifier: String { get set }
    
    init(identifier: String)
    
    func clone() -> Self
}


struct ExampleCell: TableViewCell {
    var identifier: String
    
    func clone() -> ExampleCell {
        return ExampleCell(identifier: identifier)
    }
}


struct TableView {
    
    /// When we first register a type, we create exactly one instance
    /// of it and add it to this cache as a "prototype". Whenever we need to
    /// ask for instances, we can pull out the prototype and call `clone` on it.
    private var prototypeCache: [String: TableViewCell] = [:]
    
    ///
    private var cellCache: [String: [TableViewCell]] = [:]
    
    
    mutating func register(_ cellType: TableViewCell.Type, withIdentifier identifier: String) {
        prototypeCache[identifier] = cellType.init(identifier: identifier)
    }
    
    
    mutating func enqueue(_ cell: TableViewCell) {
        print("Enqueing cell with identifier \"\(cell.identifier)\"")
        cellCache[cell.identifier, default: []].append(cell)
    }
    
    
    mutating func dequeueCell(withIdentifier identifier: String) -> TableViewCell {
        if let reusableCell = cellCache[identifier]?.popLast() {
            print("Dequeueing reusable cell with identifier \"\(identifier)\"")
            return reusableCell
        } else {
            guard let prototype = prototypeCache[identifier] else {
                fatalError("No prototype cell registered with identifier \"\(identifier)\"")
            }
            
            return prototype.clone()
        }
    }
}


let reuseID1 = "Example 1"
let reuseID2 = "Example 2"

var tableView = TableView()

tableView.register(ExampleCell.self, withIdentifier: reuseID1)

let cell1 = tableView.dequeueCell(withIdentifier: reuseID1)
//let cell2 = tableView.dequeueCell(withIdentifier: reuseID2)

tableView.register(ExampleCell.self, withIdentifier: reuseID2)

let cell2 = tableView.dequeueCell(withIdentifier: reuseID2)


tableView.enqueue(cell1)
tableView.dequeueCell(withIdentifier: reuseID1)
