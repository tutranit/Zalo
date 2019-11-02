//
//  ColorsStore.swift
//  AutoLayout-Code
//
//  Created by ManTran on 10/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

struct ColorsStore {
    
    static let sharedIntance = ColorsStore()
    
    private init() {
        
    }
    
    private func hashToGetColorFromContact(_ contact: ContactModel) -> String {
        // TO DO: - Think to a simple hash contact this
        return ""
    }
    
    private let colors: [Int: UIColor] = [
        // FIX ME: - 2 line below is example, it need to remove when pick all color of telegram
        1: UIColor.red,
        2: UIColor.black,
        // TO DO: - Use tool pick all color of telegram to this, it so beautiful
    ]
    
    // TO DO: - Beautiful color from telegram
    private let gradientColors: [Int: [UIColor]] = [:]
    
    func colorByContact(_ contact: ContactModel) -> UIColor {
        // TO DO: - Implement this
        return colors[1] ?? UIColor.black
    }
    
    func gradientColorsByContact(_ contact: ContactModel) -> [UIColor] {
        // TO DO: - Implement this
        return gradientColors[1] ?? [UIColor.black, UIColor.blue]
    }
}
