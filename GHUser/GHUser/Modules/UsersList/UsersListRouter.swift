//
//  UsersListRouter.swift
//  GHUser
//
//  Created by admin on 12/03/20.
//  Copyright © 2020 Azis S Prasetyotomo. All rights reserved.
//
//
//  VIPER Generator by Supamida --  🐍 🐍 🐍 🐍
//

import UIKit

// This block would be the `Builder`
final class UsersListRouter {

    // MARK: - Default properties -
    private weak var _view: UsersListViewController?

}

// MARK: - Extensions -
// This block would be the `Router`
extension UsersListRouter: UsersListRouterInterface {
    
    func setView(_ view: UsersListViewController) {
        _view = view
    }
    
    func navigate(to option: UsersListNavigationOption) {
    }
}
