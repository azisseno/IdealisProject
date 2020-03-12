//
//  UserServices.swift
//  ApiV1
//
//  Created by admin on 12/03/20.
//  Copyright © 2020 Azis S Prasetyotomo. All rights reserved.
//

import Foundation
import Alamofire

public protocol UserServicesInterface {
    
    func fetchUsers(params: UserRequestParam,
                    cancel: ((@escaping () -> Void) -> Void)?,
                    onSuccess: (([PublicUser]) -> Void)?,
                    onFailure: ((ApiError) -> Void)?)
}

public class UserServices: UserServicesInterface {
    
    
    public init() { }
    
    public func fetchUsers(params: UserRequestParam,
                           cancel: ((@escaping () -> Void) -> Void)?,
                           onSuccess: (([PublicUser]) -> Void)?,
                           onFailure: ((ApiError) -> Void)?) {
        let path: String = "users"
        let headers = HTTPHeadersBuilder().defaultValue
        
        let req = ApiRequest(path: path,
                             headers: headers,
                             method: .get,
                             params: params,
                             onSuccess: onSuccess,
                             onFailure: onFailure)
        req.call()
        cancel? {
            req.cancel()
        }
        
    }
}

public class MockUserServices: UserServicesInterface {

    public var mockState: MockResult
    
    let mockResult: [PublicUser] = [
        PublicUser(login: "siza",
                   id: 1,
                   nodeId: "adfa",
                   avatarUrl: "https://avatars0.githubusercontent.com/u/1343?v=4"),
        PublicUser(login: "supamida",
                   id: 2,
                   nodeId: "asdfasrw3",
                   avatarUrl: "https://avatars3.githubusercontent.com/u/1367?v=4")
    ]
    
    let mockError: ApiError = ApiError.custom("Error Custom")

    public init(mockState: MockResult = .success) {
        self.mockState = mockState
    }

    public func fetchUsers(params: UserRequestParam,
                           cancel: ((@escaping () -> Void) -> Void)?,
                           onSuccess: (([PublicUser]) -> Void)?,
                           onFailure: ((ApiError) -> Void)?) {
        switch mockState {
        case .success:
            onSuccess?(mockResult)
        case .failure:
            onFailure?(mockError)
        }
    }
}
