//
//  ContentView.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 18/05/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var defaultsManager: DefaultsManager
    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {

        VStack {
            HStack{
                Spacer(minLength: 200)
                
                Picker("Choose appearence", selection: $defaultsManager.selectedAppMode) {
                    ForEach(AppMode.allCases, id: \.self) {
                        switch $0 {
                        case .LIGHT:
                            Image(systemName: "sun.and.horizon.fill")
                        case .DARK:
                            Image(systemName: "moon.circle")
                        }
                    }
                }
                .pickerStyle(.segmented)
                
                .onAppear {
                    defaultsManager.retrieveDefaultColorSchema()
                }
            }
            HStack {
                VStack(alignment:.leading,
                       spacing:20) {
                    Text("Hello!")
                    Text("Welcome back")
                }
               .font(.largeTitle)
               .fontDesign(.serif)
               .fontWeight(.light)
               .foregroundColor(.primary)
                Spacer()
            }
            Spacer()
            
            VStack(spacing:40){
                LoginInputs(.NAME, $viewModel.name)
                LoginInputs(.PROFILEURI, $viewModel.profileURI)
            }
            
            Toggle("Remeber me",isOn: $viewModel.rememberMe)
                .foregroundColor(.secondary)
                .padding(.leading, 200)
            
            Spacer()

            VStack(spacing:40) {
                StyledButton(withText:"Try it out") {
                    let user = User(name: viewModel.name, profilaUri: viewModel.profileURI)
                    
                    coordinator.push(page: .homeView(user))
                }
                .disabled(viewModel.isDisabled)
                .opacity(viewModel.isDisabled ? 0.5 : 1.0)
            }
        }
        .padding()
        .preferredColorScheme(defaultsManager.selectedColorScheme())
        .background(Color.mainColor)
    }
}


struct HomeViewPreviews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(DefaultsManager())
    }
}

