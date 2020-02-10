//
//  HomeVC.swift
//  Allo
//
//  Created by Артем Климкин on 10/02/2020.
//  Copyright © 2020 Artem Klimkin. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    var id: String!
    var firstName: String!
    var lastName: String!
    var username: String!
    var password: String!
    
    init(id: String, firstName: String, lastName: String, username: String, password: String){
        super.init(nibName: nil, bundle: nil)
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.password = password
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemRed
        
        
    }
    
    

}
