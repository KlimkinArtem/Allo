//
//  NetworkManager.swift
//  Allo
//
//  Created by Артем Климкин on 10/02/2020.
//  Copyright © 2020 Artem Klimkin. All rights reserved.
//3000, '127.0.0.1'

import Foundation


class NetworkManager{
    
    static let shared = NetworkManager()
    private let baseStringURL = "http://127.0.0.1:3000"
    
    func signIn(username: String, password: String, completed: @escaping(User?, String?) -> Void){
        let endpoint = baseStringURL + "/signin.\(username).\(password)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "Что-то не так с вашим интернет соединением")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let _ = err{
                completed(nil, "Что-то не так с сервером")
            }
            
            guard let res = res as? HTTPURLResponse, res.statusCode == 200 else{
                completed(nil, "Что-то пошло не так, сервер не смог принять запрос. Повторите попытку позже")
                return
            }
            
            guard let data = data else{
                completed(nil, "Что-так с данными получеными от сервера. Повторите попытку позже")
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let everythingIsCorrect = try decoder.decode(User.self, from: data)
                completed(everythingIsCorrect, nil)
            }catch(let error){
                completed(nil, "Что-то пошло не так! Ошибка: \(error)")
            }
            
            
        }.resume()
    }
    
    func signUp(firstName: String, lastName: String, username: String, password: String, completed: @escaping(User?, String?) -> Void){
        let endpoint = baseStringURL + "/signup.\(firstName).\(lastName).\(username).\(password)"
        
        guard let url = URL(string: endpoint) else {
            completed(nil, "Что-то не так с интернет соединением")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let _ = err{
                completed(nil, "Что-то не так с сервером")
            }
            
            guard let res = res as? HTTPURLResponse, res.statusCode == 200 else{
                completed(nil, "Что-то пошло не так, сервер не смог принять запрос. Повторите попытку позже")
                return
            }
            
            guard let data = data else{
                completed(nil, "Что-то не так с данными получеными от сервера. Повторите попытку позже")
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let everythingIsCorrect = try decoder.decode(User.self, from: data)
                completed(everythingIsCorrect, nil)
            }catch(let error){
                completed(nil, "Что-то пошло не так! Ошибка: \(error)")
            }
            
            
        }.resume()
    }
}
