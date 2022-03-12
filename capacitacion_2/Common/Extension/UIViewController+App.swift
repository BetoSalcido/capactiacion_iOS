//
//  UIViewController+App.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 15/01/22.
//

import UIKit

extension UIViewController {
    @available(iOS 13.0, *)
    var sceneDelegate: SceneDelegate {
        return UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
    }
}

// MARK: - Loading View methods
extension UIViewController {
    /// Method to add a loadingView in the mainView
    func showLoadingView(_ transparent: Bool = false) {
        DispatchQueue.main.async {
            let container = UIView()
            let activityIndicator = UIActivityIndicatorView()
            
            container.frame = self.view.frame
            container.center = self.view.center
            container.backgroundColor = transparent ? UIColor.clear : UIColor.black.withAlphaComponent(0.5)
            container.tag = 10000
            
            activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0);
            if #available(iOS 13.0, *) {
                activityIndicator.style = UIActivityIndicatorView.Style.large
            } else {
                activityIndicator.transform = CGAffineTransform(scaleX: 2, y: 2)
                activityIndicator.style = .gray
            }
            activityIndicator.center = self.view.center
            activityIndicator.tag = 11000
            
            container.addSubview(activityIndicator)
            self.view.addSubview(container)
            activityIndicator.startAnimating()
        }
        
    }
    
    /// Method to remove a loadingView in the mainView
    func removeLoadingView() {
        DispatchQueue.main.async {
            for view in self.view.subviews {
                if (view.tag == 10000) {
                    view.removeFromSuperview()
                }
            }
        }
    }
}
