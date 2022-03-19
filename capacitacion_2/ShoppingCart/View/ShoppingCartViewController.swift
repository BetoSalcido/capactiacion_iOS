//
//  ShoppingCartViewController.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 22/01/22.
//

import UIKit

class ShoppingCartViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var footerView: UIView!
    @IBOutlet private var totalOfProductLabel: UILabel!
    @IBOutlet private var totalLabel: UILabel!
    @IBOutlet private var continueButton: UIButton!
    
    private var observations: [NSKeyValueObservation] = []
    
    var viewModel: ShoppingCartViewModel! {
        didSet {
            viewModel.displayDelegate = self
        }
    }
    
    // Método que solo se manda llamar la primera vez que entra a la pantalla
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mi carrito"
        
        guard viewModel != nil else {
            assertionFailure("`viewModel` is required for \(Self.self) to work.")
            return
        }
        
        observations = [
            viewModel.bind(\.totalOfProducts, to: totalOfProductLabel, at: \.text),
            viewModel.bind(\.total, to: totalLabel, at: \.text),
            viewModel.observe(\.showLoadingView) { [weak self] in
                if $0 {
                    self?.showLoadingView(true)
                } else {
                    self?.removeLoadingView()
                }
            },
            viewModel.bind(\.isViewHidden, to: tableView, at: \.isHidden),
            viewModel.bind(\.isViewHidden, to: footerView, at: \.isHidden)
        ]
        
        
        setUpView()
        setUpTableView()
    }
    
    // Método que se manda a llamar cada que se muestra la pantalla
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.handleViewDidAppear()
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
        return viewModel.totalOfCellViewModels
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModel = viewModel.cellViewModel(at: indexPath) else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath)
        if let configurable = cell as? CellViewModelConfigurable {
            configurable.configure(cellViewModel: cellViewModel)
        }
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

// MARK: - ShoppingCartViewModelDisplayDelegate
extension ShoppingCartViewController: ShoppingCartViewModelDisplayDelegate {
    func viewModelDisplayDelegate(_ viewModel: ShoppingCartViewModel) {
        tableView.reloadData()
    }
}

// MARK: - StoryboardInitializable
extension ShoppingCartViewController: StoryboardInitializable {
    static let storyboardName = "ShoppingCart"
}


