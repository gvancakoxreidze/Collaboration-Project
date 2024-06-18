//
//  ProductsListVC.swift
//  Collaboration-Project
//
//  Created by gvanca koxreidze on 17.06.24.
//

import UIKit

class ProductsListVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        
        let containerView = UIView(frame: view.bounds)
        containerView.backgroundColor = UIColor.clear
        
        
        //For Product Listing
        let minusButton1 = createMinusButton(imageName: "MinusButton", frame: CGRect(x: 270, y: 293, width: 24, height: 24))
        containerView.addSubview(minusButton1)
        
        let minusButton2 = createMinusButton(imageName: "MinusButton", frame: CGRect(x: 269, y: 483, width: 24, height: 24))
        containerView.addSubview(minusButton2)
        
        let minusButton3 = createMinusButton (imageName: "MinusButton", frame: CGRect(x: 267, y: 625, width: 24, height: 24))
        containerView.addSubview(minusButton3)
        
        
        
        let addButton1 = createAddButton(imageName: "AddButton", frame: CGRect(x: 323, y: 293, width: 24, height: 24))
        containerView.addSubview(addButton1)
        
        let addButton2 = createAddButton(imageName: "AddButton", frame: CGRect(x: 322, y: 483, width: 24, height: 24))
        containerView.addSubview(addButton2)
        
        let addButton3 = createAddButton(imageName: "AddButton", frame: CGRect(x: 320, y: 625, width: 24, height: 24))
        containerView.addSubview(addButton3)
        
        
        
        
        
        let numberLabel1 = createNumberLabel(number: 0, frame: CGRect(x: 304, y: 287, width: 8, height: 36))
        containerView.addSubview(numberLabel1)
        
        let numberLabel2 = createNumberLabel(number: 0, frame: CGRect(x: 302, y: 487, width: 11, height: 14))
        containerView.addSubview(numberLabel2)
        
        let numberLabel3 = createNumberLabel(number: 0, frame: CGRect(x: 300, y: 629, width: 11, height: 14))
        containerView.addSubview(numberLabel3)
        
        
        
        
        
        let tableView1 = createTableView(frame: CGRect(x: 11, y: 184, width: 343, height: 139))
        containerView.addSubview(tableView1)
        
        let tableView2 = createTableView(frame: CGRect(x: 11, y: 379, width: 343, height: 139))
        containerView.addSubview(tableView2)
        
        let tableView3 = createTableView(frame: CGRect(x: 11, y: 528, width: 343, height: 139))
        containerView.addSubview(tableView3)
        
        
        
        
        
        let headerLabel1 = createLabel(text: "Smartphones", frame: CGRect(x: 14, y: 147, width: 83, height: 36))
        containerView.addSubview(headerLabel1)
        
        let headerLabel2 = createLabel(text: "Laptops", frame: CGRect(x: 15, y: 336, width: 48, height: 36))
        containerView.addSubview(headerLabel2)
        
        
        
        
        
        let samsungImageView = createImageView(imageName: "Samsung", frame: CGRect(x: 24, y: 196, width: 116, height: 115))
        containerView.addSubview(samsungImageView)
        
        let microsoftSurfaceImageView = createImageView(imageName: "MicrosoftSurface", frame: CGRect(x: 26, y: 391, width: 116, height: 115))
        containerView.addSubview(microsoftSurfaceImageView)
        
        let hpPavilionImageView = createImageView(imageName: "HPPavilion", frame: CGRect(x: 26, y: 540, width: 116, height: 115))
        containerView.addSubview(hpPavilionImageView)
        
        
        
        
        
        let labelSamsung = createLabel(text: "Samsung", frame: CGRect(x: 149, y: 195, width: 56, height: 36))
        containerView.addSubview(labelSamsung)
        
        let labelMicrosoftSurface = createLabel(text: "Microsoft Surface", frame: CGRect(x: 151, y: 388, width: 105, height: 36))
        containerView.addSubview(labelMicrosoftSurface)
        
        let labelHP = createLabel(text: "HP Pavilion", frame: CGRect(x: 150, y: 529, width: 66, height: 36))
        containerView.addSubview(labelHP)
        
        
        
        
        let stockLabel1 = createStockLabel(stockNumber: 36, frame: CGRect(x: 149, y: 231, width: 100, height: 36))
        containerView.addSubview(stockLabel1)
        
        let stockLabel2 = createStockLabel(stockNumber: 68, frame: CGRect(x: 152, y: 415, width: 100, height: 36))
        containerView.addSubview(stockLabel2)
        
        let stockLabel3 = createStockLabel(stockNumber: 89, frame: CGRect(x: 151, y: 565, width: 100, height: 36))
        containerView.addSubview(stockLabel3)
        
        
        
        
        let priceLabel1 = createPriceLabel(price: 1249, frame: CGRect(x: 149, y: 261, width: 66, height: 36))
        containerView.addSubview(priceLabel1)
        
        let priceLabel2 = createPriceLabel(price: 1499, frame: CGRect(x: 151, y: 451, width: 67, height: 36))
        containerView.addSubview(priceLabel2)
        
        let priceLabel3 = createPriceLabel(price: 1099, frame: CGRect(x: 150, y: 595, width: 67, height: 36))
        containerView.addSubview(priceLabel3)
        
        //For Product Basket
        
        let coloredView = UIView(frame: CGRect(x: 0, y: 723, width: 375, height: 89))
        coloredView.backgroundColor = UIColor(red: 68/255, green: 165/255, blue: 255/255, alpha: 1.0) // #44A5FF
        view.addSubview(coloredView)
        
        view.addSubview(containerView)
        
        
    }
    func createMinusButton(imageName: String, frame: CGRect) -> UIButton {
        let button = UIButton(frame: frame)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(minusButtonTapped(_:)), for: .touchUpInside)
        return button
    }
    
    @objc func minusButtonTapped(_ sender: UIButton) {
        
    }
    func createAddButton(imageName: String, frame: CGRect) -> UIButton {
        let button = UIButton(frame: frame)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(addButtonTapped(_:)), for: .touchUpInside)
        return button
    }
    
    @objc func addButtonTapped(_ sender: UIButton) {
        
    }
    
    
    func createLabel(text: String, frame: CGRect) -> UILabel {
        let label = UILabel(frame: frame)
        label.text = text
        label.font = UIFont(name: "Inter", size: 12)
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }
    
    func createTableView(frame: CGRect) -> UITableView {
        let tableView = UITableView(frame: frame)
        tableView.backgroundColor = UIColor.clear
        tableView.layer.cornerRadius = 16
        tableView.layer.masksToBounds = true
        tableView.layer.borderWidth = 1.5
        tableView.layer.borderColor = UIColor(red: 217/255, green: 219/255, blue: 233/255, alpha: 1.0).cgColor // #D9DBE9
        return tableView
    }
    
    func createStockLabel(stockNumber: Int, frame: CGRect) -> UILabel {
        let label = UILabel(frame: frame)
        label.text = "Stock: \(stockNumber)"
        label.font = UIFont(name: "Inter", size: 12)
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }
    
    func createPriceLabel(price: Int, frame: CGRect) -> UILabel {
        let label = UILabel(frame: frame)
        label.text = "Price: \(price)"
        label.font = UIFont(name: "Inter", size: 12)
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }
    
    func createImageView(imageName: String, frame: CGRect) -> UIImageView {
        let imageView = UIImageView(frame: frame)
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        return imageView
    }
    func createNumberLabel(number: Int, frame: CGRect) -> UILabel {
        let label = UILabel(frame: frame)
        label.text = "\(number)"
        label.font = UIFont(name: "Inter", size: 12)
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }
}

