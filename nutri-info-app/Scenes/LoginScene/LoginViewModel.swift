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
    
    var buttonIsDisabled: Bool {
        guard name.isEmpty || name.count < 3 else { return false }
        return true
    }
    
    //MARK: Implements UserDefault for color mode
    @Published var selectedAppMode: AppMode = .LIGHT {
        willSet {
            UserDefaults.colorMode = newValue.rawValue
        }
    }
    
    func retrieveDefaultColorSchema() {
        guard let mode = AppMode(rawValue: UserDefaults.colorMode) else {return}
        selectedAppMode = mode
    }
    
    enum AppMode: String, CaseIterable {
        case LIGHT,DARK
        
        var colorScheme: ColorScheme {
            switch self {
            case .DARK:
                return .dark
            case .LIGHT:
                return .light
            }
        }
    }
    
    //MARK: Implements UserDefault for remember user function
    @Published var rememberMe: Bool = false {
        willSet {
            UserDefaults.rememberMe = newValue
        }
    }
    
    var hasUserAndRememberIsActive: Bool {
        if UserDefaults.rememberMe,
        let _ = UserDefaults.user {
            return true
        }
        return false
    }
    
    func retrieveDefaultRememberMeState() {
        rememberMe = UserDefaults.rememberMe
    }
    
    
    
}

