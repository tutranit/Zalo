//
//  ViewController_Groups.swift
//  AutoLayout-Code
//
//  Created by Apple on 10/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController_Groups: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView_Group: UITableView!
    let searchBar = UISearchBar()
    var arrayGroup : [Groups] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView_Group.delegate = self
        tableView_Group.dataSource = self
        setNavigation()
        arrayGroup = [Groups(imageGroup: "AddIcon", nameGroup: "Gia Đình"),Groups(imageGroup: "phonebook friend", nameGroup: "Xã Hội"),Groups(imageGroup: "VideoCall", nameGroup: "Trường Học")]
    }
    
    func setNavigation(){
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.242096764, green: 0.8549055754, blue: 1, alpha: 1)
        
        searchBar.placeholder = "Search friends, messages"
        searchBar.tintColor = #colorLiteral(red: 0.242096764, green: 0.8549055754, blue: 1, alpha: 1)

        navigationItem.titleView = searchBar
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 2:
            return arrayGroup.count
        default:
            return 1
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var identity = String()
        switch indexPath.section {
        case 0:
            identity = "cellNewGroup"
        case 1:
            identity = "cellTopGroups"
        default:
            identity = "cellJoinedGroups"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: identity, for: indexPath)
        if indexPath.section == 0{
            let btnNewGroup = UIButton()
            btnNewGroup.setImage(UIImage(named: "AddIcon"), for: .normal)
            btnNewGroup.setTitle("Create new group", for: .normal)
            btnNewGroup.sizeToFit()
            btnNewGroup.frame.origin = CGPoint(x: 0, y: cell.frame.size.height / 4)
            btnNewGroup.setTitleColor(.black, for: .normal)
            cell.addSubview(btnNewGroup)
        }
        if indexPath.section == 1{
            
        }
        if indexPath.section == 2{
            let array = arrayGroup[indexPath.row]
            if let imageGroup = cell.imageView {
                imageGroup.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
                imageGroup.layer.cornerRadius = imageGroup.frame.size.height / 2
                imageGroup.image = UIImage(named: array.imageGroup)
            }
            cell.textLabel?.text = array.nameGroup
            
        }
        return cell
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        searchBar.resignFirstResponder()
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = UIView()
        let lblHeader = UILabel()
        switch section {
        case 1:
            lblHeader.text = "Top group features"
            lblHeader.sizeToFit()
            lblHeader.frame.origin = CGPoint(x: 0, y: 0)
            viewHeader.addSubview(lblHeader)
        case 2:
            lblHeader.text = "Joined groups"
            lblHeader.sizeToFit()
            lblHeader.frame.origin = CGPoint(x: 0, y: 0)
            viewHeader.addSubview(lblHeader)
        default:
            return viewHeader
        }
        return viewHeader
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }
        return 20
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let viewFooter = UIView()
        switch section {
        case 2:
            return viewFooter
        default:
            viewFooter.backgroundColor = .gray
        }
        return viewFooter
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    struct Groups {
        var imageGroup : String!
        var nameGroup : String!
    }

}
