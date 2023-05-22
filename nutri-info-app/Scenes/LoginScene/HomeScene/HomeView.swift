//
//  HomeView.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 22/05/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @ObservedObject var viewModel = HomeViewModel()
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        
        VStack(alignment: .center) {
            ProfileHeader(user: user)
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(user: User(id: 2, username: "ada", fullname: "Ada Carina", password: "54321", profilaUri: URL(string: "https://avatars.githubusercontent.com/u/100374064?v=4")!))
    }
}
