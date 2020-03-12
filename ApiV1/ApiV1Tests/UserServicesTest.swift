//
//  UserServicesTest.swift
//  ApiV1Tests
//
//  Created by admin on 12/03/20.
//  Copyright © 2020 Azis S Prasetyotomo. All rights reserved.
//

import Foundation

import XCTest
@testable import ApiV1

class UserServicesTest: XCTestCase {
    
    var userServices: UserServicesInterface!
    
    override func setUp() {
        userServices = MockUserServices()
    }
    
    func testFetchUsersSuccess() {
        
        let expecation = expectation(description: "fetch user success")
        userServices.fetchUsers(params: UserRequestParam(since: 123),
                                cancel: nil,
                                onSuccess: { _ in
                                    expecation.fulfill()
                                },
                                onFailure: { _ in
                                    XCTFail("On Failure must not be called")
                                })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
