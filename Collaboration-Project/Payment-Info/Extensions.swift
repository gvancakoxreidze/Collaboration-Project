//
//  Extensions.swift
//  Collaboration-Project
//
//  Created by Tatarella on 14.06.24.
//

import UIKit

extension UIImageView {
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }.resume()
    }
}
