//
//  ShoppingCartViewController.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 22/01/22.
//

import UIKit

class ShoppingCartViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var totalOfProductLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    private var products = [ShoppingCart]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mi carrito"
        setUpView()
        setUpTableView()
        
        products.append(ShoppingCart(
                            name: "ELEFANTE 7001 -1 NEGRO VAQUETA  (21.5 - 26)",
                            code: "009928",
                            size: "25",
                            price: 759,
                            disccount: 0,
                            priceWitdhDisccount: 0,
                            image: "\("https://s3-us-west-1.amazonaws.com/calzzapato/normal/")ELEFANTE_7001_-1_NEGRO_VAQUETA__21.5_-_26__1.jpg")
        )
        
        products.append(ShoppingCart(
                            name: "VANS QFKBKA CORE CLASSIC BLACK/BLACK ERA CLASSICS  21.5-31",
                            code: "0988NZ",
                            size: "25",
                            price: 1259,
                            disccount: 10,
                            priceWitdhDisccount: 1000,
                            image: "\("https://s3-us-west-1.amazonaws.com/calzzapato/normal/")VANS_QFKBKA_CORE_CLASSIC_BLACKBLACK_ERA_CLASSICS__21.5-31__1.jpg")
        )
    }
}

// MARK: - Private Methods
private extension ShoppingCartViewController {
    func setUpView() {
        // Forma de agregar coner a un elemento
        continueButton.layer.cornerRadius = 5
        footerView.applyShadow()   
    }
    
    
    func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.reloadData()
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }
}

// MARK: - UITableViewDataSource
extension ShoppingCartViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingCartCell") as! ShoppingCartCell
        cell.configure(with: products[indexPath.section])
        return cell
    }
}

// MARK: - UITableViewDataSource
extension ShoppingCartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
}

