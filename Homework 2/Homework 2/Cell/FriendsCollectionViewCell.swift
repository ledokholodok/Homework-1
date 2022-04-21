//
//  FriendsCollectionViewController.swift
//  Homework 2
//
//  Created by Lidiya Karnaukhova on 19.04.2022.
//

import UIKit
import SnapKit

class FriendsCollectionViewCell: UICollectionViewCell {
    static let identifier = "FriendsCollectionCell"
    
    let friendImage: UIImageView = {
        let friendImage = UIImageView()
        return friendImage
    }()
    
    let friendName: UILabel = {
        let friendName = UILabel()
        friendName.textAlignment = .center
        friendName.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return friendName
    }()
    
    let friendJob: UILabel = {
        let friendJob = UILabel()
        friendJob.textAlignment = .center
        friendJob.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        friendJob.textColor = .lightGray
        return friendJob
    }()
    
    let friendStatus: UIView = {
        let friendStatus = UIView()
        return friendStatus
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [friendStatus, friendName])
        stackView.axis = .horizontal
        stackView.spacing = 4
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        friendImage.layer.cornerRadius = friendImage.bounds.width / 2
        friendImage.clipsToBounds = true
        friendStatus.layer.cornerRadius = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func layoutUI() {
        self.backgroundColor = .quaternarySystemFill
        self.layer.cornerRadius = 12
        self.addSubview(friendImage)
        self.addSubview(stackView)
        self.addSubview(friendJob)
    
        friendImage.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.top.equalToSuperview().offset(16)
            $0.centerX.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(friendImage.snp.bottom).offset(19)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(friendName).inset(1)
        }
        
        friendStatus.snp.makeConstraints {
            $0.size.equalTo(10)
        }
        
        friendJob.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(19)
            $0.centerX.equalToSuperview()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
