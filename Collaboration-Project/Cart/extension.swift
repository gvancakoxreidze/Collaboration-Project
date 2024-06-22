//
//  extension.swift
//  Collaboration-Project
//
//  Created by Tornike Eristavi on 19.06.24.
//

import UIKit

extension UIImageView {
    func loadImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                return
            }

            guard let data = data, let image = UIImage(data: data) else {
                print("Invalid image data or format")
                return
            }

            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
}
