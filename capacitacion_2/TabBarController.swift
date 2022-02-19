//
//  TabBarController.swift
//  Kelder
//
//  Created by Beto Salcido on 15/04/21.
//  Copyright © 2021 BetoSalcido. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
        self.delegate = self

        setUpViewController()
    }
}

// MARK: - Private Methods
private extension TabBarController {
    
    func setUpViewController() {
        let homeViewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let macStoreViewController = UIStoryboard(name: "CollectionView", bundle: nil).instantiateViewController(withIdentifier: "MacStoreViewController") as! MacStoreViewController
        let shoppingCartViewController = UIStoryboard(name: "ShoppingCart", bundle: nil).instantiateViewController(withIdentifier: "ShoppingCartViewController") as! ShoppingCartViewController
        
        // Es una variable del TabBarController
        viewControllers = [
            createTabController(for: homeViewController, title: "Inicio", selected: UIImage(named: "icon_ic_kelder")!),
            createTabController(for: macStoreViewController, title: "MacStore", selected: UIImage(named: "iconShop")!),
            createTabController(for: shoppingCartViewController, title: "ShoppingCart", selected: UIImage(named: "iconCart")!),
        ]
    }
    
    func createTabController(for rootViewController: UIViewController, title: String, selected: UIImage) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.navigationBar.barTintColor = .white
        navController.tabBarItem.image = selected
        navController.tabBarItem.title = title
        navController.navigationBar.barStyle = .default
        return navController
    }
}

// MARK: - UITabBarControllerDelegate
extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }
}
    
