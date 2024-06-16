//
//  ViewController.swift
//  Collaboration-Project
//
//  Created by gvanca koxreidze on 13.06.24.
//

import UIKit

class ViewController: UIViewController {
    let imageView = UIImageView()
    let popupView = UIView()
    let messageLabel = UILabel()
    let returnButtonContainer = UIView()
    let returnButton = UIButton()
    let showPopupButton = UIButton()
    let handleView = UIView()
    let imageOfUnsucces = UIImage(named: "imageOfUnsucces")
    let imageofSucces = UIImage()
    var popupTopConstraint: NSLayoutConstraint?
    var isPopupVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setupImage()
        setupShowPopupButton()
        setupPopupView()
        setupGestureRecognizers()
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
    
    private func setupPopupView() {
        popupView.backgroundColor = .white
        view.addSubview(popupView)
        
        handleView.backgroundColor = .lightGray
        handleView.layer.cornerRadius = 2
        popupView.addSubview(handleView)
        handleView.translatesAutoresizingMaskIntoConstraints = false
        handleView.topAnchor.constraint(equalTo: popupView.topAnchor, constant: 8).isActive = true
        handleView.centerXAnchor.constraint(equalTo: popupView.centerXAnchor).isActive = true
        handleView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        handleView.heightAnchor.constraint(equalToConstant: 4).isActive = true
        
        let imageViewOfUnsucces = UIImageView(image: imageOfUnsucces)
        imageViewOfUnsucces.contentMode = .scaleAspectFit
        popupView.addSubview(imageViewOfUnsucces)
        imageViewOfUnsucces.translatesAutoresizingMaskIntoConstraints = false
        imageViewOfUnsucces.centerXAnchor.constraint(equalTo: popupView.centerXAnchor).isActive = true
        imageViewOfUnsucces.centerYAnchor.constraint(equalTo: popupView.centerYAnchor, constant: -20).isActive = true
        imageViewOfUnsucces.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageViewOfUnsucces.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        messageLabel.text = "სამწუხაროდ გადახდა ვერ მოხერხდა, სცადეთ თავიდან."
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.textColor = .black
        popupView.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.topAnchor.constraint(equalTo: imageViewOfUnsucces.bottomAnchor, constant: 8).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: popupView.centerXAnchor).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 20).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -20).isActive = true
        
        returnButtonContainer.backgroundColor = .systemTeal
        returnButtonContainer.layer.cornerRadius = 20
        popupView.addSubview(returnButtonContainer)
        returnButtonContainer.translatesAutoresizingMaskIntoConstraints = false
        returnButtonContainer.heightAnchor.constraint(equalToConstant: 60).isActive = true
        returnButtonContainer.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 20).isActive = true
        returnButtonContainer.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -20).isActive = true
        returnButtonContainer.bottomAnchor.constraint(equalTo: popupView.bottomAnchor, constant: -20).isActive = true
        
        returnButton.setTitle("უკან დაბრუნება", for: .normal)
        returnButton.setTitleColor(.white, for: .normal)
        returnButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        returnButton.addTarget(self, action: #selector(returnButtonTapped), for: .touchUpInside)
        returnButtonContainer.addSubview(returnButton)
        returnButton.translatesAutoresizingMaskIntoConstraints = false
        returnButton.centerXAnchor.constraint(equalTo: returnButtonContainer.centerXAnchor).isActive = true
        returnButton.centerYAnchor.constraint(equalTo: returnButtonContainer.centerYAnchor).isActive = true
        
        popupView.translatesAutoresizingMaskIntoConstraints = false
        popupTopConstraint = popupView.topAnchor.constraint(equalTo: view.bottomAnchor)
        popupTopConstraint?.isActive = true
        popupView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        popupView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        popupView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8).isActive = true
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
    
    private func setupGestureRecognizers() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        handleView.addGestureRecognizer(panGesture)
    }
    
    @objc private func returnButtonTapped() {
        hidePopup()
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
        isPopupVisible = true
    }
    
    private func hidePopup() {
        popupTopConstraint?.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        } completion: { (_) in
            self.isPopupVisible = false
        }
    }
    
    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        if gesture.state == .changed {
            let newY = popupView.frame.origin.y + translation.y
            if newY >= view.frame.height - popupView.frame.height && newY <= view.frame.height {
                popupView.frame.origin.y = newY
                gesture.setTranslation(.zero, in: view)
            }
        } else if gesture.state == .ended {
            let velocity = gesture.velocity(in: view)
            if velocity.y > 0 {
                hidePopup()
            } else {
                showPopup()
            }
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
