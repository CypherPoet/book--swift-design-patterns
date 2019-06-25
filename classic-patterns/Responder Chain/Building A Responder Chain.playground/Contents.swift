import UIKit


/**
    All conforming types must:
        - Define what comes next in the chain, if anything.
        - Run a selector if possible, or forward it otherwise
 */
protocol Responder {
    var next: Responder? { get set }
    
    func run(selector: Selector)
}


class Control: NSObject, Responder {
    var next: Responder?
    
    init(next: Responder? = nil) {
        self.next = next
    }
    
    func run(selector: Selector) {
        if responds(to: selector) {
            perform(selector)
        } else {
            print("Forwarding selector to next responder")
            next?.run(selector: selector)
        }
    }
}


class MessagingControl: Control {
    
    /// 🔑 An instance of `MessagingControl` will "respond" to `printMessage`
    @objc func printMessage() {
        print("Running!")
    }
}


let root = MessagingControl()
let first = Control(next: root)
let second = Control(next: first)
let third = Control(next: second)

let action = #selector(MessagingControl.printMessage)

third.run(selector: action)
