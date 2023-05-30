//
//  HttpRequest.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 25/05/23.
//

import Foundation

class HttpRequest {
    let urlSession = URLSession.shared
    var dataTask: URLSessionDataTask?
    

    func execute<T: Codable>(url: String,
                             httpMethod: HttpMethod,
                             decoder: JSONDecoder = .init(),
                             encoder: JSONEncoder = .init(),
                             completionHandler: @escaping (HttpResult<T>) -> Void) {
        
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        dataTask?.cancel()
        dataTask =  urlSession.dataTask(with: request) { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }
            let result: HttpResult = Result(data: data, error: error)
                .mapError { error in
                return NetworkError.unableToPerformRequest(error)}
            
                .flatMap { data in
                return Result { try  decoder.decode(T.self, from: data)}}
                
                .flatMapError { error in
                if let error = error as? NetworkError {
                    return Result.failure(error)
                }
                
                if let response = response as? HTTPURLResponse,
                   !response.inSucessRange {
                    return Result.failure(NetworkError.requestFailed(response.statusCode))
                }
                return Result.failure(NetworkError.invalidData(error))
            }
            completionHandler(result)
        }
        dataTask?.resume()
    }
}

enum NetworkError: Error, LocalizedError {
    case unableToPerformRequest(Error)
    case requestFailed(Int)
    case invalidData(Error)
    
    var errorMessage: String {
        switch self {
        case .unableToPerformRequest(let error):
            return "Unable to perform request for the following reason: \(error.localizedDescription)"
        case .requestFailed(let statusCode):
            return "Status code: \(statusCode)"
        case .invalidData(let error):
            return "Unable to parse data. \(error.localizedDescription)"
        }
    }
}


