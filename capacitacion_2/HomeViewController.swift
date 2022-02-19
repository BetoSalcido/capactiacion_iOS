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
    @IBAction func didTapURLSessionButton(_ sender: Any) {
        let viewController = URLSessionViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func didTapCollectionViewButton(_ sender: Any) {
        guard let viewController = UIStoryboard(name: "CollectionView", bundle: nil).instantiateViewController(identifier: "MacStoreViewController") as? MacStoreViewController else {
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
        /// Forma de instanciar un delegado de la clase padre.
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
    
    @IBAction func didTapTextFieldButton(_ sender: Any) {
        guard let viewController = UIStoryboard(name: "TextField", bundle: nil).instantiateViewController(identifier: "TextFieldViewController") as? TextFieldViewController else {
            print("Error")
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
        
    }
    
}

// MARK: - AnimalDelegate
extension HomeViewController: AnimalDelegate {
    func removeAnimal(name: String) {
        
    }
    
    func addAnimal(name: String) {
        print(name)
    }
}



