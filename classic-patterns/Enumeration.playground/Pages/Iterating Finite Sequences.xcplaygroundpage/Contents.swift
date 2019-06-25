//: [Previous](@previous)

import Foundation


let list = LinkedList<Int>()

let first = LinkedListNode(value: 1)
let second = LinkedListNode(value: 1)
let third = LinkedListNode(value: 2)
let fourth = LinkedListNode(value: 3)
let fifth = LinkedListNode(value: 5)
let sixth = LinkedListNode(value: 8)

list.start = first

first.next = second
second.next = third
third.next = fourth
fourth.next = fifth
fifth.next = sixth


for node in list {
    print(node.value)
}


//: [Next](@next)
