//
//  ProfileHeaderView.swift
//  UIView_CALayer_UIWindow_Lysenskaia
//
//  Created by ElenaL on 05.10.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    var statusText: String? = nil
    
    private lazy var avatar: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "2-1.jpeg"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 70.0
        imageView.clipsToBounds = true
            
        return imageView
        }()
       
        private lazy var stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = NSLayoutConstraint.Axis.vertical
            stackView.distribution = UIStackView.Distribution.equalSpacing
            
            return stackView
        }()
        
        private lazy var nameLabel: UILabel = {
            let nameLabel = UILabel()
            nameLabel.text = "Cute Cat"
            nameLabel.textColor = .black
            nameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
            
            return nameLabel
        }()
        
        private lazy var statusLabel: UILabel = {
            let statusLabel = UILabel()
            statusLabel.text = "Waiting for something..."
            statusLabel.textColor = .gray
            statusLabel.font = UIFont.systemFont(ofSize: 14.0)

            return statusLabel
        }()
        
        private lazy var inputText: UITextField = {
            let textField = UITextField()
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.textColor = .black
            textField.backgroundColor = .white
            textField.font = UIFont.systemFont(ofSize: 15.0)
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = UIColor.black.cgColor
            textField.layer.cornerRadius = 12.0
            let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 2.0))
            textField.leftView = leftView
            textField.leftViewMode = .always
            textField.clipsToBounds = true
            textField.placeholder = "Waiting for something..."
            textField.addTarget(self, action: #selector(ProfileHeaderView.statusTextChanged(_:)), for: .editingChanged)

            return textField
        }()
        
        private lazy var statusButton: UIButton = {
            let statusButton = UIButton()
            statusButton.setTitle("Set status", for: .normal)
            statusButton.setTitleColor(.white, for: .normal)
            statusButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            statusButton.translatesAutoresizingMaskIntoConstraints = false
            statusButton.backgroundColor = .blue
            statusButton.layer.cornerRadius = 4
            statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            
            statusButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
            statusButton.layer.shadowRadius = 4.0
            statusButton.layer.shadowColor = UIColor.black.cgColor
            statusButton.layer.shadowOpacity = 0.7
            statusButton.layer.shouldRasterize = true

            return statusButton
        }()

        override init(frame: CGRect) {
            super.init(frame: frame)
            createSubviews()
            setupConstraints()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            createSubviews()
            setupConstraints()
        }
        
        func createSubviews() {
            addSubview(avatar)
            addSubview(inputText)
            addSubview(statusButton)
            addSubview(stackView)
            stackView.addArrangedSubview(nameLabel)
            stackView.addArrangedSubview(statusLabel)
        }
        
        func setupConstraints() {
            self.avatar.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 16).isActive = true
            self.avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
            self.avatar.heightAnchor.constraint(equalToConstant: 140).isActive = true
            self.avatar.widthAnchor.constraint(equalToConstant: 140).isActive = true
            
            self.stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 27).isActive = true
            self.stackView.leadingAnchor.constraint(equalTo: self.avatar.trailingAnchor, constant: 16).isActive = true
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
            self.stackView.heightAnchor.constraint(equalToConstant: 80).isActive = true
            
            self.inputText.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 8).isActive = true
            self.inputText.leadingAnchor.constraint(equalTo: self.avatar.trailingAnchor, constant: 0).isActive = true
            self.inputText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
            self.inputText.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            self.statusButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 68).isActive = true
            self.statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
            self.statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
            self.statusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }

        @objc private func buttonPressed() {
            statusText = inputText.text!
            statusLabel.text = "\(statusText ?? "")"
        }
        
        @objc func statusTextChanged(_ textField: UITextField) {
            let status: String = textField.text ?? ""
            print("Новый статус = \(status)")
        }

}
