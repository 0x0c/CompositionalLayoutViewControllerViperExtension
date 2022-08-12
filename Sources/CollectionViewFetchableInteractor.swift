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
    func willFetchStart()
    func willFetchEnd()
    func didFetchEnd()
}

public extension CollectionViewFetchableInteractorOutput {
    @discardableResult
    func prepareFetch<Value>(_ promise: Promise<Value>) -> Promise<Value> {
        willFetchStart()
        promise.always { [weak self] in
            guard let weakSelf = self else {
                return
            }
            weakSelf.didFetchEnd()
        }
        return promise
    }
}
