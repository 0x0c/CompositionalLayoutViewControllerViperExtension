//
//  LoadingPublisherAvailable.swift
//  
//
//  Created by Akira Matsuda on 2021/05/31.
//

import Combine
import Foundation
import Promises

protocol CollectionViewFetchablePresenter {
    var isLoadingPublisher: Published<Bool>.Publisher { get }

    @discardableResult
    func fetch() -> Promise<Void>
}
