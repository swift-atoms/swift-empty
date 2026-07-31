import Empty_Primitives
import Testing

@Suite struct `Empty Tests` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Empty Tests`.Unit {
    @Test
    func `empty carries no storage`() {
        #expect(MemoryLayout<Empty<Int>>.size == 0)
    }
}

extension `Empty Tests`.`Edge Case` {
    @Test
    func `empty constructs for a move-only element type`() {
        // No assertion beyond construction: Empty has no observable behavior of its own.
        // This exercises Empty over a ~Copyable element to confirm the bound is permissive.
        _ = Empty<Token>()
    }
}

extension `Empty Tests`.Integration {
    @Test
    func `is copyable when its element is`() {
        let a = Empty<Int>()
        let b = a  // compiles only if Empty<Int>: Copyable (conditional conformance)
        #expect(MemoryLayout.size(ofValue: a) == 0)
        #expect(MemoryLayout.size(ofValue: b) == 0)
    }
}

private struct Token: ~Copyable {}
