@_exported import Models
import Fluent
import Foundation
import FluentSQLite

extension User<DatabaseType>: Model where DatabaseType: QuerySupporting, DatabaseType: SchemaSupporting {
    public typealias Database = DatabaseType
    public typealias ID = UUID
    public static var idKey: ReferenceWritableKeyPath<User, UUID?> {
        return \User.userID
    }
}

extension User: Migration {}

