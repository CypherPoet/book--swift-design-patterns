import Foundation

public extension Settings {
    static func decode(
        from data: Data,
        decoder: JSONDecoder = JSONDecoder()
    ) throws -> Settings {
        return try decoder.decode(self, from: data)
    }
}
