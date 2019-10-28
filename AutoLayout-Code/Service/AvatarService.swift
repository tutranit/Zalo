//
//  AvatarService.swift
//  AutoLayout-Code
//
//  Created by ManTran on 10/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

class AvatarService {
    private let cache: NSCache<NSString, AnyObject>!
    private let avatarQueue: DispatchQueue
    
    static let sharedInstance = AvatarService()
    
    private init() {
        self.cache = NSCache()
        self.avatarQueue = DispatchQueue(label: "avatarQueue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    }
    
    private func hashFromContact(_ contact: NewContactModel) -> String {
        // TO DO: - need hash at here
        return ""
    }
    
    func flatColorAvatarByContact(_ contact: NewContactModel, flatColor:UIColor, size: CGSize) -> UIImage? {
        // TO DO: - Check nếu có trong cache thì lấy ra, không có thì đi tạo avatar -> gán vào cache -> lấy ra
        return nil
    }
    
    func gradientAvatarByContact(_ contact: NewContactModel, colors:[UIColor], size: CGSize) -> UIImage? {
        // TO DO: - Check nếu có trong cache thì lấy ra, không có thì đi tạo avatar -> gán vào cache -> lấy ra
        return nil
    }
    
    func roundedAvatarViewByContact(_ contact: NewContactModel, colors:[UIColor], size: CGSize) -> UIView! {
        // TO DO: - Implement this
        
        return UIView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    }
}
