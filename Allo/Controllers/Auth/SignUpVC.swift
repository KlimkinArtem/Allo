//
//  SignUpVC.swift
//  Allo
//
//  Created by Артем Климкин on 10/02/2020.
//  Copyright © 2020 Artem Klimkin. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    let signUpButton = Button(backgroundColor: .systemBlue, title: "Зарегистрироваться")
    let image = Image(frame: .zero)
    let firstNameTF = TextField(frame: .zero)
    let lastNameTF = TextField(frame: .zero)
    let usernameTF = TextField(frame: .zero)
    let passwordTF = TextField(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureImage()
        configureFitstNameTF()
        configureLastNameTF()
        configureUsernameTF()
        configurePasswordTF()
        configureSignUpButton()
        
        firstNameTF.delegate = self
        lastNameTF.delegate = self
        usernameTF.delegate = self
        passwordTF.delegate = self
    }
    
    
    @objc func signUpTapped(){
        print(#function)
    }
}

//MARK: configureUI

extension SignUpVC{
    func configureImage(){
        view.addSubview(image)
        
        image.image = UIImage(named: "icon")
        
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            image.heightAnchor.constraint(equalToConstant: 150),
            image.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func configureFitstNameTF(){
        view.addSubview(firstNameTF)
        
        firstNameTF.placeholder = "Введите имя"
        
        NSLayoutConstraint.activate([
            firstNameTF.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            firstNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            firstNameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            firstNameTF.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureLastNameTF(){
        view.addSubview(lastNameTF)
        
        lastNameTF.placeholder = "Введите фамилию"
        
        NSLayoutConstraint.activate([
            lastNameTF.topAnchor.constraint(equalTo: firstNameTF.bottomAnchor, constant: 10),
            lastNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            lastNameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            lastNameTF.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureUsernameTF(){
        view.addSubview(usernameTF)
        
        usernameTF.placeholder = "Введите логин"
        
        NSLayoutConstraint.activate([
            usernameTF.topAnchor.constraint(equalTo: lastNameTF.bottomAnchor, constant: 10),
            usernameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            usernameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            usernameTF.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configurePasswordTF(){
        view.addSubview(passwordTF)
        
        passwordTF.placeholder = "Введите пароль"
        
        NSLayoutConstraint.activate([
            passwordTF.topAnchor.constraint(equalTo: usernameTF.bottomAnchor, constant: 10),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            passwordTF.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureSignUpButton(){
        view.addSubview(signUpButton)
        
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 10),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            signUpButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}



extension SignUpVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
