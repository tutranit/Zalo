//
//  ViewController_Contacts.swift
//  AutoLayout-Code
//
//  Created by Apple on 10/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit


class ViewController_Contacts: UIViewController {

    let segment : UISegmentedControl = {
        let sg = UISegmentedControl(items: ["CONTACTS","OFFICIAL ACCOUNTS"])
        sg.addTarget(self, action: #selector(segmentChange), for: .valueChanged)
        return sg
    }()
    public let searchBar = UISearchBar()
    let tableView = UITableView(frame: .zero, style: .plain)
    let containerView = UIView()
    @objc func segmentChange(){
        searchBar.resignFirstResponder()
        if segment.selectedSegmentIndex == 0{
            remove(asChildViewController: viewOfficial)
            addViewController(asChildViewController: viewContacts)
        }
        else{
            remove(asChildViewController: viewContacts)
            addViewController(asChildViewController: viewOfficial)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraint()
        segment.selectedSegmentIndex = 0
        segmentChange()
        setNavigation()
    }
    
    func setNavigation(){
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.242096764, green: 0.8549055754, blue: 1, alpha: 1)
        searchBar.placeholder = "Search friends, messages"
        searchBar.tintColor = #colorLiteral(red: 0.242096764, green: 0.8549055754, blue: 1, alpha: 1)

        navigationItem.titleView = searchBar
    }
    
   func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        searchBar.resignFirstResponder()
    }
    
   lazy var viewContacts : ViewController_ContactsSelected = {
          let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
          let viewContacts = storyBoard.instantiateViewController(withIdentifier: "ViewController_ContactsSelected") as! ViewController_ContactsSelected
        self.addViewController(asChildViewController: viewContacts)
          return viewContacts
      }()

      lazy var viewOfficial : ViewController_OfficialSelected = {
          let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
          let viewOfficial = storyBoard.instantiateViewController(withIdentifier: "ViewController_OfficialSelected") as! ViewController_OfficialSelected
          self.addViewController(asChildViewController: viewOfficial)
          return viewOfficial
      }()

    private func addViewController(asChildViewController viewController: UIViewController) {
           addChild(viewController)


           containerView.addSubview(viewController.view)

           viewController.view.frame = containerView.bounds
           viewController.view.autoresizingMask = [.flexibleWidth,.flexibleHeight]

           viewController.didMove(toParent: self)
       }

    private func remove(asChildViewController viewController: UIViewController) {

        viewController.willMove(toParent: viewController)


        viewController.view.removeFromSuperview()


        viewController.removeFromParent()
    }
    func setConstraint(){
        view.addSubview(segment)
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        segment.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        segment.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        segment.frame.size.width = view.frame.size.width
        segment.frame.size.height = view.frame.size.height / 10
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: segment.bottomAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    
    

}
