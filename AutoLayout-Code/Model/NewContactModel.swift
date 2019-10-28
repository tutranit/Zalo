//
//  ContactModel.swift
//  AutoLayout-Code
//
//  Created by ManTran on 10/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

struct NewContactModel {
    var id: String!
    var firstName: String?
    var lastName: String?
    var phoneNumber: String?
    
    var fullName: String {
        return NewContactModel.getFullName(contact: self)
    }
    
    static func getFullName(contact: NewContactModel) -> String {
        return "Example";
    }
}
