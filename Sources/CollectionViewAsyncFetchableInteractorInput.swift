//
//  CollectionViewAsyncFetchableInteractorInput.swift
//  CompositionalLayoutViewControllerViperExtension
//
//  Created by Akira Matsuda on 2022/08/16.
//

import CompositionalLayoutViewController
import Foundation

public protocol CollectionViewAsyncFetchableInteractorInput: AnyObject {
    func reload() async throws -> [CollectionViewSection]
    func fetch(force: Bool) async throws -> [CollectionViewSection]
}

public extension CollectionViewAsyncFetchableInteractorInput {
    func reload() async throws -> [CollectionViewSection] {
        return try await fetch(force: true)
    }

    func fetch(force: Bool = false) async throws -> [CollectionViewSection] {
        return try await fetch(force: force)
    }
}
