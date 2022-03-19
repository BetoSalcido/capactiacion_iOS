//
//  LoginViewController.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 19/02/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet private var signInButton: UIButton!
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    
    private var observations: [NSKeyValueObservation] = []
    
    var viewModel: LoginViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard viewModel != nil else {
            assertionFailure("`viewModel` is required for \(Self.self) to work.")
            return
        }
        
        observations = [
//            viewModel.bind(\.count, to: footerCountLabel, at: \.text),
//            viewModel.bind(\.count, to: footerCountLabel, at: \.isHidden),
            viewModel.bind(\.isSignInButtonEnabled, to: signInButton, at: \.isEnabled),
            viewModel.observe(\.signTitle) { [signInButton] in
                guard let title = $0  else { return }
                signInButton?.setTitle(title, for: .normal)
            },
            viewModel.observe(\.isEmailTextFieldSelected) { [emailTextField] in
                guard let color = $0 else { return }
                emailTextField?.layer.borderColor = color.cgColor
            },
            viewModel.observe(\.isPasswordTextFieldSelected) { [passwordTextField] in
                guard let color = $0 else { return }
                passwordTextField?.layer.borderColor = color.cgColor
            },
            viewModel.observe(\.showLoadingView) { [weak self] in
                if $0 {
                    self?.showLoadingView(true)
                } else {
                    self?.removeLoadingView()
                }
            }
        ]
    
        setUpView()
        setUpTexFields()
    }
    
    /// Método para cerrar el keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        viewModel.handleSignInButtonPressed()
    }
}

// MARK: - Private Methods
private extension LoginViewController {
    func setUpView() {
        signInButton.layer.cornerRadius = 5
        
        /// Forma de agregar un tap a toda la pantalla.
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func setUpTexFields() {
        emailTextField.delegate = self
        emailTextField.tag = 100
        emailTextField.setIcon(with: UIImage(named: "iconEmail")!, position: .right)
        emailTextField.layer.borderWidth = 0.5
        emailTextField.layer.cornerRadius = 5
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        passwordTextField.delegate = self
        passwordTextField.setIcon(with: UIImage(named: "iconSecure")!, position: .right)
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        viewModel.handleTextFieldDidBeginEditing(isEmailSelected: emailTextField == textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        viewModel.handleTextFieldDidEndEditing(isEmailSelected: emailTextField == textField)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == emailTextField {
            viewModel.handleEmailTextFieldDidChangeSelection(with: textField.text ?? "")
        } else {
            viewModel.handlePasswordTextFieldDidChangeSelection(with: textField.text ?? "")
        }
    }
    
    // Metodo para hacer validaciones del texto
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text?.last == " "  && string == " " {
            return false
        }
        return true
    }
}

// MARK: - LoginViewModelDelegate
extension LoginViewController: LoginViewModelDelegate {
    func viewModelDidLogInSuccessfully(_ viewModel: LoginViewModel) {
        UserDefaults.standard.set(true, forKey: "isLogged")
        sceneDelegate.switchRooter()
    }
}

// MARK: - StoryboardInitializable
extension LoginViewController: StoryboardInitializable {
    static var storyboardName = "Login"
}
