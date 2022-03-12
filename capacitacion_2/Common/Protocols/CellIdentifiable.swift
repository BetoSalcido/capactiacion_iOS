//
//  CellIdentifiable.swift
//  calzzapato
//
//  Created by Beto Salcido on 02/05/21.
//  Copyright © 2021 BetoSalcido. All rights reserved.
//

import Foundation

/// Provides a UITableViewCell or UICollectionViewCell reuse identifier.
protocol CellIdentifiable: AnyObject {
    var cellIdentifier: String { get }
}
