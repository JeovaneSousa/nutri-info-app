//
//  HttpRequest.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 25/05/23.
//

import Foundation

enum HttpMethod: String {
    case GET, POST, PUT, DELETE
}

class HttpRequest {
    let urlSession = URLSession.shared
    var dataTask: URLSessionDataTask?
    

    func execute<T: Codable>(url: String,
                             httpMethod: HttpMethod,
                             decoder: JSONDecoder = .init(),
                             encoder: JSONEncoder = .init(),
                             completionHandler: @escaping (Result<T,NetworkError>) -> Void) {
        
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        
        request.httpMethod = httpMethod.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        dataTask = urlSession.dataTask(with: request) { data, response, error in
            
        }
        
    }
}

enum NetworkError: Error, LocalizedError {
    case requestFailed(Error)
    
    var errorMessage: String {
        switch self {
        case .requestFailed(let error):
            return "Request failed because of the following error \(error.localizedDescription)"
        }
    }
}

extension Result {
    init(data: Success?, error:Failure? ) {
        if let data = data {
            self = Result.success(data)
        }
        if let error = error {
            self = Result.failure(error)
        }
        
        preconditionFailure("Unable to create Result.")
    }
}
