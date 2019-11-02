//
//  ContactModel.swift
//  AutoLayout-Code
//
//  Created by ManTran on 10/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

struct ContactModel {
    var id: String!
    var firstName: String?
    var lastName: String?
    var phoneNumber: String?
    
    var fullName: String {
        return ContactModel.getFullName(contact: self)
    }
    
    static func getFullName(contact: ContactModel) -> String {
        return "Example";
    }
    
    
}
