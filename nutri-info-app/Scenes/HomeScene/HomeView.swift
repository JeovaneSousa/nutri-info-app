//
//  HomeView.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 22/05/23.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel = HomeViewModel()
    

    var body: some View {
        VStack {
            ProfileHeader(user: User(name: "Ada Carina", profilaUri: "https://avatars.githubusercontent.com/u/100374064?v=4"))
            
            VStack(spacing: 40) {
                Text("REPORT FORM")
                    .font(.headline)
                    .fontWeight(.bold)
                
                FormFields(formType: .weight, value: $viewModel.weight)
                
                FormFields(formType: .height, value: $viewModel.height)
                
                GoalSelector(value: $viewModel.selectedGoal)
                
                Spacer()
                Button(action: {
                    // Action for "Hi" button
                    print("Hi button clicked")
                }) {
                    Text("Hi")
                        .foregroundColor(.primary)
                        .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
                        .background(Color.actionColor)
                        .cornerRadius(12)
                }
                
                VStack{
                    StyledButton(withText: "Check results!", isEnabled: false) {
                        print("Button Clicked")
                    }
                }
//                .opacity(viewModel.isFieldReady ? 0.5 : 1.0)
            }
            .padding()
            .background{
                Rectangle()
                    .foregroundColor(.mainColor)
                    .cornerRadius(30)
                    .shadow(radius: 10)
            }
            .padding()
        }
        .background(Color.backgroundColor)
        .navigationBarBackButtonHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(DefaultsManager())
    }
}

//user: User(name: "Ada Carina", profilaUri: "https://avatars.githubusercontent.com/u/100374064?v=4")
