//
//  ViewController.swift
//  Collaboration-Project
//
//  Created by gvanca koxreidze on 13.06.24.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    
    var productList = [String: [ProductModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setupImage()
        
        NetworkService.shared.fetchProducts { response, error in
            if let error = error {
                print("Error fetching products: \(error)")
                return
            }
            
            if let response = response {
                
                self.productList = Dictionary(grouping: response.products, by: {
                    $0.category
                })
                print("Fetched products: \(self.productList)")
            }
        }
    }
    
    private func setupImage() {
        
        view.addSubview(imageView)
        imageView.load(from: URL(string: "https://picsum.photos/id/870/200/300?grayscale&blur=2")!)
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    
}

