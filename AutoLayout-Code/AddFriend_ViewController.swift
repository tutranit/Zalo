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
    var mflag : Bool = false
    var contactsDevice: [ContactModel] = []
    var removeList : [String] = []
    @IBOutlet weak var tableViewContacts: UITableView!
    let userDefault = UserDefaults.standard
    var alphabetHeader1 = ["A":[],"B":[],"C":[],"D":[],"E":[],"F":[],"G":[],"H":[],"I":[],"J":[],"K":[],"L":[],"M":[],"N":[],"O":[],"P":[],"Q":[],"R":[],"S":[],"T":[],"U":[],"V":[],"W":[],"X":[],"Y":[],"Z":[],"#":[]] as [String : [String]]
    var alphabetHeaderTitle = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getContacts()
                
        tableViewContacts.delegate = self
        tableViewContacts.dataSource = self
        setConstraint()
    }
   
    func getContacts(){
        ContactDataSource.fetchContactDevice { (data,error) in
            self.contactsDevice = data
        }
        getalphabet()
    }
   
    func getalphabet(){
        alphabetHeaderTitle = Array(alphabetHeader1.keys)
        alphabetHeaderTitle = alphabetHeaderTitle.sorted(by: {$0 < $1})
        for key in alphabetHeaderTitle{
            
            for name in contactsDevice{
                
                if key == String((name.firstName?.prefix(1))!){
                    var list = alphabetHeader1[key] ?? []
                    list.append(name.firstName!)
                    alphabetHeader1[key] = list
                }
            }
            if alphabetHeader1[key]?.count == 0{
                removeList.append(key)
            }
        }

        
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return alphabetHeaderTitle
    }
    
    func setConstraint(){
        tableViewContacts.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableViewContacts.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableViewContacts.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableViewContacts.frame.size.height = view.frame.size.height//(view.frame.size.height / 8)
    }
    
    @objc func returnMainView(){
        tabBarController?.tabBar.isHidden = false
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = alphabetHeaderTitle[section]
        let count : Int
        if let items = alphabetHeader1[key]{
            count = items.count
        }
        else{
            count = 0
        }
        return count
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellContacts", for: indexPath) as! ContactTableViewCell
        print(indexPath.section)
        let key = alphabetHeaderTitle[indexPath.section]
        if let items = alphabetHeader1[key]{
            cell.nameLabel.text = items[indexPath.row]
        }
        return cell
       }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return alphabetHeaderTitle.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return alphabetHeaderTitle[section]
    }

}
