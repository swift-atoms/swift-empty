public struct Empty<Element: ~Copyable & ~Escapable>: ~Copyable, ~Escapable {

    @inlinable
    @_lifetime(immortal)
    public init() {}
}

extension Empty: Swift.Copyable where Element: Swift.Copyable & ~Escapable {}

extension Empty: Swift.Escapable where Element: Swift.Escapable & ~Copyable {}
