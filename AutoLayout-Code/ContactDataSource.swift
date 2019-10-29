//
//  ContactDataSource.swift
//  AutoLayout-Code
//
//  Created by Apple on 10/24/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import ContactsUI
import AddressBook
class ContactDataSource{
    var imageContact : Data!
    var nameContact : String!
    var numberContact : String!
    let userDefault = UserDefaults.standard
    func fetchContactLocal(){
//        var image = userDefault.object(forKey: "imageContacts")
//        var name = userDefault.object(forKey: "nameContacts")
//        var phoneNumber = userDefault.object(forKey: "phoneNumberContacts")
    }
    static func fetchContactDevice(complete:@escaping ([ContactModel],Error) ->()){
        if #available(IOS 8.0, *){
            let contactStore = CNContactStore()
                    var contactDevice : [ContactModel] = []
                    let error = NSError(domain: "Error", code: 1, userInfo: nil)
                    let keys = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                            CNContactPhoneNumbersKey,
                            CNContactEmailAddressesKey,
                            CNContactImageDataKey
                    ] as [Any]
                    let request = CNContactFetchRequest(keysToFetch: keys as! [CNKeyDescriptor])
                    do {
                        
                        try contactStore.enumerateContacts(with: request){
                                (contact, stop) in
                            // Array containing all unified contacts from everywhere
                            var contacts = [CNContact]()
                            contacts.append(contact)
                            //if (contacts.count > 1){
                                for phoneNumber in contact.phoneNumbers {
                                                               if let number = phoneNumber.value as? CNPhoneNumber {
                                                                   contactDevice.append(ContactModel(image: contact.imageData!, name: contact.familyName, phoneNumber: number.stringValue))
                                           //                        self.userDefault.set(contact.imageData, forKey: "imageContacts")
                                           //                        self.userDefault.set(contact.familyName, forKey: "nameContacts")
                                           //                        self.userDefault.set(number.stringValue, forKey: "phoneNumberContacts")
                                                               }
                                                           }
                                                           complete(contactDevice,error)
                            //}
                           
                        }
                    
                    } catch {
                        print("unable to fetch contacts")
                    }

        }
        else{
            //            let error = NSError(domain: "Error", code: 1, userInfo: nil)
            //            let abPeople = ABAddressBookCopyArrayOfAllPeople(self.Contacts.self as ABAddressBook).takeRetainedValue() as Array
            //            var contactList = [ContactModel]()
            //            for abPerson in abPeople {
            //                let contactObject = ContactModel(record: abPerson)
            //                contactList.append(contactObject)
            //            }
            //            complete(contactList, error)
        }
        

    }
    struct Contacts {
        let image : Data!
        let name : String!
        let phoneNumber : String!
    }
}
