//
//  VerticalCell.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 19/02/22.
//

import UIKit

class VerticalCell: UICollectionViewCell {
    static let reuseIdentifier = "VerticalCell"
    
    @IBOutlet private var cardView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.layer.cornerRadius = 10
    }
}
