//
//  HomeViewController.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 15/01/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var categoriesButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Variable para poner el titulo a la pantalla
        self.title = "Inicio"
    }
}

// MARK: - Actions
extension HomeViewController {
    @IBAction func didTapCollectionViewButton(_ sender: Any) {
        guard let viewController = UIStoryboard(name: "CollectionView", bundle: nil).instantiateViewController(identifier: "CollectionViewController") as? CollectionViewController else {
            print("Error")
            return
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func didTapCategoriesButton(_ sender: Any) {
        guard let viewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "AnimalViewController") as? AnimalViewController else {
            print("Error")
            return
        }
        
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    @IBAction func didTapTableViewButton(_ sender: Any) {
        guard let viewController = UIStoryboard(name: "ShoppingCart", bundle: nil).instantiateViewController(identifier: "ShoppingCartViewController") as? ShoppingCartViewController else {
            print("Error")
            return
        }
        // Opcion para ocultar el tabBar
        viewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
}

extension HomeViewController: AnimalDelegate {
    func addAnimal(name: String) {
        print(name)
    }
}

