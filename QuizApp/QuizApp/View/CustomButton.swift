//
//  CustomButton.swift
//  QuizApp
//
//  Created by Nguyen Tien on 24/06/2021.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5.0
        self.layer.backgroundColor = UIColor.systemTeal.cgColor
//        self.widthAnchor.constraint(equalToConstant: 88).isActive = true
    }
    
    

}
