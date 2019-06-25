import UIKit

/**
 
 “The Fibonacci sequence is an infinite sequence, so storing it in a linked list is overkill.
 Instead, we can create a FibonacciGenerator struct that conforms to Sequence and continually outputs
 new numbers in the sequence every time you move further down its list.
 
 All it needs to do is store the current number and the previous number, and it can
 generate as many numbers in the sequence as you need.
 
 Previously we used two different classes working together to implement linked list iteration,
 but this time we’re going to write just one struct that acts as a sequence and an iterator at
 the same time. When one type conforms to both Sequence and Iterator you no
 longer need to implement the makeIterator() method."
 
*/

struct FibonacciGenerator {
    var previous = 0
    var current = 1
}


extension FibonacciGenerator: Sequence, IteratorProtocol {
    typealias Element = Int
    
    mutating func next() -> Element? {
        defer {
            let nextValue = previous + current
            previous = current
            current = nextValue
        }
        
        return current
    }
}


var generator = FibonacciGenerator()

for _ in 1...10 {
    print(generator.next())
}

for fib in FibonacciGenerator() {
    print(fib)
    if fib % 10 == 0 {
        break
    }
}
