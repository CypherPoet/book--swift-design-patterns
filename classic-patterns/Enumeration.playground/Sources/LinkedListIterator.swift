import Foundation

public class LinkedListIterator<T>: IteratorProtocol {
    private var currentNode: LinkedListNode<T>?
    
    public init(start: LinkedListNode<T>?) {
        self.currentNode = start
    }
    
    
    public func next() -> LinkedListNode<T>? {
        defer {
            // `defer` lets us run this AFTER the function returns
            currentNode = currentNode?.next
        }
        
        return currentNode
    }
}
