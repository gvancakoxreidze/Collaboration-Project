//
//  Extensions.swift
//  Collaboration-Project
//
//  Created by Tatarella on 14.06.24.
//

import Foundation
import UIKit


extension UIImageView {
    
    func load(from url: URL) {
        DispatchQueue.global().async {
            [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
