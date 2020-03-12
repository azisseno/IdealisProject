//
//  PresenterInterface.swift
//  CommonViper
//
//  Created by admin on 10/03/20.
//  Copyright © 2020 Azis S Prasetyotomo. All rights reserved.
//

import Foundation

public protocol PresenterInterface: class {
    func set(view: ViewInterface)
    init(interactor: InteractorInterface, router: RouterInterface)
}
