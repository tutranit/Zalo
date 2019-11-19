

import UIKit
import ContactsUI
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {
    let serialQueue1  = DispatchQueue(label: "GetUrl")
    let serialQueue2  = DispatchQueue(label: "LoadForm")
    var nameContact = [["Tú","Liêm","Cường","Tú","Liêm","Cường","Tú","Liêm","Cường","Tú","Liêm","Cường","Tú","Liêm","Tú","Liêm","Cường","Tú","Liêm","Cường"],
        ["Triệu","Chánh"],[" "]]

    let imageContract = [["AddIcon","messageAdd","AddIcon","messageAdd","AddIcon","messageAdd","AddIcon","messageAdd","AddIcon","messageAdd","AddIcon","messageAdd","AddIcon","messageAdd","AddIcon","AddIcon","messageAdd","AddIcon","messageAdd","AddIcon","messageAdd"],["AddIcon","messageAdd"]]
    
    var searchContact : [[String]] = []
    
    @IBOutlet weak var tableViewMess: UITableView!
    
    let searchBar = UISearchBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.hidesBottomBarWhenPushed = true
        setUpNavigation()
        tableViewMess.delegate = self
        tableViewMess.dataSource = self
        searchBar.delegate = self
        searchContact = nameContact
    }



    func setUpNavigation(){
       
        searchBar.placeholder = "Search friends, messages"
        navigationItem.titleView = searchBar
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.242096764, green: 0.8549055754, blue: 1, alpha: 1)
        let btnAddMess = UIBarButtonItem(image: UIImage(named: "messageAdd"), style: .plain, target: self, action: #selector(addMess))
        
        let btnAddFriend = UIBarButtonItem(image: UIImage(named: "AddIcon"), style: .plain, target: self, action: #selector(addFriend))
        
        navigationItem.rightBarButtonItems = [btnAddFriend,btnAddMess]
    }
    
    @objc func addMess(){
        
    }
    
   
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        searchBar.resignFirstResponder()
    }

    @objc func addFriend(){
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController_AddFriend")
        
        navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return nameContact.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = UIView()
        if section == 1 {
            let lblHeader = UILabel()
            lblHeader.text = "People may you know"
            lblHeader.sizeToFit()
            lblHeader.frame.origin = CGPoint(x: 0, y: 0)
            viewHeader.addSubview(lblHeader)
        }
        return viewHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 0
        case 1:
            return 30
        default:
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let viewFooter = UIView()
        viewFooter.backgroundColor = .gray
        return viewFooter
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 1

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameContact[section].count
       }
       
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            nameContact = searchContact
            tableViewMess.reloadData()
            return
        }
        nameContact[0] = nameContact[0].filter({ $0.contains(searchText)
        })
       
        tableViewMess.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var identifier : String!
        switch indexPath.section {
        case 0:
            identifier = "cellMainMess"
        case 1:
            identifier = "cellAddFriend"
        case 2:
            identifier = "cellSeeMore"
        default:
            identifier = "cellSeeMore"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = nameContact[indexPath.section][indexPath.row]
        if indexPath.section == 0{
            //var arrayImageHost : String = imageContract[0][indexPath.row]
            if let imageHost = cell.imageView {
            imageHost.frame.size = CGSize(width: 32, height: 32)
            imageHost.layer.cornerRadius = imageHost.frame.height / 2
            imageHost.clipsToBounds = true
            var data : Data!
                DispatchQueue.global(qos: .userInteractive).async {
                    let urlString = URL(string: "https://wallpapershome.com/images/pages/pic_hs/10151.jpg")!
                    
                    do{
                       data = try Data(contentsOf: urlString)
                        DispatchQueue.main.async {
                            imageHost.image = UIImage(data: data)//UIImage(data: data)
                            cell.addSubview(imageHost)
                        }
                    }
                    catch{
                                                                                         
                    }
                }
             }
                
            }
        else if indexPath.section == 1 {
            let arrayImageHost = imageContract[1][indexPath.row]
            if let imageHost = cell.imageView {
            imageHost.frame.size = CGSize(width: 32, height: 32)
            imageHost.layer.cornerRadius = imageHost.frame.height / 2
            imageHost.clipsToBounds = true
            imageHost.image = UIImage(named: arrayImageHost)
            cell.addSubview(imageHost)
        }

        }
        else if indexPath.section == 2 {
            let lblNote = UILabel()
            lblNote.text = "Easily find and message your friends"
            lblNote.numberOfLines = 0
            lblNote.textAlignment = .center
            lblNote.sizeToFit()
          
            lblNote.frame.origin = CGPoint(x: cell.frame.size.width / 5.5, y: cell.frame.size.height / 5)
           
            
            cell.addSubview(lblNote)
                     
            let btnFindFriend = UIButton()
            btnFindFriend.setTitle("Find Friend", for: .normal)
            btnFindFriend.layer.cornerRadius = 5
            btnFindFriend.backgroundColor = UIColor.blue
            btnFindFriend.setTitleColor(UIColor.white, for: .normal)
         
            btnFindFriend.frame = CGRect(x: cell.frame.size.width / 4, y: cell.frame.size.height / 2, width: cell.frame.width / 2, height: cell.frame.height / 2)
            cell.addSubview(btnFindFriend)
        }
      
        return cell
       }
    
}

