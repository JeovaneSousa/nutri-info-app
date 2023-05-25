//
//  homeViewModel.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 22/05/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var weight: Float = 0
    @Published var height: Float = 0
    @Published var selectedGoal: Goals = .MAINTENANCE
    @Published var errorOcurred: Bool = false
    
    
    var user: User? = nil
    var report: Report? = nil
    
    let api = ReportApi()
    
    var isFieldReady: Bool {
        guard !weight.isZero,
              weight < 300,
              !height.isZero,
              height < 3 else { return true }
        return false
    }
    
    func getReport() {
        guard let user = user else { return }
        api.getReport(name: user.name, weight: weight, height: height, selectedGoal: selectedGoal.rawValue) {[weak self] (result: ApiResult<Report>) in
            guard let self = self else { return }
            switch result {
                
            case .success(let report):
                self.report = report
                
            case .failure(let error):
                debugPrint(error)
                self.errorOcurred = true
            }
        }
    }
}
