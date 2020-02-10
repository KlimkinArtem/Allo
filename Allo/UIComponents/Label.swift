//
//  Label.swift
//  Allo
//
//  Created by Артем Климкин on 07/02/2020.
//  Copyright © 2020 Artem Klimkin. All rights reserved.
//

import UIKit

class Label: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAligment: NSTextAlignment){
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configure()
    }
    
    private func configure(){
        textColor = .label
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }

    
}
