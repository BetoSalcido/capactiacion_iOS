//
//  TextFieldViewController.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 29/01/22.
//

import UIKit

class TextFieldViewController: UIViewController {

    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TextField"
        
        nameTextField.delegate = self
        lastNameTextField.delegate = self
    }
}

// MARK: - UITextFieldDelegate
extension TextFieldViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text {
            if textField == nameTextField {
                print("Name: \(text)")
            } else {
                print("LastName: \(text)")
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    /// Método para agregar validaciones
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text?.last == " " && string == " " {
            return false
        }
        
        return true
        
    }

}
