//
//  Collection+Extensions.swift
//
//
//  Created by Pavel Koyushev on 14.11.2023.
//

import Foundation

public extension Collection {
    
    func enumeratedArray() -> Array<(offset: Int, element: Self.Element)> {
        return Array(self.enumerated())
    }
    
    func unfoldSubSequences(limitedTo maxLength: Int) -> UnfoldSequence<SubSequence,Index> {
        sequence(state: startIndex) { start in
            guard start < self.endIndex else { return nil }
            let end = self.index(start, offsetBy: maxLength, limitedBy: self.endIndex) ?? self.endIndex
            defer { start = end }
            return self[start..<end]
        }
    }
    
    subscript (safe index: Self.Index) -> Iterator.Element? {
        (startIndex ..< endIndex).contains(index) ? self[index] : nil
    }
}

public extension Array where Element: Equatable {
    
    @discardableResult
    mutating func remove(element: Element) -> Index? {
        guard let index = firstIndex(of: element) else { return nil }
        remove(at: index)
        return index
    }
    
    @discardableResult
    mutating func remove(elements: [Element]) -> [Index] {
        elements.compactMap { remove(element: $0) }
    }
}

public extension Array where Element: Hashable {
    
    mutating func unify() {
        self = unified()
    }
}

public extension Collection where Element: Hashable {
    
    func unified() -> [Element] {
        Array(Set(self))
    }
}
