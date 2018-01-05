@_exported import Models
import Fluent
import Foundation
import FluentSQLite

extension User: Model {
    public typealias Database = SQLiteDatabase
    public typealias ID = UUID
    public static var idKey: ReferenceWritableKeyPath<User, UUID?> {
        return \User.userID
    }
}

extension User: Migration {}

