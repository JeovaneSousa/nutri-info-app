//
//  User.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 21/05/23.
//

import Foundation

struct User: Hashable {
    let name: String
    let profilaUri: String?
    
    init(name: String, profilaUri: String?) {
        self.name = name
        self.profilaUri = profilaUri
    }
}
