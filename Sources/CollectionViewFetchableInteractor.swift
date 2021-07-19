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
    func reload() -> Promise<[CollectionViewSection]>
    func fetch(force: Bool) -> Promise<[CollectionViewSection]>
}

public extension CollectionViewFetchableInteractorInput {
    func reload() -> Promise<[CollectionViewSection]> {
        return fetch(force: true)
    }

    func fetch(force: Bool = false) -> Promise<[CollectionViewSection]> {
        return fetch(force: force)
    }
}

public protocol CollectionViewFetchableInteractorOutput: AnyObject {
    func willFetchStart()
    func willFetchEnd()
    func didFetchEnd()
}

public extension CollectionViewFetchableInteractorOutput {
    func prepareFetch(_ promise: Promise<Void>) {
        willFetchStart()
        promise.always { [weak self] in
            guard let weakSelf = self else {
                return
            }
            weakSelf.didFetchEnd()
        }
    }
}
