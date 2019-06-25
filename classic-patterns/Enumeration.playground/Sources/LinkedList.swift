import Foundation

public class LinkedList<T> {
    public var start: LinkedListNode<T>?
    
    public init() {}
    
    public init(start: LinkedListNode<T>?) {
        self.start = start
    }
}


extension LinkedList: Sequence {
    public func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator(start: start)
    }
}
