import Foundation

class DependencyContainer {
    static let shared = DependencyContainer()

    private init() {}

    private var dependencies = [String: Any]()

    func register<T>(_ type: T.Type, factory: @escaping () -> T) {
        let key = String(describing: type)
        dependencies[key] = factory
    }

    func resolve<T>() -> T {
        let key = String(describing: T.self)
        guard let factory = dependencies[key] as? () -> T else {
            fatalError("Dependency not registered for \(key)")
        }
        return factory()
    }
}
