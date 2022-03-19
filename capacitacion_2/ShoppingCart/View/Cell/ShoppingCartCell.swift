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
    
    private var observations: [NSKeyValueObservation] = []
    private var viewModel: ShoppingCartCellViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.applyShadow()
    }
    
    override func prepareForReuse() {
        observations.removeAll()
    }
    
    func loadImageU(with stringURL:String) {
        if let url = URL(string: stringURL ) {
            let resource = ImageResource(downloadURL: url, cacheKey: "\(stringURL)")
            productImage.kf.indicatorType = .activity
            productImage.kf.setImage(with: resource)
        }
    }
}

// MARK: - CellViewModelConfigurable
extension ShoppingCartCell: CellViewModelConfigurable {
    func configure(cellViewModel: CellViewModel) {
        guard let viewModel = cellViewModel as? ShoppingCartCellViewModel else {
            return
        }
        
        self.viewModel = viewModel
        
        observations = [
            viewModel.bind(\.title, to: productNameLabel, at: \.text),
            viewModel.observe(\.imageURL) { [weak self] in
                guard let url = $0 else { return }
                self?.loadImageU(with: url)
            }
        ]
        
    }
}


