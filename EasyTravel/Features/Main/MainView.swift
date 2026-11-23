//
//  MainView.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 18/11/26.
//

import SwiftUI

struct MainView: View {
    @State var viewModel = AppContainer().makeHomeViewModel()
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView(viewModel: viewModel)
            }
            
            Tab("Favorites", systemImage: "heart") {
                FavoritesView(viewModel: viewModel)
            }
            
            Tab("Profile", systemImage: "person") {
                
            }
        }
        .navigationBarBackButtonHidden()
        .tint(.orange)

    }
}

#Preview {
    MainView()
}
