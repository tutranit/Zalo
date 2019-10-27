//
//  ViewController_OfficialSelected.swift
//  AutoLayout-Code
//
//  Created by Apple on 10/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController_OfficialSelected: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    

    @IBOutlet weak var tableView_Offcial: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView_Offcial.delegate = self
        tableView_Offcial.dataSource = self
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 80
        default:
            return 300
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var identity = String()
        switch indexPath.section {
        case 0:
            identity = "cellFindMore"
        default:
            identity = "cellFollowed"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: identity, for: indexPath)
        if indexPath.section == 0{
            let btnFindMore = UIButton()
            btnFindMore.setImage(UIImage(named: "AddIcon"), for: .normal)
            btnFindMore.setTitle("Find more Official Accounts", for: .normal)
            btnFindMore.setTitleColor(.black, for: .normal)
            btnFindMore.contentHorizontalAlignment = .left
            btnFindMore.frame = CGRect(x: 20, y: cell.frame.size.height / 4, width: cell.frame.size.width, height: cell.frame.size.height / 2)
            
            cell.addSubview(btnFindMore)
        }
        
        if indexPath.section == 1{
            
            
            let btnBaoMoi = UIButton()
            btnBaoMoi.setImage(UIImage(named: "AddIcon"), for: .normal)
            btnBaoMoi.setTitleColor(.black, for: .normal)
            btnBaoMoi.setTitle("Báo mới", for: .normal)
            btnBaoMoi.contentHorizontalAlignment = .left
            btnBaoMoi.frame = CGRect(x: 20, y: cell.frame.size.height - 280 , width: cell.frame.size.width, height: cell.frame.size.height / 8)
      
            cell.addSubview(btnBaoMoi)
            
            let btnComic = UIButton()
            btnComic.setImage(UIImage(named: "AddIcon"), for: .normal)
            btnComic.setTitleColor(.black, for: .normal)
            btnComic.setTitle("Comic", for: .normal)
            btnComic.contentHorizontalAlignment = .left
            btnComic.frame = CGRect(x: 20, y: cell.frame.size.height - 240, width: cell.frame.size.width, height: cell.frame.size.height / 8)
            cell.addSubview(btnComic)
            
            let btnGameCenter = UIButton()
            btnGameCenter.setImage(UIImage(named: "AddIcon"), for: .normal)
            btnGameCenter.setTitleColor(.black, for: .normal)
            btnGameCenter.setTitle("Game Center", for: .normal)
            btnGameCenter.contentHorizontalAlignment = .left
            btnGameCenter.frame = CGRect(x: 20, y: cell.frame.size.height - 200, width: cell.frame.size.width, height: cell.frame.size.height / 8)
            cell.addSubview(btnGameCenter)

            let btnThoiTiet = UIButton()
            btnThoiTiet.setImage(UIImage(named: "AddIcon"), for: .normal)
            btnThoiTiet.setTitleColor(.black, for: .normal)
            btnThoiTiet.setTitle("Thời tiết", for: .normal)
            btnThoiTiet.contentHorizontalAlignment = .left
            btnThoiTiet.frame = CGRect(x: 20, y: cell.frame.size.height - 160, width: cell.frame.size.width, height: cell.frame.size.height / 8)
            cell.addSubview(btnThoiTiet)

            let btnTienLienMienNam = UIButton()
            btnTienLienMienNam.setImage(UIImage(named: "AddIcon"), for: .normal)
            btnTienLienMienNam.setTitleColor(.black, for: .normal)
            btnTienLienMienNam.setTitle("Tiến lên miền nam", for: .normal)
            btnTienLienMienNam.contentHorizontalAlignment = .left
            btnTienLienMienNam.frame = CGRect(x: 20, y: cell.frame.size.height - 120, width: cell.frame.size.width, height: cell.frame.size.height / 8)
            cell.addSubview(btnTienLienMienNam)

            let btnZaloPay = UIButton()
            btnZaloPay.setImage(UIImage(named: "AddIcon"), for: .normal)
            btnZaloPay.setTitleColor(.black, for: .normal)
            btnZaloPay.setTitle("ZaloPay", for: .normal)
            btnZaloPay.contentHorizontalAlignment = .left
            btnZaloPay.frame = CGRect(x: 20, y: cell.frame.size.height - 80, width: cell.frame.size.width, height: cell.frame.size.height / 8)
            cell.addSubview(btnZaloPay)
        }
        return cell
    }

    
}
