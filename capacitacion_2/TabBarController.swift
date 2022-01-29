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
        let collectionViewController = UIStoryboard(name: "CollectionView", bundle: nil).instantiateViewController(withIdentifier: "CollectionViewController") as! CollectionViewController
        let urlSessionViewController = URLSessionViewController()
        
        // Es una variable del TabBarController
        viewControllers = [
            createTabController(for: homeViewController, title: "Inicio", selected: UIImage(named: "icon_ic_kelder")!),
            createTabController(for: urlSessionViewController, title: "URLSession", selected: UIImage(named: "icon_ic_kelder")!),
            createTabController(for: collectionViewController, title: "CollectionView", selected: UIImage(named: "icon_ic_kelder")!),
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
    
