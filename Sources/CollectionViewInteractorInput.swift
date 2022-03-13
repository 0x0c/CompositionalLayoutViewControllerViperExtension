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
    public static func buildBlock(_ items: CollectionViewSection...) -> [CollectionViewSection] {
        items
    }

    public static func buildOptional(_ items: [CollectionViewSection]?) -> [CollectionViewSection] {
        items ?? []
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
