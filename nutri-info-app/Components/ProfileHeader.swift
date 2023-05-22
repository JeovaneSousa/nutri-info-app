//
//  ProfileHeader.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 22/05/23.
//

import SwiftUI

struct ProfileHeader: View {
    let user: User
    
    var body: some View {
        
        VStack {
            Image(systemName: "photo.circle")
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .overlay {
                    Circle()
                        .clipShape(Circle().stroke(lineWidth: 4))
                        .foregroundColor(.white)
                }
            .background {
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.5)
                    .foregroundColor(.cyan)
                    .ignoresSafeArea()
            }.frame(width:150, height: 150)
            
            Text(user.fullName)
                .font(.title)
                .fontWeight(.light)
                .foregroundColor(.secondary)
        }
        .padding(.top, 20)
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(user: User(id: 2, username: "ada", fullname: "Ada Carina", password: "54321", profilaUri: URL(string: "https://avatars.githubusercontent.com/u/100374064?v=4")!))
    }
}
