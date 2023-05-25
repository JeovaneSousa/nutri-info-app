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
    let colorMode = "darkOrLight"

    @Published var selectedAppMode: AppMode = .LIGHT {
        didSet {
            self.saveSelectedColorSchema()
        }
    }
    
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
