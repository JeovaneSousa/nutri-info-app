//
//  User.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 21/05/23.
//

import Foundation

struct User: Hashable {
    let id: Int?
    let username: String
    let password: String
    let profilaUri: URL
    
    init(id: Int?, username: String, password: String, profilaUri: URL) {
        self.id = id
        self.username = username
        self.password = password
        self.profilaUri = profilaUri
    }
}
