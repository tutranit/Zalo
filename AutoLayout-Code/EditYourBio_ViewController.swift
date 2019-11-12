//
//  ViewController_EditYourBio.swift
//  AutoLayout-Code
//
//  Created by Apple on 10/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController_EditYourBio: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setView()
        setNavigation()
        // Do any additional setup after loading the view.
    }

    func setNavigation(){
        let btnSave = UIBarButtonItem(title: "SAVE", style: .plain, target: self, action: #selector(saveEdit))
        navigationItem.rightBarButtonItem = btnSave
    }
    
    @objc func saveEdit(){
        
    }
    func setView(){
        let textAddYourBio = UITextField()
        textAddYourBio.placeholder = "Add a shor bio"
        textAddYourBio.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 4)
        textAddYourBio.backgroundColor = .white
        view.addSubview(textAddYourBio)
        
        let lblNote = UILabel()
        lblNote.translatesAutoresizingMaskIntoConstraints = false
        lblNote.frame.origin = CGPoint(x: 5, y: view.frame.size.height / 4 + 10)
        lblNote.text = "Impress everyone with your unique bio"
        lblNote.sizeToFit()
        lblNote.textColor = .black
        view.addSubview(lblNote)
        view.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
    }

    

}
