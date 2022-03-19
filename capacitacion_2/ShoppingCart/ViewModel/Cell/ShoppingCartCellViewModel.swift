//
//  ShoppingCartCellViewModel.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 19/03/22.
//

import Foundation

protocol ShoppingCartCellViewModelDelegate : AnyObject {
    
}

class ShoppingCartCellViewModel: NSObject {
    
    /// Binding
    @objc dynamic private(set) var title: String?
    @objc dynamic private(set) var imageURL: String?
    
    private let product: Product2
    
    weak var delegate: ShoppingCartCellViewModelDelegate?
    
    init(product: Product2) {
        self.product = product
        
        super.init()
        applyBinding()
    }

    func applyBinding() {
        title = product.name ?? ""
        if let photos = product.photos, !photos.isEmpty, let url = photos[0].photoDescription {
            imageURL =  "\("https://s3-us-west-1.amazonaws.com/calzzapato/normal/")\(url)"
        }
    }
}


// MARK: - CellViewModel
extension ShoppingCartCellViewModel: CellViewModel {
    var cellIdentifier: String {
        return "ShoppingCartCell"
    }
}
