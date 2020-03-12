//
//  APIError.swift
//  ApiV1
//
//  Created by admin on 12/03/20.
//  Copyright © 2020 Azis S Prasetyotomo. All rights reserved.
//

import Foundation

public enum ApiError: Error {
    case unknwonError
    case unsupportedURL
    case unsupportedQuery
    case noData
    case requirementJsonKeysNotFound
    case custom(String)
}

extension ApiError: LocalizedError {
    
    /// return the userInfo of ParserError
    public var errorDescription: String? {
        switch self {
        case .unknwonError:
            return "Seems like there's an error occurs, unknown"
        case .unsupportedURL:
            return "URL is unsupported, please check your URL"
        case .unsupportedQuery:
            return "URL Query is unsupported"
        case .noData:
            return "Data from the Api is null"
        case .requirementJsonKeysNotFound:
            return "Requirement JSON Key is not found"
        case .custom(let message):
            return message
        }
    }
}
