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
        
        char.frame.origin = CGPoint(x: 10, y:  10)
        char.font.withSize(self.frame.height / 2)
        char.textColor = .black
        char.sizeToFit()
        self.addSubview(char)
//        self.bringSubviewToFront(char)
//        self.backgroundC  = .blue
        return char
    }()
    // ------------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
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
