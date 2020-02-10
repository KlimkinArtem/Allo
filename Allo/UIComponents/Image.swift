//
//  Image.swift
//  Allo
//
//  Created by Артем Климкин on 07/02/2020.
//  Copyright © 2020 Artem Klimkin. All rights reserved.
//

import UIKit

class Image: UIImageView {


    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
//        layer.cornerRadius = 10
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }

}
