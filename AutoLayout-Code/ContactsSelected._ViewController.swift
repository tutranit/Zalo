//
//  ViewController_ContactsSelected.swift
//  AutoLayout-Code
//
//  Created by Apple on 10/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController_ContactsSelected: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    let arrayName = [[" "],[" "],["1","2","3"],["1","2","3","4"]]
     let arrayImage = [ [" "],[" "],["AddIcon","messageAdd","AddIcon"],["AddIcon","messageAdd","AddIcon","messageAdd"]]
    let swichHide = UISwitch()
    @IBOutlet weak var tableView_Contacts: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        swichHide.isOn = true
        tableView_Contacts.delegate = self
        tableView_Contacts.dataSource = self
        navigationItem.title = "Edit your bio"
        // Do any additional setup after loading the view.
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return arrayName[section].count
        case 3:
            return arrayName[section].count
        default:
            return 1
        }
       }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch section {
        case 3:
            return 0
        case 4:
            return 0
        default:
            return 10
        }
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let viewFooter = UIView()
        viewFooter.backgroundColor = .gray
        return viewFooter
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 2:
            return 70
        case 0:
            return 0
        case 4:
            return 0
        default:
            return 30
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = UIView()
        let lblHeader = UILabel()
        switch section {
        case 1:
            lblHeader.text = "Close friends"
            lblHeader.sizeToFit()
            lblHeader.frame.origin = CGPoint(x: 0, y: 5)
            viewHeader.addSubview(lblHeader)
        case 2:
            lblHeader.text = "Recent updates"
            lblHeader.sizeToFit()
            lblHeader.frame.origin = CGPoint(x: 0, y: 5)
            viewHeader.addSubview(lblHeader)
            
            
            swichHide.frame.origin = CGPoint(x: view.frame.size.width - 55, y: 5)
            swichHide.addTarget(self, action: #selector(switchChange), for: .valueChanged)
            viewHeader.addSubview(swichHide)
            
            let textField = UITextField()
            textField.text = " '' Add your bio ''"
            textField.backgroundColor = #colorLiteral(red: 0.1794609486, green: 0.1785656559, blue: 0.2204750952, alpha: 0.1973458904)
            textField.textColor = .gray
            textField.layer.cornerRadius = 5
            let tap = UITapGestureRecognizer(target: self, action: #selector(gotoScreen))
            textField.addGestureRecognizer(tap)
            textField.frame = CGRect(x: 20, y: 40, width: view.frame.size.width / 1.15, height: 25)
            
            viewHeader.addSubview(textField)
        case 3:
            lblHeader.text = "All contacts"
                       lblHeader.sizeToFit()
                       lblHeader.frame.origin = CGPoint(x: 0, y: 5)
                       viewHeader.addSubview(lblHeader)
                       
                       let btnRefresh = UIButton()
                       btnRefresh.setTitle("REFRESH", for: .normal)
                       btnRefresh.setTitleColor(.systemBlue, for: .normal)
                       btnRefresh.sizeToFit()
                       btnRefresh.frame.origin = CGPoint(x: view.frame.size.width - 90, y: 0)
                       viewHeader.addSubview(btnRefresh)
        case 4:
            viewHeader.backgroundColor = .gray
        default:
            return viewHeader
        }
       
        return viewHeader
    }
    
    @objc func gotoScreen(){
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController_EditYourBio") as! ViewController_EditYourBio
        self.hidesBottomBarWhenPushed = true
        navigationController!.pushViewController(vc, animated: true)
        self.hidesBottomBarWhenPushed = false
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100
        case 2:
            if swichHide.isOn == false{
                return 0.0
            }
            else{
                return 80
            }
        default:
            return 80
        }
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    @objc func switchChange(){
        tableView_Contacts.reloadData()
    }
    
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           var identity = String()
        switch indexPath.section {
        case 0:
            identity = "cellRecommendFriend"
        case 1:
            identity = "cellCloseFriends"
        case 2:
            identity = "cellRecentUpdate"
        case 3:
            identity = "cellAllContact"
        default:
            identity = "cellUpdatePhoneBook"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: identity, for: indexPath)
        if indexPath.section == 0 {
            let btnRecommendedFriends = UIButton()
            btnRecommendedFriends.frame = CGRect(x: 20, y: 0, width: cell.frame.size.width, height: cell.frame.size.height / 3)
            btnRecommendedFriends.setImage(UIImage(named: "AddIcon"), for: .normal)
            btnRecommendedFriends.setTitle("Recommended Friends", for: .normal)
            btnRecommendedFriends.setTitleColor(.black, for: .normal)
            btnRecommendedFriends.contentHorizontalAlignment = .left
            
            let btnPhoneBookFriends = UIButton()
            btnPhoneBookFriends.frame = CGRect(x: 20, y: cell.frame.size.height / 1.75, width: cell.frame.size.width, height: cell.frame.size.height / 3)
            btnPhoneBookFriends.setImage(UIImage(named: "phonebook friend"), for: .normal)
            btnPhoneBookFriends.setTitle("PhoneBook Friends", for: .normal)
            btnPhoneBookFriends.setTitleColor(.black, for: .normal)
            btnPhoneBookFriends.contentHorizontalAlignment = .left
            cell.addSubview(btnRecommendedFriends)
            cell.addSubview(btnPhoneBookFriends)
        }
        if indexPath.section == 1{
            let btnAdd = UIButton()
            btnAdd.frame = CGRect(x: 20, y: cell.frame.size.height / 4, width: cell.frame.size.width, height: cell.frame.size.height / 2)
            btnAdd.setImage(UIImage(named: "AddIcon"), for: .normal)
            btnAdd.setTitle("Add", for: .normal)
            btnAdd.setTitleColor(.black, for: .normal)
            btnAdd.contentHorizontalAlignment = .left
            cell.addSubview(btnAdd)

        }
        if indexPath.section == 2{
            let name = arrayName[indexPath.section][indexPath.row]
            let image = arrayImage[indexPath.section][indexPath.row]
            
            if let imageView = cell.imageView {
                imageView.frame.size = CGSize(width: 32, height: 32)
                imageView.clipsToBounds = true
                imageView.layer.cornerRadius = imageView.frame.size.height / 2
                imageView.image = UIImage(named: image)
            }
            cell.textLabel?.text = name
            if swichHide.isOn == true{
                let btnPhone = UIButton()
                btnPhone.setImage(UIImage(named: "phonebook friend"), for: .normal)
                btnPhone.frame = CGRect(x: cell.frame.size.width - 115, y: cell.frame.size.height / 4, width: 32, height: 32)
                cell.addSubview(btnPhone)
                
                let btnVideoCall = UIButton()
                btnVideoCall.setImage(UIImage(named: "VideoCall"), for: .normal)
                btnVideoCall.frame = CGRect(x: cell.frame.size.width - 75, y: cell.frame.size.height / 4, width: 32, height: 32)
                cell.addSubview(btnVideoCall)
            }
            
            
        }
        if indexPath.section == 3{
            let name = arrayName[indexPath.section][indexPath.row]
            let image = arrayImage[indexPath.section][indexPath.row]
            
            if let imageView = cell.imageView {
                imageView.frame.size = CGSize(width: 32, height: 32)
                imageView.clipsToBounds = true
                imageView.layer.cornerRadius = imageView.frame.size.height / 2
                imageView.image = UIImage(named: image)
            }
            cell.textLabel?.text = name
            let btnPhone = UIButton()
            btnPhone.setImage(UIImage(named: "phonebook friend"), for: .normal)
            btnPhone.frame = CGRect(x: cell.frame.size.width - 115, y: cell.frame.size.height / 4, width: 32, height: 32)
            cell.addSubview(btnPhone)
            let btnVideoCall = UIButton()
            btnVideoCall.setImage(UIImage(named: "VideoCall"), for: .normal)
            btnVideoCall.frame = CGRect(x: cell.frame.size.width - 75, y: cell.frame.size.height / 4, width: 32, height: 32)
            cell.addSubview(btnVideoCall)
        }
        if indexPath.section == 4{
            let lblNote = UILabel()
            lblNote.text = "Quickly add your friends to Zalo from your contact book"
            lblNote.numberOfLines = 0
            lblNote.lineBreakMode = .byWordWrapping
            lblNote.sizeToFit()
            lblNote.frame.origin = CGPoint(x: cell.frame.size.width / 12, y: cell.frame.size.height / 8)
            cell.addSubview(lblNote)
            
            let btnUpdatePhoneBook = UIButton()
            btnUpdatePhoneBook.setTitle("UPDATE PHONEBOOK", for: .normal)
            btnUpdatePhoneBook.frame = CGRect(x: cell.frame.size.width / 4, y: cell.frame.size.height / 2, width: cell.frame.size.width / 2, height: cell.frame.size.height / 3)
            btnUpdatePhoneBook.backgroundColor = .white
            btnUpdatePhoneBook.contentHorizontalAlignment = .center
            btnUpdatePhoneBook.setTitleColor(.black, for: .normal)
            btnUpdatePhoneBook.layer.cornerRadius = 5
            cell.backgroundColor = .gray
            cell.addSubview(btnUpdatePhoneBook)
        }
        return cell
       }
    
    

}
