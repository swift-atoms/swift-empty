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

        _ = Empty<Token>()
    }
}

extension `Empty Tests`.Integration {
    @Test
    func `is copyable when its element is`() {
        let a = Empty<Int>()
        let b = a
        #expect(MemoryLayout.size(ofValue: a) == 0)
        #expect(MemoryLayout.size(ofValue: b) == 0)
    }
}

private struct Token: ~Copyable {}
