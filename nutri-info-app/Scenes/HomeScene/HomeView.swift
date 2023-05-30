//
//  HomeView.swift
//  nutri-info-app
//
//  Created by Jeovane Barbosa on 22/05/23.
//

import SwiftUI

enum FocusFields {
    case height, weight
}

struct HomeView: View {


    @EnvironmentObject var coordinator: Coordinator
    @StateObject var viewModel = HomeViewModel()
    @FocusState var focus: FocusFields?
    
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        VStack {
            ProfileHeader(user: User(name: "Ada Carina", profilaUri: "https://avatars.githubusercontent.com/u/100374064?v=4"))
            
            VStack {
                Text("REPORT FORM")
                    .font(.headline)
                    .fontWeight(.bold)
                
                VStack(spacing: 40) {
                    FormFields(formType: .weight, value: $viewModel.weight)
                        .focused($focus, equals: .weight)
                    
                    FormFields(formType: .height, value: $viewModel.height)
                        .focused($focus, equals: .height)
                    
                    GoalSelector(value: $viewModel.selectedGoal)
                }
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        Button("Done") {
                            switch focus {
                            case .weight: focus = .height
                            case .height: focus = nil
                            case .none: focus = nil
                            }
                        }
                    }
                }
                Spacer()
            
                VStack {
                    StyledButton(withText: "Check results!") {
                        viewModel.getReport(forUser: user) { result in
                            switch result {
                            case .success(let report):
                                coordinator.push(page: .reportView(report))
                                
                            case .failure(_):
                                viewModel.errorOcurred = true
                            }
                        }
                    }
                    .disabled(viewModel.isFieldDisabled)
                    .opacity(viewModel.isFieldDisabled ? 0.5 : 1.0)
                }
                .alert("Error", isPresented: $viewModel.errorOcurred) {
                    Button("Ok", role: .cancel) {}
                } message: {
                    Text(viewModel.error?.errorMessage ?? "It was at this moment, he knew, he..")
                }
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
        .background(Color.subColor)
        .navigationBarBackButtonHidden(true)

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(user: User(name: "Ada Carina", profilaUri: "https://avatars.githubusercontent.com/u/100374064?v=4"))
            .environmentObject(DefaultsManager())
    }
}

