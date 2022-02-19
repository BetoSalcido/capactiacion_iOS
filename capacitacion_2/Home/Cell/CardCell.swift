//
//  CardCell.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 19/02/22.
//

import UIKit

class CardCell: UICollectionViewCell {
    static let reuseIdentifier = "CardCell"
    
    @IBOutlet private var cardView: UIView!
    @IBOutlet private var viewButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.layer.cornerRadius = 10
        viewButton.layer.cornerRadius = 10
    }
    
    func configure() {

    }
        
}
