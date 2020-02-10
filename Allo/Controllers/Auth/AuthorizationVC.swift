//
//  AuthorizationVC.swift
//  Allo
//
//  Created by Артем Климкин on 07/02/2020.
//  Copyright © 2020 Artem Klimkin. All rights reserved.
//

import UIKit

class AuthorizationVC: UIViewController {

    let signInButton = Button(backgroundColor: .systemBlue, title: "Войти")
    let signUpButton = Button(backgroundColor: .systemBlue, title: "Регистрация")
    let image = Image(frame: .zero)
    let usernameTF = TextField(frame: .zero)
    let passwordTF = TextField(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureImage()
        configureUsernameTF()
        configurePasswordTF()
        configureSignInButton()
        configureSignUpButton()
        
        usernameTF.delegate = self
        passwordTF.delegate = self
    }
    
    @objc func signInTapped(){
        if usernameTF.text!.isEmpty || passwordTF.text!.isEmpty{
            let alert = AuthErrorAlertVC(title: "Что-то пошло не так 😢", message: "Заполните все необходиме поля")
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            self.present(alert, animated: true)
            return
        }
        signIn(username: usernameTF.text!, password: passwordTF.text!)
    }
    
    func signIn(username: String, password: String){
        NetworkManager.shared.signIn(username: username, password: password) { (data, err) in
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
            
            if data!._id != "null"{

                DispatchQueue.main.async {
                    let homeVC = HomeVC(id: data!._id,
                                        firstName: data!.firstnamedb,
                                        lastName: data!.lastnamedb,
                                        username: data!.usenamedb,
                                        password: data!.passworddb)
                    
                    homeVC.modalPresentationStyle = .overFullScreen
                    homeVC.modalTransitionStyle = .crossDissolve
                    self.present(homeVC, animated: true)
                }
            }else{
                DispatchQueue.main.async {
                    let alert = AuthErrorAlertVC(title: "Что-то пошло не так 😢", message: "Введите корректный логин или пароль")
                    alert.modalPresentationStyle = .overFullScreen
                    alert.modalTransitionStyle = .crossDissolve
                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    @objc func signUpTapped(){
        present(SignUpVC(), animated: true)
    }
}




//MARK: configure UI

extension AuthorizationVC{
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
    
    func configureUsernameTF(){
        view.addSubview(usernameTF)
        
        usernameTF.placeholder = "Введите логин"
        
        NSLayoutConstraint.activate([
            usernameTF.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
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
    
    func configureSignInButton(){
        view.addSubview(signInButton)
        
        signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 10),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            signInButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureSignUpButton(){
        view.addSubview(signUpButton)
        
        signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 10),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            signUpButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}


extension AuthorizationVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
