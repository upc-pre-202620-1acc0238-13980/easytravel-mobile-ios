//
//  MainView.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 18/11/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                
            }
            
            Tab("Favorites", systemImage: "heart") {
                
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
