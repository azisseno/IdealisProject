//
//  UsersListInteractor.swift
//  GHUser
//
//  Created by admin on 12/03/20.
//  Copyright © 2020 Azis S Prasetyotomo. All rights reserved.
//
//
//  VIPER Generator by Supamida --  🐍 🐍 🐍 🐍
//

import Foundation
import ApiV1

final class UsersListInteractor {
    
    var userServices: UserServicesInterface
    
    init(userServices: UserServicesInterface) {
        self.userServices = userServices
    }
}

// MARK: - Extensions -
extension UsersListInteractor: UsersListInteractorInterface {
    func fetchUser(since: Int, onSuccess: @escaping ([PublicUser]) -> Void, onFailure: @escaping (ApiError) -> Void) {
        userServices.fetchUsers(params: UserRequestParam(since),
                                cancel: nil,
                                onSuccess: onSuccess,
                                onFailure: onFailure)

    }
}
