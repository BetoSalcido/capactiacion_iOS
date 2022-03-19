//
//  ShoppingCartViewModel.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 19/03/22.
//

import Foundation

protocol ShoppingCartViewModelDisplayDelegate: AnyObject {
    func viewModelDisplayDelegate(_ viewModel: ShoppingCartViewModel)
}

class ShoppingCartViewModel: NSObject {
    
    /// Binding
    @objc dynamic private(set) var showLoadingView: Bool = false
    @objc dynamic private(set) var isViewHidden: Bool = true
    @objc dynamic private(set) var totalOfProducts: String?
    @objc dynamic private(set) var total: String?
    
    private lazy var shoppingCartManager = ShoppingCartManager(netWorkingManager: netWorkingManager)
    private var cellViewModels = [CellViewModel]()

    private var shoppingCartData: ShoppingCart? {
        didSet {
            applyBindings()
            generateCellViewModels()
        }
    }
    
    // Iniitial Variables
    private let netWorkingManager: NetWorkingManager
    private let alertManager: AlertManager
    
    weak var displayDelegate: ShoppingCartViewModelDisplayDelegate?
    
    init(netWorkingManager: NetWorkingManager,
         alertManager: AlertManager) {
        self.netWorkingManager = netWorkingManager
        self.alertManager = alertManager
    }
}

// MARK: - Public Methods
extension ShoppingCartViewModel {
    var totalOfCellViewModels: Int {
        return cellViewModels.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CellViewModel? {
        let sections = cellViewModels
        let sectionIndex = indexPath.section
        guard sections.indices.contains(sectionIndex) else {
            return nil
        }

        return sections[sectionIndex]
    }
}

// MARK: - Handler Methods
extension ShoppingCartViewModel {
    func handleViewDidAppear() {
        showLoadingView = true
        
        shoppingCartManager.getShoppingCart { [weak self] result in
            guard let self = self else { return }
            self.showLoadingView = false
            switch result {
            case .success(let result):
                self.shoppingCartData = result
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - Private Methods
private extension ShoppingCartViewModel {
    func applyBindings() {
        isViewHidden = false
        if let numberOfProducts = shoppingCartData?.totalProducts {
            totalOfProducts = "\(numberOfProducts)"
        }
        
        if let totalPrice = shoppingCartData?.total {
            total = "$\(totalPrice)"
        }
    }
    
    func generateCellViewModels() {
        cellViewModels.removeAll()
        
        guard let products = shoppingCartData?.products else {
            return
        }
        
        cellViewModels = products.map ({
            let cellViewModel = ShoppingCartCellViewModel(product: $0)
            cellViewModel.delegate = self
            return cellViewModel
        })
        
        displayDelegate?.viewModelDisplayDelegate(self)
    }
}


// MARK: - ShoppingCartCellViewModelDelegate
extension ShoppingCartViewModel: ShoppingCartCellViewModelDelegate {
    
}
