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

    var checkboxImageView: UIImageView {
        let imageView = UIImageView()
        // TO DO: - Configure here
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 1/2).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
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
        self.avatarView.translatesAutoresizingMaskIntoConstraints = false
        self.avatarView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        self.avatarView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10).isActive = true

        return AvatarView(frame: CGRect(origin: .zero, size: .zero))
    }
    
    var nameLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        //label.trailingAnchor.constraint(equalTo: avatarView.leadingAnchor, constant: 10).isActive = true
        label.sizeToFit()
        label.frame = CGRect(x: self.frame.width - 50, y: self.frame.height / 2, width: 50, height: 50)
        return label
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configureWithViewModel(_ contactViewModel: NewContactViewModel) {
        // Implement this, example như dưới
        
        self.avatarView.configureWithContactViewModel(contactViewModel)
    }
    
    override func updateConstraints() {
        // TO DO: - Implement autolayout here
        // phải gọi constraint như sau: https://developer.apple.com/videos/play/wwdc2018/220 slide trang 31
        var constraint = [NSLayoutConstraint]()
//        constraint += NSLayoutConstraint.constraints(withVisualFormat: <#T##String#>, options: <#T##NSLayoutConstraint.FormatOptions#>, metrics: <#T##[String : Any]?#>, views: <#T##[String : Any]#>)
        super.updateConstraints()
    }
}
