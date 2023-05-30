//
//  NetworkUtils.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 25/05/23.
//

import Foundation

typealias HttpResult<T> = Result<T,NetworkError>
typealias ApiResult<T> = Result<T, ApiError>

extension Result {
    init(data: Success?, error:Failure? ) {
        if let data = data {
            self = Result.success(data)
            return
        }
        if let error = error {
            self = Result.failure(error)
            return
        }
        preconditionFailure("Unable to create Result.")
    }
}

enum HttpMethod: String {
    case GET, POST, PUT, DELETE
}

extension HTTPURLResponse {
    var inSucessRange: Bool {
        statusCode >= 200 && statusCode < 300
    }
}

