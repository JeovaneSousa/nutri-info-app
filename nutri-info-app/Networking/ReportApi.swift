//
//  UserAPI.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 21/05/23.
//
import Foundation


class ReportApi {
    
    let httpRequest = HttpRequest()
    
    func createUrl(name: String,
                   weight: Float,
                   height: Float,
                   selectedGoal: String) -> URL? {
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "nutri-info-api.onrender.com"
        components.path = "/nutri-info/\(name)"
        
        let queryWeight = URLQueryItem(name:"weight", value: String(weight))
        let queryHeight = URLQueryItem(name:"height", value: String(height))
        let queryGoal = URLQueryItem(name:"goal", value: selectedGoal)
        
        components.queryItems = [queryWeight, queryHeight, queryGoal]
        
        return components.url
    }
    
    func getReport(name: String,
                   weight: Float,
                   height: Float,
                   selectedGoal: String,
                   queue: DispatchQueue = .main,
                   completionHandler: @escaping (ApiResult<Report>) -> Void) {
        
        let url = createUrl(name: name, weight: weight, height: height, selectedGoal: selectedGoal)
        guard let url = url else {preconditionFailure("Unable to create URL.")}
        
        httpRequest.execute(url: url, httpMethod: .GET) { (result: HttpResult<Report>) in
            switch result {
                
            case .success(let report):
                queue.async {
                    completionHandler(.success(report))
                }
                
            case .failure(let error):
                let context_error = ApiError.requestError(error)
                queue.async {
                    completionHandler(.failure(context_error))
                }
            }
        }
    }

}

enum ApiError: Error, LocalizedError {
    case requestError(NetworkError)
    
    var errorMessage: String {
        switch self {
        case .requestError(let error):
            return "Error happened: \(error.errorMessage)"
        }
    }
}
