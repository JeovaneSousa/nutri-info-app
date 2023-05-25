//
//  ProfileHeader.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 22/05/23.
//

import SwiftUI

struct ProfileHeader: View {
    let user: User
    
    var url: URL? {
        if let uri = user.profilaUri,
           let url = URL(string: uri) {
            return url
        }
        return nil
    }
    var body: some View {
        
        VStack(spacing:30) {
            AsyncImage(url: url) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "photo.circle.fill")
                    .resizable()
            }
            .clipShape(Circle())
            .frame(width: 120, height: 120)
            .shadow(color: .black.opacity(0.6), radius: 10,  y: 10)
            .background {
                Circle()
                    .clipShape(Circle().stroke(lineWidth: 6))
                    .foregroundColor(.white)
                    .frame(width: 125, height: 125)
            }
        
            Text(user.name)
                .font(.title)
                .fontWeight(.light)
                .foregroundColor(.primary)
        }
        .padding(.top, 20)
        .background {
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.7)
                Color.gradientColor
                .ignoresSafeArea()
        }
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeader(user: User(name: "Ada Carina", profilaUri: "https://avatars.githubusercontent.com/u/100374064?v=4"))
    }
}
