//
//  AuthErrorAlertVC.swift
//  Allo
//
//  Created by Артем Климкин on 10/02/2020.
//  Copyright © 2020 Artem Klimkin. All rights reserved.
//

import UIKit

class AuthErrorAlertVC: UIViewController {
    let containerView = UIView()
    let titleLabel = Label(textAligment: .center)
    let messageLabel = Label(textAligment: .center)
    let actionButton = Button(backgroundColor: .systemRed, title: "Ок")
    
    var alertTitle: String?
    var message: String?
    
    let padding: CGFloat = 20
    
    init(title: String, message: String){
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    
    func configureContainerView(){
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func configureTitleLabel(){
        containerView.addSubview(titleLabel)
        
        titleLabel.text = title ?? "Что-то пошло не так 😢"
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
            titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    func configureActionButton(){
        containerView.addSubview(actionButton)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    
    func configureMessageLabel(){
        containerView.addSubview(messageLabel)
        messageLabel.numberOfLines = 4
        messageLabel.text = message
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            messageLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    @objc func dismissVC(){
        dismiss(animated: true)
    }
    
}




