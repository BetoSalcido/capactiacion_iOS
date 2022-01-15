//
//  TableViewController.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 15/01/22.
//

import UIKit

struct ProductData {
    let name: String
    let image: String
}

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var macbookData = [ProductData]()
    var iPhoneData = [ProductData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        
        macbookData.append(contentsOf: [
            ProductData(name: "Mackbook Pro 2019", image: "background")
        ])
        
        iPhoneData.append(contentsOf: [
            ProductData(name: "iPhone 6", image: "background"),
            ProductData(name: "iPhone 7", image: "background"),
            ProductData(name: "iPhone 8", image: "background"),
            ProductData(name: "iPhone X", image: "background"),
            ProductData(name: "iPhone 11", image: "background")
        ])
        
    }
    
    func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        // Oculta los borde que se ponen de forma defaul en las celdas
//        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
        
        // Oculta el espacio sobrante de las celdas 
        tableView.tableFooterView = UIView()
        
        // Reinciia la tabla para mostrar todos los valores
        tableView.reloadData()
    }
}

extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Sirve para definir el total de elementos que tendra la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return macbookData.count
        }
        
        return iPhoneData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell") as! MainCell
        // Oculta la seleccion de las celdas
        cell.selectionStyle = .none
        
        if indexPath.section == 0 {
            cell.configure(with: macbookData[indexPath.row])
        } else {
            cell.configure(with: iPhoneData[indexPath.row])
        }
        return cell
    }
    
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let ajustesViewController = AjustesViewController()
            ajustesViewController.productData = macbookData[indexPath.row]
            navigationController?.pushViewController(ajustesViewController, animated: true)
        } else {
            let ajustesViewController = AjustesViewController()
            ajustesViewController.productData = iPhoneData[indexPath.row]
            navigationController?.pushViewController(ajustesViewController, animated: true)
        }
    }
    
}
