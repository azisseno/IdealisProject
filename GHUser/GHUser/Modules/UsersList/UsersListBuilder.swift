//
//  UsersListBuilder.swift
//  GHUser
//
//  Created by admin on 12/03/20.
//  Copyright © 2020 Azis S Prasetyotomo. All rights reserved.
//
//
//  VIPER Generator by Supamida --  🐍 🐍 🐍 🐍
//

import Foundation
import UIKit
import ApiV1

protocol UsersListBuilderInterface {
    func resolveInteractor(userServices: UserServicesInterface) -> UsersListInteractorInterface
    func resolveRouter() -> UsersListRouterInterface
    func resolvePresenter(interactor: UsersListInteractorInterface,
                          router: UsersListRouterInterface) -> UsersListPresenterInterface
    func resolveView(presenter: UsersListPresenterInterface) -> UsersListViewController
}

extension UsersListBuilderInterface {
    func resolveInteractor(userServices: UserServicesInterface) -> UsersListInteractorInterface {
        return UsersListInteractor(userServices: userServices)
    }
    
    func resolveRouter() -> UsersListRouterInterface {
        return UsersListRouter()
    }
    
    func resolvePresenter(interactor: UsersListInteractorInterface,
                          router: UsersListRouterInterface) -> UsersListPresenterInterface {
        return UsersListPresenter(interactor: interactor, router: router)
    }
        
    func resolveView(presenter: UsersListPresenterInterface) -> UsersListViewController {
        let _storyboard = UIStoryboard(name: "UsersList", bundle: Bundle(for: UsersListBuilder.self))
        guard let view: UsersListViewController = _storyboard.instantiateInitialViewController(
            creator: { coder in
                UsersListViewController(coder: coder, presenter: presenter)
            }) else { fatalError("Initial View Controller is not set up") }
        return view
    }
    
    func main(userServices: UserServicesInterface = UserServices()) -> UIViewController {
        let interactor = resolveInteractor(userServices: userServices)
        let router = resolveRouter()
        let presenter = resolvePresenter(interactor: interactor,
                                         router: router)
        let view: UsersListViewController = resolveView(presenter: presenter)
        presenter.setView(view)
        router.setView(view)
        return view
    }
}

class UsersListBuilder: UsersListBuilderInterface { }
