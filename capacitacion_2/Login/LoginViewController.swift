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
    
    private var email: String = ""
    private var password: String = ""
    
    private let emailSaved = "beto@welcometolevel.com"
    private let passwordSaved = "12345"
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        signInButton.layer.cornerRadius = 5
        
        /// Forma de agregar un tap a toda la pantalla.
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    /// Métofo para cerrar el keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        if emailSaved == email && passwordSaved == password {
            UserDefaults.standard.set(true, forKey: "isLogged")
            sceneDelegate.switchRooter()
        } else {
            AlertManager.showSimpleAlertView(on: self, with: "Lo Sentimos", message: "Los datos no son correctos", handlerAction: nil)
        }
    }
}

// MARK: - Private Methods
private extension LoginViewController {
    func validateForm() {
        signInButton.isEnabled  = email.isValidEmail() && !password.isEmpty
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if emailTextField == textField {
            emailTextField.layer.borderColor = UIColor.orange.cgColor
        } else {
            passwordTextField.layer.borderColor = UIColor.orange.cgColor
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if emailTextField == textField {
            emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        } else {
            passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text {
            if textField == emailTextField {
                email = text
            } else {
                password = text
            }
            
            validateForm()
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
