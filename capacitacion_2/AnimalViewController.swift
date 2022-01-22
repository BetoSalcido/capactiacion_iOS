//
//  AnimalViewController.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 22/01/22.
//

import UIKit

protocol AnimalDelegate: AnyObject {
    func addAnimal(name: String)
}

class AnimalViewController: UIViewController {
    
    weak var delegate: AnimalDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        addAniaml()
    }
    
    
    func addAniaml() {
        delegate?.addAnimal(name: "Dog")
    }

}
