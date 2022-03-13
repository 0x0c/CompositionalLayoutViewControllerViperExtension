//
//  CollectionViewInteractorInput.swift
//  
//
//  Created by Akira Matsuda on 2021/01/14.
//

import CompositionalLayoutViewController
import UIKit

@resultBuilder
public enum CollectionViewSectionBuilder {
    public static func buildBlock() -> [CollectionViewSection] {
        []
    }

    public static func buildBlock<C: Collection>(_ contents: C...) -> [CollectionViewSection] where C.Element == CollectionViewSection {
        return contents.flatMap { $0 }
    }

    public static func buildBlock(_ contents: CollectionViewSection...) -> [CollectionViewSection] {
        return contents
    }

    public static func buildOptional(_ component: [CollectionViewSection]?) -> [CollectionViewSection] {
        return component ?? []
    }

    public static func buildEither(first component: [CollectionViewSection]) -> [CollectionViewSection] {
        return component
    }

    public static func buildEither(second component: [CollectionViewSection]) -> [CollectionViewSection] {
        return component
    }

    public static func buildExpression(_ element: CollectionViewSection?) -> [CollectionViewSection] {
        return element.map { [$0] } ?? []
    }

    public static func buildExpression(_ element: CollectionViewSection) -> [CollectionViewSection] {
        return [element]
    }

    public static func buildExpression<C: Collection>(_ elements: C) -> [CollectionViewSection] where C.Element == CollectionViewSection {
        Array(elements)
    }

    public static func buildExpression<C: Collection>(_ elements: C) -> [CollectionViewSection] where C.Element == CollectionViewSection? {
        elements.compactMap { $0 }
    }

    public static func buildArray(_ components: [[CollectionViewSection]]) -> [CollectionViewSection] {
        components.flatMap { $0 }
    }
}

public protocol CollectionViewInteractorInput: AnyObject {
    var sections: [CollectionViewSection] { get set }

    func store(_ sections: [CollectionViewSection])
    func store(@CollectionViewSectionBuilder _ sections: () -> [CollectionViewSection])
    func section(for sectionIndex: Int) -> CollectionViewSection
}

public extension CollectionViewInteractorInput {
    func store(_ sections: [CollectionViewSection]) {
        self.sections = sections
    }

    func store(@CollectionViewSectionBuilder _ sections: () -> [CollectionViewSection]) {
        self.sections = sections()
    }

    func section(for sectionIndex: Int) -> CollectionViewSection {
        return sections[sectionIndex]
    }
}
