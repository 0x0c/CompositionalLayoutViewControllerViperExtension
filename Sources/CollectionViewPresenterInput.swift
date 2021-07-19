//
//  CollectionViewPresenterInput.swift
//  
//
//  Created by Akira Matsuda on 2021/01/14.
//

import CompositionalLayoutViewController
import UIKit

public protocol CollectionViewPresenterInput: AnyObject {
    var sections: [CollectionViewSection] { get }

    func section(for sectionIndex: Int) -> CollectionViewSection
    func didItemSelect(indexPath: IndexPath)
}
