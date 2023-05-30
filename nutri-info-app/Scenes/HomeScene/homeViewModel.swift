//
//  homeViewModel.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 22/05/23.
//

import SwiftUI


class HomeViewModel: ObservableObject {
    @Published var weight: Float?
    @Published var height: Float?
    @Published var selectedGoal: Goals = .MAINTENANCE
    @Published var errorOcurred: Bool = false

    let api = ReportApi()

    var error: ApiError? = nil
    

    var isFieldDisabled: Bool {
        if let weight = weight,
           let height = height,
           weight <= 200 && weight > 0,
           height <= 2.5 && height > 0 {
            return false
        } else {
            return true
        }
    }
    
    func getReport(forUser user: User, completion: @escaping (Result<Report,ApiError>) -> Void) {
        errorOcurred = false
        error = nil
        
        api.getReport(name: user.name, weight: weight!, height: height!, selectedGoal: selectedGoal.rawValue) {[weak self] (result: ApiResult<Report>) in
            guard let self = self else { return }
            switch result {
                
            case .success(let report):
                debugPrint(report as Any)
                completion(.success(report))
                
            case .failure(let error):
                debugPrint(error.errorMessage)
                self.error = error
                completion(.failure(error))
            }
        }

    }
}
