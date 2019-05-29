import Foundation

/**
 Rather than locking `Identifiable` types in to a specific identifier key with a
 specific type, we can ask conforming types to provide their own keypath
 to an identifier of their own desired type ⚡️.
 */
public protocol Identifiable {
    associatedtype Identifier
    
    static var idKeyPath: WritableKeyPath<Self, Identifier> { get }
}
