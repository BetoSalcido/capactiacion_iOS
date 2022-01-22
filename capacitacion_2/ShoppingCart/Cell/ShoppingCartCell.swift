//
//  ShoppingCartCell.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 22/01/22.
//

import UIKit
import Kingfisher

class ShoppingCartCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productCodeLabel: UILabel!
    @IBOutlet weak var productSizeLabel: UILabel!
    @IBOutlet weak var availableProductsLabel: UILabel!
    @IBOutlet weak var productDiscountLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productFinalPriceLabel: UILabel!
    @IBOutlet weak var numberOfProductsAddedLabel: UILabel!
    @IBOutlet weak var productQuantityStackView: UIStackView!
    @IBOutlet weak var productDisccountStackView: UIStackView!
    
    @IBOutlet weak var addItemButton: UIButton!
    @IBOutlet weak var removeItemButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    @IBAction func removeButtonTapped(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.applyShadow()
    }

}

// Public Methods
extension ShoppingCartCell {
    func configure(with data: ShoppingCart) {
        productNameLabel.text = data.name
        productCodeLabel.text = "Código: \(data.code)"
        productSizeLabel.text = data.size
        productFinalPriceLabel.text = "\(data.price)"
        
        //Forma de validar si una url funciona o es verdadera
        if let url = URL(string: data.image) {
            let resource = ImageResource(downloadURL: url)
            productImage.kf.indicatorType = .activity
            productImage.kf.setImage(with: resource)
        }
        
        productDisccountStackView.isHidden = data.disccount == 0
    }
    
}


