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
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
