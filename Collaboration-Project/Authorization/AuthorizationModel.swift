//
//  Model.swift
//  Collaboration-Project
//
//  Created by Tatarella on 15.06.24.
//

import Foundation

struct User: Codable {
    var email: String
    var password: String
    var balance: Int
}
