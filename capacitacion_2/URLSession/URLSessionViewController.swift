//
//  URLSessionViewController.swift
//  capacitacion_2
//
//  Created by Beto Salcido on 28/01/22.
//

import UIKit

class URLSessionViewController: UIViewController {

    struct Categories: Codable {
        let id: String?
        let node: Int?
        let description: String?
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "URLSession"
        print("viewDidLoad")

        httpExample()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    func httpExample() {
        let sharedSession = URLSession.shared

        if let url = URL(string: "https://api.calzzapato.xyz/api/menu/tree") {
            /// Creación del Request
            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            /// Creación del task
            /// El se esta ejecutando en background , por lo que es necesario usar el hilo princial (main) para retornar la información.
            let dataTask = sharedSession.dataTask(with: request, completionHandler: { (data, response, error) in
                
                /// Valida si hay un error al momento de hacer la petción
                if let error = error {
                    fatalError("Error: \(error.localizedDescription)")
                }
                
                /// Valida que la petición sea correcta con el statusCode
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    fatalError("Error: invalid HTTP response code")
                }
                
                /// Valida que se tenga la respuesta
                guard let data = data else {
                    fatalError("Error: missing response data")
                }
                
                /// Forma de transformar el data a un tipo de dato, en este caso sera un array del objeto tipo Categories.
                do {
                    let decoder = JSONDecoder()
                    let categories = try decoder.decode([Categories].self, from: data)
                    print(categories)
                }
                catch {
                    print("Error: \(error.localizedDescription)")
                }
                
            })

            /// Ejecuciín de la tarea
            dataTask.resume()
        }
    }

}
