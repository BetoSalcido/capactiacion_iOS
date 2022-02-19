//
//  HorizontalCell.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 19/02/22.
//

import UIKit

class HorizontalCell: UICollectionViewCell {
    static let reuseIdentifier = "HorizontalCell"
    
    @IBOutlet private var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension HorizontalCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.reuseIdentifier, for: indexPath) as! CardCell
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate
extension HorizontalCell: UICollectionViewDelegate {
    
}


// MARK: - UICollectionViewDelegateFlowLayout
extension HorizontalCell: UICollectionViewDelegateFlowLayout {
    /// Metodo encargado de configurar el tamaño de las celdas.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthPerItem = collectionView.frame.width - 30
        return CGSize(width: widthPerItem, height: 279)
    }
}
    

