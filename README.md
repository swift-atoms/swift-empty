# swift-empty

Use this package when a generic position typed over an `Element` needs a value that stands for "no element at all": a zero-element input, container or case that other packages build behaviour on (an empty renderer, an empty iterator). Start from `Empty<Element>`. When exactly one element must be carried instead, use the sibling package swift-single.

## Laws

- An `Empty<Element>` never holds an `Element` and occupies no storage: its size is zero for every `Element`, so carrying one costs nothing.
- Every `Empty<Element>` value is interchangeable with every other of the same `Element`; there is no state to tell them apart.
