//
//  ContentView.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 18/05/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @ObservedObject var viewModel = LoginViewModel()
    

    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    Spacer(minLength: 200)
                    
                    Picker("Choose appearence", selection: $viewModel.selectedAppMode) {
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
                    
                    .onChange(of: viewModel.selectedAppMode) { _ in
                        viewModel.saveSelectedColorSchema()
                    }
                    
                    .onAppear {
                        viewModel.retrieveDefaultColorSchema()
                    }
                }
                VStack(alignment:.leading,
                       spacing:20) {
                    Text("Hello.")
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                    
                    Text("Welcome back.")
                        .font(.title)
                        .foregroundColor(.primary)
                }
               .padding(.trailing, 160)
                
                Spacer()
                
                VStack(spacing:40){
                    LoginInputs(.USERNAME, $viewModel.username)
                    LoginInputs(.PASSWORD, $viewModel.password)
                }
                
                Toggle("Remeber me",isOn: $viewModel.rememberMe)
                    .foregroundColor(.secondary)
                    .padding(.leading, 200)
                
                Spacer()
                
                VStack(spacing:40) {
                    Button("Login") {
                        guard viewModel.checkInputs() else {return}
                        guard viewModel.logIn(),
                              let user = viewModel.getUser() else {return}
                        coordinator.push(page: .homeView(user))
                    }
                    .foregroundColor(.white)
                    .background {
                        Rectangle()
                            .foregroundColor(.cyan)
                            .padding(-8)
                            .cornerRadius(8)
                            .frame(width: UIScreen.main.bounds.width / 1.5, height: 50, alignment: .center)
                    }
                    .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 4)
                    
                    Button("Create Account") {
                        
                    }
                    .foregroundColor(.secondary)
                }
            }
            .padding()
            .preferredColorScheme(viewModel.selectedColorScheme())
        }
        .alert(item: $viewModel.showAlert) { alert in
            Alert(title: Text(alert.title),
                  message: Text(alert.message),
                  dismissButton: .cancel(Text("Ok")))
        }
        
    }

}


struct HomeViewPreviews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

