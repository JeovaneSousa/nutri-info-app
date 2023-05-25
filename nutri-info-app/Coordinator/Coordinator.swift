//
//  Coordinator.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 22/05/23.
//
import SwiftUI

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .loginView:
            LoginView()
        case .homeView(let user):
            HomeView(user: user)
        }
    }
}
