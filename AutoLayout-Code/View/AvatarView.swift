//
//  AvatarView.swift
//  AutoLayout-Code
//
//  Created by ManTran on 10/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AvatarView: UIView {
    // TO DO: - Implement avatarView
    // AvatarView bao gồm
    // 1. Label
    // 2. Background color view (dùng CAGradient) + conerRadius
    lazy var character : UILabel = {
        let char = UILabel()
        self.addSubview(char)
        char.translatesAutoresizingMaskIntoConstraints = false
        char.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        char.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        char.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 5).isActive = true
        //char.font.withSize(self.frame.height / 2)
        char.textColor = .black
        char.sizeToFit()
        
//        self.bringSubviewToFront(char)
//        self.backgroundC  = .blue
        return char
    }()
    // ------------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        layer.cornerRadius = self.frame.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureWithContactViewModel(_ contact: NewContactViewModel) {
        // TO DO: -
        backgroundColor = .blue
//        let gradient = CAGradientLayer(layer: self.layer)
//        gradient.colors = [UIColor.yellow.cgColor,UIColor.blue.cgColor]
//        gradient.startPoint = CGPoint(x: 0, y: 0)
//        gradient.endPoint = CGPoint(x: 0, y: 1)
//        gradient.frame = self.bounds
//
//        let character = UILabel()
//        character.sizeToFit()
//        character.centerXAnchor.constraint(equalToSystemSpacingAfter: self.centerXAnchor, multiplier: 1/2).isActive = true
//        character.centerYAnchor.constraint(equalToSystemSpacingBelow: self.centerYAnchor, multiplier: 1/2).isActive = true
//        self.layer.cornerRadius = self.frame.height / 2
//        self.layer.insertSublayer(gradient, at: 0)
//        self.addSubview(character)
//        self.bringSubviewToFront(character)
    }
}
