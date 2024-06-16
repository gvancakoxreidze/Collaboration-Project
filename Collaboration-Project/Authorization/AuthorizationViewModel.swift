//
//  ViewModel.swift
//  Collaboration-Project
//
//  Created by Tatarella on 15.06.24.
//

import Foundation

class AuthorizationViewModel {
    
    
    func login(email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        
        guard !email.isEmpty && !password.isEmpty else {
            completion(false, "გთხოვთ შეავსოთ ყველა ველი")
            return
        }
        
        guard email.isValidEmail() else {
            completion(false, "ელ-ფოსტის ფორმატი არასწორია")
            return
        }
        
        completion(true, "ველები სწორიააა")
    }
    
}

