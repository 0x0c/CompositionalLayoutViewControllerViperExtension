//
//  CollectionViewInteractorInput.swift
//  
//
//  Created by Akira Matsuda on 2021/01/14.
//

import CompositionalLayoutViewController
import UIKit

@resultBuilder
public enum StoreBuilder {
    public static func buildBlock(_ component: CollectionViewSection...) -> [CollectionViewSection] {
        component
    }

    public static func buildOptional(_ component: [CollectionViewSection]?) -> [CollectionViewSection] {
        component ?? []
    }

    public static func buildEither(first component: [CollectionViewSection]) -> [CollectionViewSection] {
        component
    }

    public static func buildEither(second component: [CollectionViewSection]) -> [CollectionViewSection] {
        component
    }

    public static func buildArray(_ component: [[CollectionViewSection]]) -> [CollectionViewSection] {
        component
    }

    public static func buildLimitedAvailability(_ component: [CollectionViewSection]) -> [CollectionViewSection] {
        component
    }
}

public protocol CollectionViewInteractorInput: AnyObject {
    var sections: [CollectionViewSection] { get set }

    func store(_ sections: [CollectionViewSection])
    func store(@StoreBuilder _ sections: () -> [CollectionViewSection])
    func section(for sectionIndex: Int) -> CollectionViewSection
}

public extension CollectionViewInteractorInput {
    func store(_ sections: [CollectionViewSection]) {
        self.sections = sections
    }

    func store(@StoreBuilder _ sections: () -> [CollectionViewSection]) {
        self.sections = sections()
    }

    func section(for sectionIndex: Int) -> CollectionViewSection {
        return sections[sectionIndex]
    }
}
