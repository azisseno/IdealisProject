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
    func showUsers(users: [PublicUser])
    func showError(message: String)
}

protocol UsersListPresenterInterface: class {
    init(interactor: UsersListInteractorInterface, router: UsersListRouterInterface)
    func setView(_ view: UsersListViewInterface)
    func viewDidLoad(since: Int)
}

protocol UsersListInteractorInterface: class {
    init(userServices: UserServicesInterface)
    func fetchUser(since: Int,
                   onSuccess: @escaping ([PublicUser]) -> Void,
                   onFailure: @escaping (ApiError) -> Void)
}
