//
//  CollectionViewFetchablePresenter.swift
//  
//
//  Created by Akira Matsuda on 2021/05/31.
//

import Combine
import Foundation

public protocol CollectionViewFetchablePresenter {
    var isLoadingPublisher: Published<Bool>.Publisher { get }

    func reload() async throws
    func fetch(force: Bool) async throws
}

public extension CollectionViewFetchablePresenter {
    func reload() async throws {
        try await fetch(force: true)
    }

    func fetch(force: Bool = false) async throws {
        try await fetch(force: force)
    }
}
