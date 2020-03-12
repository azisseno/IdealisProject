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

final class UsersListViewController: UIViewController {

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
    
    // MARK: - View Controller Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupView()
    }
	
    // MARK: - Setup Initial View
    private func _setupView() {
        // Write your initial setup here
    }

}

// MARK: - Extensions -
extension UsersListViewController: UsersListViewInterface {
}
