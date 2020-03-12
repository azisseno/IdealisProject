//
//
//  UsersListPresenter.swift
//  GHUser
//
//  Created by admin on 12/03/20.
//  Copyright © 2020 Azis S Prasetyotomo. All rights reserved.
//
//
//  VIPER Generator by Supamida --  🐍 🐍 🐍 🐍
//

import UIKit

final class UsersListPresenter {

    // MARK: - Default properties -
    private weak var _view: UsersListViewInterface?
    private var _interactor: UsersListInteractorInterface
    private var _router: UsersListRouterInterface
        
    // MARK: - Module Setup -
    init(interactor: UsersListInteractorInterface, router: UsersListRouterInterface) {
        _interactor = interactor
        _router = router
    }

}

// MARK: - Extensions -
extension UsersListPresenter: UsersListPresenterInterface {
    func viewDidLoad(since: Int) {
        _interactor.fetchUser(
            since: since,
            onSuccess: { [weak self] users in
                self?._view?.showUsers(users: users)
            },
            onFailure: { [weak self] err in
                self?._view?.showError(message: err.localizedDescription)
            }
        )
    }

    func setView(_ view: UsersListViewInterface) {
        _view = view
    }
    
}
