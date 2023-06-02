//
//  defaults.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 23/05/23.
//

import SwiftUI

extension UserDefaults {
    enum Keys: String {
        case colorModeKey, rememberKey, userKey
    }
    
    static var colorMode: String {
        get {
            return UserDefaults.standard.string(forKey: Keys.colorModeKey.rawValue) ?? ""
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.colorModeKey.rawValue)
        }
    }
    
    static var rememberMe: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.rememberKey.rawValue)
        }
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: Keys.rememberKey.rawValue)
        }
    }
    
    static var user: User? {
        get {
            if let data = UserDefaults.standard.object(forKey: Keys.userKey.rawValue) {
                do {
                    let user = try JSONDecoder().decode(User.self, from: data as! Data)
                    return user
                } catch let error {
                    print("Unable to decode user: \(error.localizedDescription)")
                }
            }
            return nil
        }
        
        set {
            do {
                let data = try JSONEncoder().encode(newValue)
                UserDefaults.standard.set(data, forKey: Keys.userKey.rawValue)
            } catch let error {
                print("Unable to encode user: \(error.localizedDescription)")
            }
        }
    }
}
    





