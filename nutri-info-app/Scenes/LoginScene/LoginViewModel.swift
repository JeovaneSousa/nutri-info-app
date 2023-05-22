//
//  HomeViewModel.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 21/05/23.
//

import Foundation
import SwiftUI

enum AppMode: String, CaseIterable {
    case LIGHT,DARK
}

class LoginViewModel: ObservableObject {
    
    @Published var selectedAppMode: AppMode = .LIGHT
    @Published var users: [User] = []
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var showAlert: AlertModel? = nil
    @Published var rememberMe: Bool = false
    
    let api = UserApi()
    
    init() {
        self.fetchData()
    }
    func fetchData() {
        let fetchedUsers = api.fetchUserData()
        users.append(contentsOf: fetchedUsers)
    }
    
    
    //MARK: Implements input validation.
    func checkInputs() -> Bool {
        guard !username.isEmpty else{
            showAlert = AlertModel(message: "Please, fill in a username.", title:"Error")
            return false
        }
        guard !password.isEmpty else {
            showAlert = AlertModel(message: "Please, fill in a password.", title:"Error")
            return false
        }
        showAlert = nil
        return true
    }
    
    private func checkPassword(forUser username: String,
                       withPassword password: String) -> (Bool, String, String) {
        let user = users.filter {$0.username == username}.first
        guard let user = user  else {
            return (false, "No user found with that username, please try again.", "Error")
        }
        
        guard user.password == password else {
            return (false,"Wrong password, please try again.", "Error")
        }
        
        return (true, "Logged In!", "Great!")
    }
    
    
    func logIn() -> Bool  {
        switch checkPassword(forUser: username, withPassword: password) {
        case (false, let message, let title):
            showAlert = AlertModel(message: message, title: title)
            return false
            
        case (true, let message, let title):
            showAlert = AlertModel(message: message, title: title)
            return true
        }
    }
    
    func  getUser() -> User? {
        return users.filter {$0.username == username}.first
    }
    
    struct AlertModel: Identifiable {
        let id = UUID()
        let message: String
        let title: String
        
    }
    
    //MARK: Implements UserDefault for color mode and login
    var defaults = UserDefaults.standard
    var colorMode = "darkOrLight"
    
    
    func selectedColorScheme() ->  ColorScheme {
        return selectedAppMode == .LIGHT ? .light : .dark
    }

    func saveSelectedColorSchema() {
        defaults.set(selectedAppMode.rawValue, forKey: colorMode)
    }
    
    func retrieveDefaultColorSchema() {
        guard let savedMode = defaults.string(forKey: colorMode),
              let mode = AppMode(rawValue: savedMode) else {return}
        selectedAppMode = mode
    }
    
}

