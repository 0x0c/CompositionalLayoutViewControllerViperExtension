//
//  CollectionViewFetchableInteractorInput.swift
//  
//
//  Created by Akira Matsuda on 2021/02/26.
//

import CompositionalLayoutViewController
import Foundation

public protocol CollectionViewFetchableInteractorInput: AnyObject {
    func reload() -> [CollectionViewSection]
    func fetch(force: Bool) -> [CollectionViewSection]
}

public extension CollectionViewFetchableInteractorInput {
    func reload() -> [CollectionViewSection] {
        return fetch(force: true)
    }

    func fetch(force: Bool = false) -> [CollectionViewSection] {
        return fetch(force: force)
    }
}

public protocol CollectionViewFetchableInteractorOutput: AnyObject {
    @MainActor
    func willFetchStart()
    @MainActor
    func willFetchEnd()
    @MainActor
    func didFetchEnd()
}
