//
//  CollectionViewFetchablePresenter.swift
//  
//
//  Created by Akira Matsuda on 2021/05/31.
//

import Combine
import Foundation
import Promises

public protocol CollectionViewFetchablePresenter {
    var isLoadingPublisher: Published<Bool>.Publisher { get }

    @discardableResult
    func reload() -> Promise<Void>
    @discardableResult
    func fetch(force: Bool) -> Promise<Void>
}

public extension CollectionViewFetchablePresenter {
    @discardableResult
    func reload() -> Promise<Void> {
        return fetch(force: true)
    }

    @discardableResult
    func fetch(force: Bool = false) -> Promise<Void> {
        return fetch(force: force)
    }
}