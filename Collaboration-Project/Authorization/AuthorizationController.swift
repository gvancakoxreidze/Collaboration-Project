//
//  AuthorizationController.swift
//  Collaboration-Project
//
//  Created by Tatarella on 15.06.24.
//

import UIKit

class AuthorizationController: UIViewController {

    let authorizationHeader = AutorizationHeader()
    let authorizationForm = AuthorizationForm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAuthorizationView()
        view.backgroundColor = .white

    }
    
    private func setupAuthorizationView() {
        view.addSubview(authorizationHeader)
        view.addSubview(authorizationForm)
        authorizationHeader.translatesAutoresizingMaskIntoConstraints = false
        authorizationForm.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            authorizationHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            authorizationHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authorizationHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            
            authorizationForm.topAnchor.constraint(equalTo: authorizationHeader.bottomAnchor, constant: 40),
            authorizationForm.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authorizationForm.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            authorizationForm.heightAnchor.constraint(equalToConstant: 210)
        ])
    }

}
