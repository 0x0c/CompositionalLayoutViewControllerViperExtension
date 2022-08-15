//
//  CollectionViewInput.swift
//  
//
//  Created by Akira Matsuda on 2021/01/14.
//

import CompositionalLayoutViewController
import UIKit

public protocol CollectionViewInput: AnyObject {
    @MainActor
    func update(sections: [CollectionViewSection])
}
