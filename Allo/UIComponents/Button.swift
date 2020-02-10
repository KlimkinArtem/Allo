//
//  Button.swift
//  Allo
//
//  Created by Артем Климкин on 07/02/2020.
//  Copyright © 2020 Artem Klimkin. All rights reserved.
//

import UIKit

class Button: UIButton {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String){
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure(){
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemBackground.cgColor
    }
    

}
