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
        
        return AvatarView(frame: CGRect(origin: .zero, size: .zero))
    }
    
    var nameLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureWithViewModel(_ contactViewModel: NewContactViewModel) {
        // Implement this, example như dưới
        
        self.avatarView.configureWithContactViewModel(contactViewModel)
    }
    
    override func updateConstraints() {
        // TO DO: - Implement autolayout here
        // phải gọi constraint như sau: https://developer.apple.com/videos/play/wwdc2018/220 slide trang 31
        
        super.updateConstraints()
    }
}
