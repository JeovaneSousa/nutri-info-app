//
//  HomeView.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 22/05/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var defaultsManager: DefaultsManager
    @EnvironmentObject var coordinator: Coordinator
    @ObservedObject var viewModel = HomeViewModel()
    
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        VStack {
            ProfileHeader(user: user)

            Rectangle()
                .foregroundColor(.mainColor)
                .cornerRadius(30)
                .shadow(radius: 10)
 
                .overlay {
                    VStack(spacing: 20) {
                        Text("REPORT FORM")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        FormFields(formType: .weight, value: $viewModel.weight)
                        
                        FormFields(formType: .height, value: $viewModel.height)
                        
                        GoalSelector(value: $viewModel.selectedGoal)
                        
                        Spacer()
                        StyledButton {
                            
                        }
                        .disabled(viewModel.isFieldReady)
                        .opacity(viewModel.isFieldReady ? 0.5 : 1.0)
                    }
                    .padding()
                }
                .padding()
                .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.backgroundColor)
        .preferredColorScheme(defaultsManager.selectedColorScheme())
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(user: User(name: "Ada Carina", profilaUri: "https://avatars.githubusercontent.com/u/100374064?v=4"))
            .environmentObject(DefaultsManager())
    }
}
