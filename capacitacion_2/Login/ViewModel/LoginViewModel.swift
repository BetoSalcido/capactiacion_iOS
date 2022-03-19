//
//  LoginViewModel.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 12/03/22.
//

import Foundation
import UIKit

protocol LoginViewModelDelegate: AnyObject {
    func viewModelDidLogInSuccessfully(_ viewModel: LoginViewModel)
}

class LoginViewModel: NSObject {
    /// Binding
    @objc dynamic private(set) var signTitle: String?
    @objc dynamic private(set) var showLoadingView: Bool = false
    @objc dynamic private(set) var isSignInButtonEnabled: Bool = false
    @objc dynamic private(set) var isEmailTextFieldSelected: UIColor?
    @objc dynamic private(set) var isPasswordTextFieldSelected: UIColor?
    
    private lazy var loginManager = LoginManager(netWorkingManager: netWorkingManager)
    
    private var email: String = ""
    private var password: String = ""
    
    /// Initial Variables
    private let netWorkingManager : NetWorkingManager
    private let alertManager : AlertManager
    
    weak var delegate: LoginViewModelDelegate?
    
    init(netWorkingManager: NetWorkingManager,
         alertManager: AlertManager) {
        self.netWorkingManager = netWorkingManager
        self.alertManager = alertManager
        
        super.init()
        applyBinding()
    }
    
}

// MARK: Private Methods
private extension LoginViewModel {
    func applyBinding() {
        signTitle = "Iniciar Sesión"
    }
    
    func validForm() {
        isSignInButtonEnabled = email.isValidEmail() && !password.isEmpty
    }
    
}

// MARK: Handler Methods
extension LoginViewModel {
    func handleEmailTextFieldDidChangeSelection(with email: String ) {
        self.email = email
        validForm()
    }
    
    func handlePasswordTextFieldDidChangeSelection(with password: String ) {
        self.password = password
        validForm()
    }
    
    func handleTextFieldDidBeginEditing(isEmailSelected: Bool) {
        if isEmailSelected {
            isEmailTextFieldSelected = UIColor.orange
        } else {
            isPasswordTextFieldSelected = UIColor.orange
        }
    }
    
    func handleTextFieldDidEndEditing(isEmailSelected: Bool) {
        if isEmailSelected {
            isEmailTextFieldSelected = UIColor.lightGray
        } else {
            isPasswordTextFieldSelected = UIColor.lightGray
        }
    }
    
    func handleSignInButtonPressed() {
        showLoadingView = true
        let data = Login.Request(email: email,
                                 password: password,
                                 withFacebook: false,
                                 facebookId: "",
                                 accessToken: "")
        
        loginManager.login(with: data) { [weak self ] result in
            guard let self = self else { return }
            self.showLoadingView = false
            
            switch result {
            case .success(let result):
                if let response = result {
                    print(response)
                    UserDefaults.standard.setValue(response.token ?? "", forKey: "token")
                    self.delegate?.viewModelDidLogInSuccessfully(self)
                }
                
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
