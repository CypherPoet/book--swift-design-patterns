import Foundation


public class BookStore: NSObject {
    lazy var serviceBot = ServiceBot()
    
    public func open() {
        perform(#selector(turnOnLights), with: 10)
        perform(#selector(openDoors))
        
        let customer = Customer(name: "CypherPoet")
        let selector = NSSelectorFromString("greetWithCustomer:")
        
        if responds(to: selector) {
            perform(selector, with: customer)
        }
    }
    
    public func handleAngryCustomer() {
        /// We can't handle this, but let's hope the `serviceBot` assigned by the
        /// `forwardingTarget` function can do better 🙂
        perform(NSSelectorFromString("handleComplaint"))
    }
    
    public override func forwardingTarget(for aSelector: Selector!) -> Any? {
        return serviceBot
    }
}

// MARK: - Private Helper Methods

private extension BookStore {
    @objc func turnOnLights(intensity: Int, hue: Int) {
        print("The lights are on. (Intensity: \(intensity), Hue: \(hue))")
    }
    
    @objc func openDoors() {
        print("The doors are open")
    }
    
    @objc func buyBook(name: String) {
        
    }
    
    @objc func greet(customer: Customer) {
        print("Hello, \(customer.name)!")
    }
}
