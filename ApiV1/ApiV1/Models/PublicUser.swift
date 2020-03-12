//
//  PublicUser.swift
//  ApiV1
//
//  Created by admin on 12/03/20.
//  Copyright © 2020 Azis S Prasetyotomo. All rights reserved.
//

import Foundation

public struct PublicUser: Codable {
    public var login: String
    public var id: Int
    public var nodeId: String
    public var avatarUrl: String
}
