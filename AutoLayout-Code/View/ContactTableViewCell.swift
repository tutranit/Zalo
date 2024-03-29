//
//  ContactTableViewCell.swift
//  AutoLayout-Code
//
//  Created by ManTran on 10/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

protocol ButtonSelect {
    func didTap(mflag : Bool,button : UIButton)
}

class ContactTableViewCell: UITableViewCell {
    // translatesAutoresizingMaskIntoConstraints = false dùng nếu muốn dùng auto layout thì phải set cái này về false
    // bài này dùng tạm autolayout cho nhanh, cách tính frame sẽ học sau
    // Dùng
    
    var mflag : Bool = false
    let btnCheck = UIButton(type: .custom)
    lazy var checkboxButton : UIButton = {
        
        self.addSubview(btnCheck)
        btnCheck.translatesAutoresizingMaskIntoConstraints = false
        btnCheck.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        btnCheck.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        btnCheck.setImage(UIImage(named: "circle"), for: .normal)
        btnCheck.frame.size = CGSize(width: 70, height: 70)
        //btnCheck.setImage(UIImage(named: "Correct"), for: .selected)
        btnCheck.addTarget(self, action: #selector(changeImageButton), for: .touchUpInside)
       
        return btnCheck
    }()
    @objc func changeImageButton(){
        if mflag == false{
            btnCheck.setImage(.none, for: .normal)
            btnCheck.setImage(UIImage(named: "Correct"), for: .normal)
            mflag = true
        }
        else{
            btnCheck.setImage(.none, for: .normal)
            btnCheck.setImage(UIImage(named: "circle"), for: .normal)
            mflag = false
        }
    }
    
    var checkboxImageView: UIImageView {
        let imageView = UIImageView()
        // TO DO: - Configure here
        self.addSubview(imageView)
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        //imageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
//        imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/15).isActive = true
//        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = imageView.frame.height / 2
//        imageView.contentMode = .scaleToFill
//        imageView.backgroundColor = .black
       
        return imageView
        
    }
    
    var avatarImageView: UIImageView {
        let imageView = UIImageView()
        // TO DO: - Configure here, cái này làm sau! đây là cái nâng cao hơn, dùng cache vs avatarStore
        imageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .blue
        
        return imageView
    }
    
    lazy var avatarView: AvatarView = {
        // TO DO: - Tạo cái này trước:
        //translatesAutoresizingMaskIntoConstraints = false
        
        return AvatarView(frame: CGRect(origin: CGPoint(x: self.checkboxButton.frame.origin.x + 50, y: 5), size: CGSize(width: 30, height: 30)))
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        label.leadingAnchor.constraint(equalTo: self.checkboxButton.leadingAnchor, constant: 100).isActive = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addSubview(avatarView)
  
        
    }
    
    func configureWithViewModel(_ contactViewModel: NewContactViewModel) {
        // Implement this, example như dưới
        
        self.avatarView.configureWithContactViewModel(contactViewModel)
    }

    override func updateConstraints() {
        // TO DO: - Implement autolayout here
        // phải gọi constraint như sau: https://developer.apple.com/videos/play/wwdc2018/220 slide trang 31

//        self.addSubview(checkboxButton)
//        self.addSubview(avatarView)
//        self.addSubview(nameLabel)
        //let view = ["checkbox":checkboxButton/*,"avatarView":avatarView*/,"nameLabel":nameLabel]
        //for key in view.keys{
//        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[checkbox][nameLabel(==checkbox)]", options: [], metrics: nil, views: view))
//        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[checkbox]", options: [], metrics: nil, views: view))
//        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel]", options: [], metrics: nil, views: view))
//            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[\(key)]", options: [], metrics: nil, views: view))

        //}
        
        super.updateConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
   
}
