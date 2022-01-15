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
    
    @IBAction func didTapCategoriesButton(_ sender: Any) {
        // Forma de mostrar un controlador usando storyboards
        guard let viewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "CategoriesViewController") as? CategoriesViewController else {
            print("ViewController not found")
            return
        }

        navigationController?.pushViewController(viewController, animated: true)
        
        // Forma de mostrar un controlador usando xibs, descomentar para mostrar la pantalla con xib
//        let ajustesViewController = AjustesViewController()
//        navigationController?.pushViewController(ajustesViewController, animated: true)
    }
    
    @IBAction func didTapTableViewButton(_ sender: Any) {
        guard let viewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "TableViewController") as? TableViewController else {
            print("ViewController not found")
            return
        }

        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Variable para poner el titulo a la pantalla
        self.title = "Inicio"
        productImage.image = UIImage.HomeImages.productImage
    
    }


}

