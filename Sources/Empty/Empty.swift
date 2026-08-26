public struct Empty<Element: ~Copyable & ~Escapable>: ~Copyable, ~Escapable {

    @inlinable
    @_lifetime(immortal)
    public init() {}
}

extension Empty: Copyable where Element: Copyable & ~Escapable {}

extension Empty: Escapable where Element: Escapable & ~Copyable {}
