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
    
    // ------------------
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureWithContactViewModel(_ contact: NewContactViewModel) {
        // TO DO: -
    }
}
