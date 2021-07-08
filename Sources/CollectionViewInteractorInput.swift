//
//  CollectionViewInteractorInput.swift
//  
//
//  Created by Akira Matsuda on 2021/01/14.
//

import CompositionalLayoutViewController
import UIKit

protocol CollectionViewInteractorInput: AnyObject {
    var sections: [CollectionViewSection] { get set }

    func store(_ sections: [CollectionViewSection])
    func section(for sectionIndex: Int) -> CollectionViewSection
}

extension CollectionViewInteractorInput {
    func store(_ sections: [CollectionViewSection]) {
        self.sections = sections
    }

    func section(for sectionIndex: Int) -> CollectionViewSection {
        return sections[sectionIndex]
    }
}
