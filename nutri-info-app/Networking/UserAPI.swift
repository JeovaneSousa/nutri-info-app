//
//  UserAPI.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 21/05/23.
//
import Foundation

class UserApi {
    func fetchUserData() -> [User] {
        return [
            User(id: 1, username: "jeovane", password: "12345", profilaUri: URL(string: "https://avatars.githubusercontent.com/u/66012358?v=4")!),
            User(id: 2, username: "ada", password: "54321", profilaUri: URL(string: "https://avatars.githubusercontent.com/u/100374064?v=4")!)
        ]
        
    }
}
