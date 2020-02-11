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
        
        
        
        if firstNameTF.text!.isEmpty || lastNameTF.text!.isEmpty || usernameTF.text!.isEmpty || passwordTF.text!.isEmpty{
            let alert = AuthErrorAlertVC(title: "Что-то пошло не так 😢", message: "Заполните все необходиме поля")
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            self.present(alert, animated: true)
            return
        }
        let result = firstNameTF.text! + lastNameTF.text! + usernameTF.text! + passwordTF.text!
        if result.contains(".") {
            let alert = AuthErrorAlertVC(title: "Что-то пошло не так 😢", message: "Поля не должны содержать точек")
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            self.present(alert, animated: true)
            return
        }
        
        signUp(firstName: firstNameTF.text!, lastName: lastNameTF.text!, username: usernameTF.text!, password: passwordTF.text!)
    }
    
    
    func signUp(firstName: String, lastName: String, username: String, password: String){
        NetworkManager.shared.signUp(firstName: firstName, lastName: lastName, username: username, password: password) { (user, err) in
            if let _ = err{
                print(err!)
                DispatchQueue.main.async {
                    let alert = AuthErrorAlertVC(title: "Что-то пошло не так 😢", message: err!)
                    alert.modalPresentationStyle = .overFullScreen
                    alert.modalTransitionStyle = .crossDissolve
                    self.present(alert, animated: true)
                }
                return
            }
            
            if user!._id != "null"{
                ID = user?._id
                FIRSTNAME = user?.firstnamedb
                LASTNAME = user?.lastnamedb
                USERNAME = user?.usenamedb
                PASSWORD = user?.passworddb
                
                DispatchQueue.main.async {
                    let tb = TabBarController()
                    
                    tb.modalPresentationStyle = .overFullScreen
                    tb.modalTransitionStyle = .crossDissolve
                    self.present(tb, animated: true)
                }
            }else{
                DispatchQueue.main.async {
                    let alert = AuthErrorAlertVC(title: "Что-то пошло не так 😢", message: "Пользователь с таким логином уже существует. Попробуйте ввести другой логин")
                    alert.modalPresentationStyle = .overFullScreen
                    alert.modalTransitionStyle = .crossDissolve
                    self.present(alert, animated: true)
                }
            }
        }
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
