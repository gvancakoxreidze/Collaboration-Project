//
//  ViewController.swift
//  Collaboration-Project
//
//  Created by gvanca koxreidze on 13.06.24.
//

import UIKit

class ViewController: UIViewController {
    let imageView = UIImageView()
    let showPopupButton = UIButton()
    let popupView = PopUpViewController()
    var popupTopConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setupImage()
        setupShowPopupButton()
        setupPopupView()
    }
    
    private func setupImage() {
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        imageView.loadImage(from: URL(string: "https://picsum.photos/id/870/200/300?grayscale&blur=2")!)
    }
    
    private func setupShowPopupButton() {
        showPopupButton.setTitle("გადახდა", for: .normal)
        showPopupButton.setTitleColor(.white, for: .normal)
        showPopupButton.backgroundColor = .blue
        showPopupButton.layer.cornerRadius = 8
        showPopupButton.addTarget(self, action: #selector(showPopupButtonTapped), for: .touchUpInside)
        view.addSubview(showPopupButton)
        
        showPopupButton.translatesAutoresizingMaskIntoConstraints = false
        showPopupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showPopupButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        showPopupButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        showPopupButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupPopupView() {
        view.addSubview(popupView)
        popupView.returnButtonTappedAction = { [weak self] in
            self?.hidePopup()
        }
        popupView.translatesAutoresizingMaskIntoConstraints = false
        popupTopConstraint = popupView.topAnchor.constraint(equalTo: view.bottomAnchor)
        popupTopConstraint?.isActive = true
        popupView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        popupView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        popupView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8).isActive = true
    }
    
    @objc private func showPopupButtonTapped() {
        showPopup()
    }
    
    private func showPopup() {
        view.layoutIfNeeded()
        popupTopConstraint?.constant = -popupView.frame.height
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func hidePopup() {
        popupTopConstraint?.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
    }
}

extension UIImageView {
    func loadImage(from url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}
