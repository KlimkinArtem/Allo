//
//  TextField.swift
//  Allo
//
//  Created by Артем Климкин on 07/02/2020.
//  Copyright © 2020 Artem Klimkin. All rights reserved.
//

import UIKit

class TextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray6.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        returnKeyType = .continue
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
    }

}
