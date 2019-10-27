//
//  ViewController_AddFriend.swift
//  AutoLayout-Code
//
//  Created by Apple on 10/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Contacts
import ContactsUI
class ViewController_AddFriend: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var contactsDevice: [ContactModel] = []
    @IBOutlet weak var tableViewContacts: UITableView!
    let userDefault = UserDefaults.standard
    //var contactDataSource : ContactDataSource!
    override func viewDidLoad() {
        super.viewDidLoad()

        getContacts()
        tableViewContacts.delegate = self
        tableViewContacts.dataSource = self
        setConstraint()
    }
    
   
    
    func setConstraint(){
//        let searchContacts = UISearchBar()
//        searchContacts.placeholder = "Search for contacts"
//        searchContacts.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100)
//
//        view.addSubview(searchContacts)
        //tableViewContacts.translatesAutoresizingMaskIntoConstraints = false
        
        tableViewContacts.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableViewContacts.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableViewContacts.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableViewContacts.frame.size.height = view.frame.size.height//(view.frame.size.height / 8)
    }
    
    @objc func returnMainView(){
        tabBarController?.tabBar.isHidden = false
        self.dismiss(animated: true, completion: nil)
    }
    
    func getContacts(){
        ContactDataSource.fetchContactDevice { (data,error) in
            self.contactsDevice = data
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellContacts", for: indexPath)
        if contactsDevice.count > 0{
            let arrayContacts = contactsDevice[indexPath.row]
            if let imageContact = cell.imageView{
                imageContact.image = UIImage(data: arrayContacts.image)
                imageContact.frame.size = CGSize(width: 32, height: 32)
                imageContact.layer.cornerRadius = imageContact.frame.height / 2
                imageContact.clipsToBounds = true
            }
            cell.textLabel?.text = arrayContacts.name
            cell.detailTextLabel?.text = arrayContacts.phoneNumber
        }
        
        return cell
       }
    

    struct Contacts {
        let image : Data!
        let name : String!
        let phoneNumber : String!
    }

}
