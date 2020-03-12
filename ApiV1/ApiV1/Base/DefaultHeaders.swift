//
//  DefaultHeaders.swift
//  ApiV1
//
//  Created by admin on 12/03/20.
//  Copyright © 2020 Azis S Prasetyotomo. All rights reserved.
//

import Foundation
import Alamofire

class HTTPHeadersBuilder {
    private var headers: HTTPHeaders
    init(_ additionalParams: [String: String]? = nil) {
        var baseParams: [String: String] = [:]
        // for example
        // ios version
        // UDID
        // whatever you need
        if let additionalParams = additionalParams {
            for i in additionalParams {
                baseParams[i.key] = i.value
            }
        }
        
        headers = HTTPHeaders(baseParams)
    }
    
    var defaultValue: HTTPHeaders {
        return headers
    }
}

