//
//  ViewController.swift
//  Homework 2
//
//  Created by Lidiya Karnaukhova on 18.04.2022.
//

import UIKit

class MyFriendsViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        configureNavigationBar()
        configureCollectionCell()
    }
    
    private func configureNavigationBar() {
        let rightNavigationItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: .none, action: .none)
        let leftNavigationItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(addNewFriends))
        navigationItem.rightBarButtonItem = rightNavigationItem
        navigationItem.leftBarButtonItem = leftNavigationItem
        navigationItem.title = "My Friends"
    }
    
    @objc private func addNewFriends() {
        
    }
    
    private func configureCollectionCell() {
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
                .inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }
        collectionView.backgroundColor = .systemGray6
        collectionView.register(FriendsCollectionViewCell.self, forCellWithReuseIdentifier: FriendsCollectionViewCell.identifier)
    }
}

extension MyFriendsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendsCollectionViewCell.identifier, for: indexPath) as? FriendsCollectionViewCell else {
                return UICollectionViewCell()
        }
        cell.profileName.text = "Savannah Tucker"
        cell.profileImage.image = UIImage(named: "Tucker")
        cell.profileJob.text = "Retail Supervisor"
        cell.profileStatus.backgroundColor = UIColor(named: "Online")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let myWidth : CGFloat = (collectionView.bounds.width - 8) / 2 - 1
        return CGSize(width: myWidth, height: 192)
    }
}













class MyFeedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
    }
}

class MyPinsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
    }
}

class MyProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
    }
}

