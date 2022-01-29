//
//  AnimalViewController.swift/Users/betosalcido/Desktop/capactiacion_iOS/capacitacion_2/AnimalViewController.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 22/01/22.
//

import UIKit

protocol AnimalDelegate: AnyObject {
    func addAnimal(name: String)
    func removeAnimal(name: String)
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
