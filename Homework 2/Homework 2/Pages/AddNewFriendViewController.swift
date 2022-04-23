//
//  ViewController.swift
//  Homework 2
//
//  Created by Lidiya Karnaukhova on 20.04.2022.
//

import UIKit
import SnapKit

class AddNewFriendViewController: UIViewController {
    
    let viewModel = AddNewFriendViewModel()
    var items: [CellConfigurator] = []
    
    
    private lazy var tableDirector: TableDirector = {
        let tableDirector = TableDirector(tableView: tableView, items: items)
        return tableDirector
    }()
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        configureNewContactsTableView()
        loadItems()
        cellActionHandlers()
        tableDirector.tableView.reloadData()
    }
    
    private func configureNavigationBar() {
        let leftNavigationItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),style: .plain,target: self,action:#selector(backToMainVC))
        navigationItem.leftBarButtonItem = leftNavigationItem
        navigationItem.title = NSLocalizedString("Add New Friend", comment: "")
    }
    
    @objc private func backToMainVC() {
        let rootVC = MyFriendsViewController()
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.modalPresentationStyle = .currentContext
        present(navigationVC, animated: true)
    }
    
    private func configureNewContactsTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
                .inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }
    }
    
    private func loadItems() {
        items = viewModel.getItems()
    }
    
    private func cellActionHandlers() {
        self.tableDirector.actionProxy
            .on(action: .didSelect) { (config: MightKnowCellConfigurator, cell) in
            }
            .on(action: .willDisplay) { (config: MightKnowCellConfigurator, cell) in
            }.on(action: .custom(MightKnowTableViewCell.didTapButtonAction)){ (config: MightKnowCellConfigurator, cell) in
                let mightKnowCell = cell as MightKnowTableViewCell
                mightKnowCell.friendToggleImage.image = UIImage(systemName: "checkmark.circle.fill")
                mightKnowCell.friendToggleLabel.text = NSLocalizedString("ADDED", comment: "")
                mightKnowCell.friendToggleLabel.textColor = .lightGray
                mightKnowCell.friendToggleImage.tintColor = .lightGray
                mightKnowCell.friendToggle.layer.borderColor = CGColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.33)
                print("button did tap")
            }
    }

}



//extension AddNewFriendViewController : UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            newContactsSectionCount = items.filter { $0 is NewContactCellConfigurator }.count
//            return newContactsSectionCount
//        }
//        return items.filter { $0 is MightKnowCellConfigurator }.count
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0 {
//            return 44
//        } else {
//            return 72
//        }
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var item: CellConfigurator
//        if indexPath.section == 0 {
//            item = items[indexPath.row]
//        } else {
//            item = items[indexPath.row + newContactsSectionCount]
//        }
//        tableView.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseId)
//        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: indexPath)
//        item.configure(cell: cell)
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let label: UILabel = {
//            let label = UILabel()
//            label.textAlignment = .left
//            label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
//
//            if section == 0 {
//                label.text = NSLocalizedString("Add New Contacts", comment: "")
//            } else {
//                label.text = NSLocalizedString("You Might Know Them", comment: "")
//            }
//            return label
//        }()
//        return label
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return 28
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//}
