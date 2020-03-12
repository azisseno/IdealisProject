//
//  ApiRequest.swift
//  ApiV1
//
//  Created by admin on 12/03/20.
//  Copyright © 2020 Azis S Prasetyotomo. All rights reserved.
//

import Foundation
import Alamofire

class ApiRequest<P: Encodable, R: Codable> {
    
    var dataRequest: DataRequest?
    var path: String
    var headers: HTTPHeaders
    var method: HTTPMethod
    var params: P?
    var onSuccess: ((R) -> Void)?
    var onFailure: ((ApiError) -> Void)?
    
    init(path: String,
         headers: HTTPHeaders,
         method: HTTPMethod,
         params: P? = nil,
         onSuccess: ((R) -> Void)?,
         onFailure: ((ApiError) -> Void)?) {
        self.path = path
        self.headers = headers
        self.method = method
        self.params = params
        self.onSuccess = onSuccess
        self.onFailure = onFailure
    }
    
    func call() {
        
        let urlRequestString = ApiConstant.basePath + path
        dataRequest = AF.request(urlRequestString,
                                 method: method,
                                 parameters: params,
                                 encoder: JSONParameterEncoder.default,
                                 headers: headers)
        
        dataRequest?.responseDecodable(of: R.self) { [weak self] response in
            switch response.result {
            case .success(let result):
                self?.onSuccess?(result)
            case .failure(let err):
                if err.isInvalidURLError {
                    self?.onFailure?(ApiError.unsupportedURL)
                } else {
                    self?.onFailure?(ApiError.custom(err.localizedDescription))
                }
                
            }
        }
    }
    
    func cancel() {
        dataRequest?.cancel()
    }
}
