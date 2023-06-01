//
//  HomeViewModel.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 21/05/23.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {

    @Published var name: String = ""
    @Published var profileURI: String = ""
    
    
    var isDisabled: Bool {
        guard name.isEmpty || name.count < 3 else { return false }
        return true
    }
}
    

    


