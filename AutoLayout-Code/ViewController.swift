

import UIKit
import ContactsUI
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {
    var nameContact = [["Tú","Liêm","Cường","Chánh","Quý","Triệu","Ảnh","Hùng","Tuấn","Sơn","Bằng","Huy","Lập","Tân","Nghĩa","Trâm  ","Uyên","Thảo","Tài","Đức"],
        ["Triệu","Chánh"],[" "]]

    let imageContract = [["AddIcon","messageAdd","AddIcon","messageAdd","AddIcon","messageAdd","AddIcon","messageAdd","AddIcon","messageAdd","AddIcon","messageAdd","AddIcon","messageAdd","AddIcon","AddIcon","messageAdd","AddIcon","messageAdd","AddIcon","messageAdd"],["AddIcon","messageAdd"]]
    
    var searchContact : [[String]] = []
    
    
    @IBOutlet weak var tableViewMess: UITableView!
    
    let searchBar = UISearchBar()
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let btnAddMess = UIButton()
        btnAddMess.setImage(UIImage(named: "messageAdd"), for: .normal)
        btnAddMess.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        btnAddMess.addTarget(self, action: #selector(addMess), for: .touchUpInside)
        let rightBarButton = UIBarButtonItem(customView: btnAddMess)
        let btnAddFriend = UIButton()
        btnAddFriend.setImage(UIImage(named: "AddIcon"), for: .normal)
        btnAddFriend.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        btnAddFriend.addTarget(self, action: #selector(addFriend), for: . touchUpInside)
        let rightBarButton1 = UIBarButtonItem(customView: btnAddFriend)
        
        navigationItem.rightBarButtonItems = [rightBarButton1,rightBarButton]
        
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
        nameContact[0] = searchContact[0].filter({ $0.contains(searchText)
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
                            imageHost.image = UIImage(data: data)
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
            let btnAddFriend = UIButton()
            let btnDelete = UIButton()
            btnAddFriend.setTitle("Add", for: .normal)
            btnAddFriend.setTitleColor(.white, for: .normal)
            btnAddFriend.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            btnAddFriend.sizeToFit()
            btnAddFriend.frame = CGRect(x: cell.frame.size.width -  cell.frame.size.width / 3, y: cell.frame.size.height / 3, width: cell.frame.size.width / 5, height: cell.frame.size.height / 3)
            btnAddFriend.layer.cornerRadius = 5
            cell.addSubview(btnAddFriend)
            
            btnDelete.setImage(UIImage(named: "Xicon"), for: .normal)
            btnDelete.backgroundColor = .white
            btnDelete.sizeToFit()
            btnDelete.frame = CGRect(x: cell.frame.size.width -  cell.frame.size.width / 10, y: cell.frame.size.height / 3, width: cell.frame.size.width / 20, height: cell.frame.size.height / 3)
            btnDelete.layer.cornerRadius = 5
            cell.addSubview(btnDelete)
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
            btnFindFriend.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            btnFindFriend.setTitleColor(UIColor.white, for: .normal)
            btnFindFriend.frame = CGRect(x: cell.frame.size.width / 4, y: cell.frame.size.height / 2, width: cell.frame.width / 2, height: cell.frame.height / 2)
            btnFindFriend.layer.cornerRadius = btnFindFriend.frame.height / 2
            cell.addSubview(btnFindFriend)
        }
      
        return cell
       }
    
}



