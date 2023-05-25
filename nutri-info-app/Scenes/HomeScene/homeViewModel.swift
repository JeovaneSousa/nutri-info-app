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
    
    var isFieldReady: Bool {
        guard !weight.isZero,
              weight < 300,
              !height.isZero,
              height < 3 else { return true }
        return false
    }
}
