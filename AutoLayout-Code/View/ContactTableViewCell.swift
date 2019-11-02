//
//  ContactTableViewCell.swift
//  AutoLayout-Code
//
//  Created by ManTran on 10/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    // translatesAutoresizingMaskIntoConstraints = false dùng nếu muốn dùng auto layout thì phải set cái này về false
    // bài này dùng tạm autolayout cho nhanh, cách tính frame sẽ học sau
    // Dùng

    var checkboxButton : UIButton = {
        let btnCheck = UIButton(type: .custom)
        btnCheck.translatesAutoresizingMaskIntoConstraints = false

        btnCheck.setImage(UIImage(named: "AddIcon"), for: [])
        btnCheck.setImage(UIImage(named: "Correct"), for: .selected)
        return btnCheck
    }()
    
    var checkboxImageView: UIImageView {
        let imageView = UIImageView()
        // TO DO: - Configure here
//        self.addSubview(imageView)
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 1/2).isActive = true
//        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        imageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
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
        
        return imageView
    }
    
    var avatarView: AvatarView {        
        // TO DO: - Tạo cái này trước:

        translatesAutoresizingMaskIntoConstraints = false
        return AvatarView(frame: CGRect(origin: CGPoint(x: self.checkboxImageView.frame.origin.x + 50, y: 10), size: CGSize(width: 50, height: 50)))
    }
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
 
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addSubview(checkboxButton)
        self.addSubview(nameLabel)
        
        updateConstraints()
        
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
        let view = ["checkbox":checkboxButton/*,"avatarView":avatarView*/,"nameLabel":nameLabel]
        for key in view.keys{
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[\(key)]", options: [], metrics: nil, views: view))
        }
        
        super.updateConstraints()
    }
    
   
}
