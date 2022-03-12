//
//  CellViewModelConfigurable.swift
//  calzzapato
//
//  Created by Beto Salcido on 02/05/21.
//  Copyright © 2021 BetoSalcido. All rights reserved.
//

import Foundation

/// A generic view model type for view controllers to work with.
protocol CellViewModel: CellIdentifiable {
    
}

/// For view controllers to configure various cell view models in a generic way.
protocol CellViewModelConfigurable {
    /// Called from `tableView:cellForRowAt:` or `collectionView:cellForItemAtIndexPath:`
    func configure(cellViewModel: CellViewModel)
    
    /// Called from `tableView:cellForRowAt:` or `collectionView:cellForItemAtIndexPath:`
    func configure(cellViewModels: [CellViewModel])
    
    /// Called from `tableView:willDisplayCell:forItemAtIndexPath:` or `collectionView:willDisplayCell:forItemAtIndexPath:
    func configureWillDisplayCell(cellViewModel: CellViewModel)

    /// Called from `tableView(_:didEndDisplaying:forRowAt:)` or `collectionView(_:didEndDisplaying:forItemAt:)`
    func configureDidEndDisplaying(cellViewModel: CellViewModel)
}

// MARK: Default Implementation
extension CellViewModelConfigurable {
    func configure(cellViewModel: CellViewModel) {}
    
    func configure(cellViewModels: [CellViewModel]) {}
    
    func configureWillDisplayCell(cellViewModel: CellViewModel) {}
    
    func configureDidEndDisplaying(cellViewModel: CellViewModel) {}
}
