//
//  UITextField+App.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 19/02/22.
//

import UIKit

extension UITextField {
    enum Position {
        case left
        case right
    }
    
    func setIcon(with image: UIImage, position: Position) {
        let iconView = UIImageView(frame: CGRect(x: 0, y: 5, width: 20, height: 20))
        iconView.image = image
        
        let iconContainerView: UIView = UIView(frame:CGRect(x: 0, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        
        if position == .left {
            leftView = iconContainerView
            leftViewMode = .always
            
        } else {
            rightView = iconContainerView
            rightViewMode = .always
        }
        

    }
}
