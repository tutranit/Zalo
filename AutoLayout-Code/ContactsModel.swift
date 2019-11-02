//
//  ContactsModel.swift
//  AutoLayout-Code
//
//  Created by Apple on 10/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
//import AddressBook
//class ContactModel{
//    var image : Data! = nil
//    var name : String! = nil
//    var phoneNumber : String! = nil
//    var phoneNumbers: [String]!
//    init(image : Data,name : String,phoneNumber : String){
//        self.image = image
//        self.name = name
//        self.phoneNumber = phoneNumber
//    }
////    convenience init(record: ABRecord) {
////           self.init()
////           //self.identifier = String(ABRecordGetRecordID(record))
////           if let nameRef = ABRecordCopyCompositeName(record)?.takeRetainedValue() {
////               self.name = nameRef as String
////           }
////        self.phoneNumbers = [String]()
////           if let phonesMultivalueRef = ABRecordCopyValue(record, kABPersonPhoneProperty)?.takeRetainedValue() {
////               let phonesRef = ABMultiValueCopyArrayOfAllValues(phonesMultivalueRef)?.takeRetainedValue()
////               self.phoneNumbers = phonesRef as! [String]
////           }
////           self.phoneNumber = phoneNumberString(phoneNumbers: self.phoneNumbers)
////           if ABPersonHasImageData(record) {
////               let imageData = ABPersonCopyImageData(record).takeRetainedValue() as Data
////               //self.avatar = UIImage(data: imageData)
////           }
////       }
////
////       private func phoneNumberString(phoneNumbers: [String]) -> String {
////           if phoneNumbers.count > 0 {
////               var suffixPhoneNumberString = ""
////               if phoneNumbers.count > 1 {
////                   suffixPhoneNumberString = " and \(phoneNumbers.count - 1) more"
////               }
////               let firstNumberString = phoneNumbers[0]
////               return firstNumberString + suffixPhoneNumberString
////           }
////           return ""
////       }
//}
