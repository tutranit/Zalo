//
//  ContactDataSource.swift
//  AutoLayout-Code
//
//  Created by ManTran on 10/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import ContactsUI
import AddressBook
class ContactDataSource{
    let userDefault = UserDefaults.standard
    func fetchContactLocal(){
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
                            var contacts = [CNContact]()
                            contacts.append(contact)
                                for phoneNumber in contact.phoneNumbers {
                                   if let number = phoneNumber.value as? CNPhoneNumber {
                                    contactDevice.append(ContactModel(id: "", firstName: contact.familyName, lastName: contact.givenName, phoneNumber: number.stringValue))
                                    
                                    }
                                    
                            }
                            complete(contactDevice,error)
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
}
