import Vapor
import FluentSQLite
import FluentModels

/// Called before your application initializes.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#configureswift)
public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
) throws {
    // configure your application here
    var databaseConfig = DatabaseConfig()

    let databaseIdentifier = DatabaseIdentifier<SQLiteDatabase>.test

    let sqlite = SQLiteDatabase(storage: .file(path: "/tmp/db.sqlite"))
    databaseConfig.add(database: sqlite, as: databaseIdentifier)
    services.use(databaseConfig)

    var migrationConfig = MigrationConfig()
    migrationConfig.add(model: User.self, database: databaseIdentifier)

    services.use(migrationConfig)
    try services.register(FluentProvider())
}

extension DatabaseIdentifier {
    static var test: DatabaseIdentifier<SQLiteDatabase> {
        return .init("test")
    }
}
