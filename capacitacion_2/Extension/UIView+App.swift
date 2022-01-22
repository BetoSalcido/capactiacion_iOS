//
//  UIView+App.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 22/01/22.
//

import UIKit

extension UIView {
    
    func applyShadow(cornerRadius: CGFloat = 10, addShadow: Bool = true) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.backgroundColor = UIColor.white.cgColor
        
        if addShadow {
            self.layer.shadowColor = UIColor.lightGray.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            self.layer.shadowRadius = 1.0
            self.layer.shadowOpacity = 0.5
            self.layer.masksToBounds = false
        }
    }
}


