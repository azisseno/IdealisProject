//
//  UsersListViewController.swift
//  GHUser
//
//  Created by admin on 12/03/20.
//  Copyright © 2020 Azis S Prasetyotomo. All rights reserved.
//
//
//  VIPER Generator by Supamida --  🐍 🐍 🐍 🐍
//

import UIKit
import ApiV1

final class UsersListViewController: UITableViewController {

    // MARK: - Default properties -
    private var _presenter: UsersListPresenterInterface!
    
    // MARK: - Module Setup -
    /* FOR NOT IOS 13
    func set(presenter: UsersListPresenterInterface) {
        _presenter = presenter
    }
    */
    
    // FOR IOS 13
    init?(coder: NSCoder, presenter: UsersListPresenterInterface) {
        _presenter = presenter
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("(coder: NSCoder) has not been implemented")
    }
    
    var imageCache = NSCache<NSString, UIImage>()
    var users: [PublicUser] = []
    
    // MARK: - View Controller Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupView()
        _presenter.viewDidLoad(since: 0)
    }
	
    // MARK: - Setup Initial View
    private func _setupView() {
        // Write your initial setup here
    }

    // TableView Datasource:
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ImageTextTableViewCell = tableView.cell(indexPath: indexPath)
        cell.setup(image: UIImage(), labelText: "")
        return cell
    }
    
}

// MARK: - Extensions -
extension UsersListViewController: UsersListViewInterface {
    func showError(message: String) {
        print(message)
    }
    
    func showUsers(users: [PublicUser]) {
        self.users = users
        tableView.reloadData()
        
    }
}
