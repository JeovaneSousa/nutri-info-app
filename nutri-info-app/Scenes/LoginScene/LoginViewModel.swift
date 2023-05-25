//
//  HomeViewModel.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 21/05/23.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {

    @Published var users: [User] = []
    @Published var name: String = ""
    @Published var profileURI: String = ""
    @Published var rememberMe: Bool = false
    
    var isFieldReady: Bool {
        return name.isEmpty
    }
}
    

    


