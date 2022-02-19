//
//  MacStoreCell.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 05/02/22.
//

import UIKit

class MacStoreCell: UICollectionViewCell {
    static let reuseIdentifier = "MacStoreCell"
    
    @IBOutlet private var productTitleLabel: UILabel!
    @IBOutlet private var productPriceLabel: UILabel!
    @IBOutlet private var productStartsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with product: Product) {
        productTitleLabel.text = product.name
        productPriceLabel.text = product.price
        productStartsLabel.text = "\(product.starts)"
    }
    
}

