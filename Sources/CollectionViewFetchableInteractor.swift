//
//  CollectionViewFetchableInteractorInput.swift
//  
//
//  Created by Akira Matsuda on 2021/02/26.
//

import CompositionalLayoutViewController
import Foundation
import Promises

protocol CollectionViewFetchableInteractorInput: AnyObject {
    func fetch() -> Promise<[CollectionViewSection]>
}

protocol CollectionViewFetchableInteractorOutput: AnyObject {
    func willFetchStart()
    func willFetchEnd()
    func didFetchEnd()
}

extension CollectionViewFetchableInteractorOutput {
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
