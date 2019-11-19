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
class ViewController_AddFriend: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    var mflag : Bool = false
    var contactsDevice: [ContactModel] = []
    @IBOutlet weak var tableViewContacts: UITableView!
    var contactList = ["A":[],"B":[],"C":[],"D":[],"E":[],"F":[],"G":[],"H":[],"I":[],"J":[],"K":[],"L":[],"M":[],"N":[],"O":[],"P":[],"Q":[],"R":[],"S":[],"T":[],"U":[],"V":[],"W":[],"X":[],"Y":[],"Z":[],"#":[]] as [String : [String]]
    var alphabetHeaderTitle = [String]()
    var indexRowSelected : [Int] = []
    var indexSectionSelected : [Int] = []
    let searchContact = UISearchBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getContacts()
        navigationController?.title = "Chọn bạn"
        tableViewContacts.delegate = self
        tableViewContacts.dataSource = self
        searchContact.delegate = self
        setConstraint()
    }
   
    func getContacts(){
        ContactDataSource.fetchContactDevice { (data,error) in
            self.contactsDevice = data
        }
        getalphabet()
    }
   
    func getalphabet(){
        alphabetHeaderTitle = Array(contactList.keys)
        alphabetHeaderTitle = alphabetHeaderTitle.sorted(by: {$0 < $1})
        for key in alphabetHeaderTitle{
            
            for name in contactsDevice{
                
                if key == String((name.firstName?.prefix(1))!){
                    var list = contactList[key] ?? []
                    list.append(name.firstName!)
                    contactList[key] = list
                }
                else if !alphabetHeaderTitle.contains(String((name.firstName?.prefix(1))!)){
                    var list = contactList[key] ?? []
                    list.append(name.firstName!)
                    contactList["#"] = list
                }
            }
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return alphabetHeaderTitle
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            
        }
    }
    
    func setConstraint(){
        
        view.addSubview(searchContact)
        searchContact.translatesAutoresizingMaskIntoConstraints = false
        searchContact.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        searchContact.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchContact.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchContact.frame.size.height = 20
        searchContact.frame.size.width = view.frame.size.width
        searchContact.backgroundColor = .blue
        
        
        //tableViewContacts.translatesAutoresizingMaskIntoConstraints = false
        tableViewContacts.topAnchor.constraint(equalTo: searchContact.bottomAnchor).isActive = true
        tableViewContacts.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableViewContacts.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableViewContacts.frame.size.width = view.frame.size.width
        tableViewContacts.frame.size.height = view.frame.size.height - (self.tabBarController?.tabBar.frame.size.height)!
            //- searchContact.frame.size.height//(view.frame.size.height / 8)
    }
    
    @objc func returnMainView(){
        tabBarController?.tabBar.isHidden = false
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = alphabetHeaderTitle[section]
        var count : Int = 0
        if let items = contactList[key]{
            count = items.count
        }

        return count
       }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellContacts", for: indexPath) as! ContactTableViewCell
        let key = alphabetHeaderTitle[indexPath.section]
        if let items = contactList[key]{
            cell.nameLabel.text = items[indexPath.row]
            cell.avatarView.character.text = String(items[indexPath.row].prefix(2))
        }
        
        if indexRowSelected.contains(indexPath.row) && indexSectionSelected.contains(indexPath.section){
            cell.checkboxButton.setImage(UIImage(named: "Correct"), for: .normal)
        }else{
            cell.checkboxButton.setImage(UIImage(named: "circle"), for: .normal)
        }
        return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellContacts", for: indexPath) as! ContactTableViewCell        
        if indexRowSelected.contains(indexPath.row) && indexSectionSelected.contains(indexPath.section){
            if let indexElement = indexRowSelected.firstIndex(of: indexPath.row){
                cell.checkboxButton.setImage(UIImage(named: "circle"), for: .normal)
                indexRowSelected.remove(at: indexElement)
                indexSectionSelected.remove(at: indexSectionSelected.firstIndex(of: indexPath.section)!)
            }
        }
        else{
            cell.checkboxButton.setImage(UIImage(named: "Correct"), for: .normal)
            indexRowSelected.append(indexPath.row)
            indexSectionSelected.append(indexPath.section)
        }
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
//        var count : Int = 0
//        for i in 0...contactList.count{
//            let key = alphabetHeaderTitle[i]
//
//            if let items = contactList[key]{
//                if items.count > 0{
//                    count += 1
//                }
//            }
//        }
//
//        return count
        return alphabetHeaderTitle.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return alphabetHeaderTitle[section]
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let viewFooter = UIView()
        viewFooter.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return viewFooter
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }

}
