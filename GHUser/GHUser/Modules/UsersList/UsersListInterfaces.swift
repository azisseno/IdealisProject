//
//  UsersListInterfaces.swift
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

enum UsersListNavigationOption {
    
}

protocol UsersListRouterInterface: class {
    func setView(_ view: UsersListViewController)
    func navigate(to option: UsersListNavigationOption)
}

protocol UsersListViewInterface: class {
    
}

protocol UsersListPresenterInterface: class {
    init(interactor: UsersListInteractorInterface, router: UsersListRouterInterface)
    func setView(_ view: UsersListViewInterface)
}

protocol UsersListInteractorInterface: class {
    init(userServices: UserServicesInterface)
    func fetchUser(completion: @escaping ([PublicUser]) -> Void)
}
