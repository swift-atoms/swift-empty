import Empty
import Testing

@Suite struct `Empty values preserve zero storage and element capabilities` {
    @Suite struct `Empty values occupy no storage` {}
    @Suite struct `Empty values support noncopyable element types` {}
    @Suite struct `Empty values remain copyable for copyable element types` {}
}

extension `Empty values preserve zero storage and element capabilities`.`Empty values occupy no storage` {
    @Test
    func `empty carries no storage`() {
        #expect(MemoryLayout<Empty<Int>>.size == 0)
    }
}

extension `Empty values preserve zero storage and element capabilities`.`Empty values support noncopyable element types` {
    @Test
    func `empty constructs for a move-only element type`() {

        _ = Empty<Token>()
    }
}

extension `Empty values preserve zero storage and element capabilities`.`Empty values remain copyable for copyable element types` {
    @Test
    func `Empty is copyable when its element is copyable`() {
        let a = Empty<Int>()
        let b = a
        #expect(MemoryLayout.size(ofValue: a) == 0)
        #expect(MemoryLayout.size(ofValue: b) == 0)
    }
}

private struct Token: ~Copyable {}
