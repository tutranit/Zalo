//
//  ContactViewModel.swift
//  AutoLayout-Code
//
//  Created by ManTran on 10/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

struct NewContactViewModel {
    var aphabetCharacter: String!
    var name: String!
    var phoneNumber: String?
    var displayName: String!
    
    static func newContactViewModel(contact: ContactModel) -> NewContactViewModel {
        // TODO: - parse viewmodel from model
        // 1. get AlphabetChar
        let alphabetCharacter = NewContactViewModel.alphabetCharacter(name: contact.fullName)
        
        // 2. Validate phone number
        let validPhoneNumber = NewContactViewModel.validatePhoneNumber(phoneNumber: contact.phoneNumber);
        let phoneNumber = validPhoneNumber ? contact.phoneNumber : ""
        
        // 3. Display name
        let displayName = contact.fullName;
        
        return NewContactViewModel(aphabetCharacter: alphabetCharacter, name: "example", phoneNumber: phoneNumber, displayName: displayName);
    }
    
    static func alphabetCharacter(name: String) -> String {
        // TODO: - Write function get alphabet character
        
        return String(name.prefix(1))
    }
    
    static func validatePhoneNumber(phoneNumber: String?) -> Bool {
        // TODO: - Write function validate phone
        let PHONE_REGEX = "^[3(+84)]\\s\\d{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: phoneNumber)
        return result
    }
    
    static func displayName(contact: ContactModel) -> String {
        // TODO: - Write function get fullname
        contact.fullName
    }
}
