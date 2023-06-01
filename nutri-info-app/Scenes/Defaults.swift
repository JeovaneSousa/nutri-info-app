//
//  defaults.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 23/05/23.
//

import SwiftUI

enum AppMode: String, CaseIterable {
    case LIGHT,DARK
}

//MARK: Implements UserDefault for color mode and login
class DefaultsManager: ObservableObject {
    
    var defaults = UserDefaults.standard
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    let colorModeKey = "darkOrLight"
    let rememberKey = "remember"
    let userKey = "user"

    @Published var selectedAppMode: AppMode = .LIGHT {
        didSet {
            self.saveSelectedColorSchema()
        }
    }
    
    @Published var rememberMe: Bool = false {
        didSet {
            self.saveSelectedRembemerStatus()
        }
    }
    
    
    func selectedColorScheme() ->  ColorScheme {
        return selectedAppMode == .LIGHT ? .light : .dark
    }

    func saveSelectedColorSchema() {
        defaults.set(selectedAppMode.rawValue, forKey: colorModeKey)
    }
    
    func retrieveDefaultColorSchema() {
        guard let savedMode = defaults.string(forKey: colorModeKey),
              let mode = AppMode(rawValue: savedMode) else {return}
        selectedAppMode = mode
    }
}

//MARK: Implements remember functionality

extension DefaultsManager {
    func saveSelectedRembemerStatus() {
        defaults.setValue(rememberMe, forKey: rememberKey)
    }
    
    func retrieveRememberStatus() {
        self.rememberMe = defaults.bool(forKey: rememberKey)
    }
    
    func saveUser(user: User) {
        let encodedUser = try? encoder.encode(user)
        defaults.set(encodedUser, forKey: userKey)
    }
    
    func retrieveUser() -> User {
        var data = defaults.object(forKey: userKey)
        let user = try? decoder.decode(User.self, from: data as! Data)
        return user!
    }
}



