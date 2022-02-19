//
//  String+App.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 19/02/22.
//

import Foundation

// MARK: - Form Methods
extension String {
    func isValidEmail() -> Bool {
        guard !self.lowercased().hasPrefix("mailto:") else { return false }
        guard let emailDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else { return false }
        let matches = emailDetector.matches(in: self, options: NSRegularExpression.MatchingOptions.anchored, range: NSRange(location: 0, length: self.count))
        guard matches.count == 1 else { return false }
        return matches[0].url?.scheme == "mailto"
    }

    func isValidPassword(password: String) -> Bool {
        return password.count >= 8 ? true : false
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}


//func textFieldDidChangeSelection(_ textField: UITextField) {
//    if textField == emailTextField {
//        if let text = textField.text, text.isValidEmail() {
//            userEmail = text.trim()
//            saveButton.isEnabled = true
//        } else {
//            saveButton.isEnabled = false
//        }
//     }
//}
//
//func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//    if textField.text?.last == " "  && string == " " {
//        return false
//    }
//    return true
//}
