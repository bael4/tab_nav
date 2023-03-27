//
//  UserTableViewCell.swift
//  tab_nav
//
//  Created by Баэль Рыспеков on 26/3/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    
    
    private let idLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .systemBlue
        return label
        
    }()
    
    private let companyLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: 18)
        return label
        
    }()
    
    private let nameLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 18)
        return label
        
    }()
    
    private let emailLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 18)
        return label
        
    }()
    
    private let numberLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 18)
        return label
        
    }()
    
    private let mainView:  UIView = {
        
       let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0, green: 0, blue: 0 , alpha: 0.1).cgColor
        
        
       return view
    }()
    
    private let blueView:  UIView = {
        
       let view = UIView()
     
        view.backgroundColor = .blue
       return view
    }()
    
    private let idView:  UIView = {
        
       let view = UIView()
 
        view.backgroundColor = .white
        view.layer.cornerRadius = 13
        
       return view
    }()
    
 
    
    
    
    private let imageDot:  UIImageView = {
        
       let image = UIImageView()
        image.image = UIImage(named: "dots")
        
       return image
    }()
    
    private let imageMessage:  UIImageView = {
        
       let image = UIImageView()
        image.image = UIImage(named: "message")
        
       return image
    }()
    
    private let imageMessage2:  UIImageView = {
        
       let image = UIImageView()
        image.image = UIImage(named: "message")
        
       return image
    }()
    
    private let imageMessage3:  UIImageView = {
        
       let image = UIImageView()
        image.image = UIImage(named: "message")
        
       return image
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: "cell")
        
        self.addSubview(mainView)
        blueView.addSubview(imageDot)
        blueView.addSubview(idView)
        idView.addSubview(idLabel)
        
        [blueView,companyLabel, imageMessage, imageMessage2, imageMessage3, nameLabel,emailLabel,numberLabel].forEach { box in
            mainView.addSubview(box)
    }
        
        mainView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview().inset(0)
            make.height.equalTo(195)
        }
        
        blueView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.leading.trailing.equalToSuperview().inset(0)
              make.width.equalToSuperview().dividedBy(1)
            make.height.equalTo(40)
        }
        
        idView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
            make.height.equalTo(26)
            
        }
        
        
        
        imageDot.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
        }
        
        idLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        companyLabel.snp.makeConstraints { make in
            make.top.equalTo(blueView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
            
        }
        
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(imageMessage)
            make.left.equalTo(imageMessage.snp.right).offset(18)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.centerY.equalTo(imageMessage2)
            make.left.equalTo(imageMessage.snp.right).offset(18)
        }
        
        numberLabel.snp.makeConstraints { make in
            make.centerY.equalTo(imageMessage3)
            make.left.equalTo(imageMessage.snp.right).offset(18)
        }
        
        
        imageMessage.snp.makeConstraints { make in
            make.top.equalTo(companyLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.height.width.equalTo(20)
        }
        
        imageMessage2.snp.makeConstraints { make in
            make.top.equalTo( imageMessage.snp.bottom).offset(10)
            make.leading.equalTo(imageMessage.snp.leading)
            make.height.width.equalTo(20)
        }
        
        imageMessage3.snp.makeConstraints { make in
            make.top.equalTo( imageMessage2.snp.bottom).offset(10)
            make.leading.equalTo(imageMessage.snp.leading)
            make.height.width.equalTo(20)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setData( id:String, company:String, name:String, email:String , number: Int){
        idLabel.text = id
        companyLabel.text = company
        nameLabel.text = name
        emailLabel.text = email
        numberLabel.text = "\(number)"
    }
    
}
