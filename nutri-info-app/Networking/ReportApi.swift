//
//  UserAPI.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 21/05/23.
//
import Foundation


class ReportApi {
    
    let httpRequest = HttpRequest()
    
    func getReport(name: String,
                   weight: Float,
                   height: Float,
                   selectedGoal: String,
                   queue: DispatchQueue = .main,
                   completionHandler: @escaping (ApiResult<Report>) -> Void) {
        
        let Url = "http://127.0.0.1:8000/nutri-info/\(name)?weight=\(weight)&height=\(height)&goal =\(selectedGoal)"
        
        httpRequest.execute(url: Url, httpMethod: .GET) { (result: HttpResult<Report>) in
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
