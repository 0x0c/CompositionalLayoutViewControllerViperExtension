//
//  CollectionViewFetchableInteractorInput.swift
//  
//
//  Created by Akira Matsuda on 2021/02/26.
//

import CompositionalLayoutViewController
import Foundation
import Promises

public protocol CollectionViewFetchableInteractorInput: AnyObject {
    func reload() async throws -> [CollectionViewSection]
    func fetch(force: Bool) async throws -> [CollectionViewSection]
}

public extension CollectionViewFetchableInteractorInput {
    func reload() async throws -> [CollectionViewSection] {
        return try await fetch(force: true)
    }

    func fetch(force: Bool = false) async throws -> [CollectionViewSection] {
        return try await fetch(force: force)
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
