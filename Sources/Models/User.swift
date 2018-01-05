import Foundation

public final class User: Codable {
    public var userID: UUID?
    public var username: String
    public var name: String
    public var age: Int

    public init(username: String, name: String, age: Int) {
        self.username = username
        self.name = name
        self.age = age
    }
}
