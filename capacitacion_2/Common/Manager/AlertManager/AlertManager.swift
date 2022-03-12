//
//  AlertManager.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 19/02/22.
//

import UIKit

class AlertManager {
    
    func showSimpleAlertView(on vc: UIViewController, with title: String, message:String,  handlerAction: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: handlerAction))
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
    }
        
    func showOverallMessage(on vc: UIViewController, handlerAction: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: "Sorry, something went wrong", message: "Please try again later", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: handlerAction))
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
    }
    
    func showConnectionError(on vc: UIViewController, handlerAction: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: "Connection Error", message: "Internet connection seems to be offline. Please try again later.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: handlerAction))
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
    }
}

