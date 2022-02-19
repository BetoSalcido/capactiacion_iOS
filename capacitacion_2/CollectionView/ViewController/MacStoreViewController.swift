//
//  MacStoreViewController.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 05/02/22.
//

import UIKit

class MacStoreViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var headerTitleLabel: UILabel!
    @IBOutlet weak var headerBackgroundView: UIImageView!
    @IBOutlet weak var headerView: UIView!
    
    private var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpCollectionView()
        generateData()
    }
    
}

// MARK: - Private Methods
private extension MacStoreViewController {
    func setUpView() {
        headerBackgroundView.layer.cornerRadius = 20
    }
    
    func setUpCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func generateData() {
        products.append(Product(name: "MacBook Pro 14", price: "$1,900", starts: 4.5, description: ""))
        products.append(Product(name: "MacBook Pro 15", price: "$2,900", starts: 4.5, description: ""))
        products.append(Product(name: "MacBook Pro 16", price: "$3,900", starts: 4.5, description: ""))
        products.append(Product(name: "MacBook Pro 17", price: "$4,900", starts: 4.5, description: ""))
        products.append(Product(name: "MacBook Pro 18", price: "$5,900", starts: 4.5, description: ""))
        products.append(Product(name: "MacBook Pro 19", price: "$6,900", starts: 4.5, description: ""))
        
        collectionView.reloadData()
    }
}

// MARK: - Flows Methods
private extension MacStoreViewController {
    func runProductDetail(with product: Product) {
        guard let viewController = UIStoryboard(name: "CollectionView", bundle: nil).instantiateViewController(identifier: "ProductDetailViewController") as? ProductDetailViewController else {
            return
        }
        viewController.product = product
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension MacStoreViewController: UICollectionViewDataSource {
    /// Método para indicar el numero de elementos en el collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    /// Método para cargar las celdas
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MacStoreCell.reuseIdentifier, for: indexPath) as! MacStoreCell
        cell.configure(with: products[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension MacStoreViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        runProductDetail(with: products[indexPath.row])
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MacStoreViewController: UICollectionViewDelegateFlowLayout {
    /// Metodo encargado de configurar el tamaño de las celdas.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCells: CGFloat = 2
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / numberOfCells - lay.minimumInteritemSpacing
        return CGSize(width: widthPerItem, height: 219)
    }
}
    

