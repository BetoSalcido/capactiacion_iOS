//
//  MainCell.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 15/01/22.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet private var productImage: UIImageView!
    @IBOutlet private var productName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with data: ProductData) {
        productName.text = data.name
        productImage.image = UIImage(named: data.image)
    }

}
