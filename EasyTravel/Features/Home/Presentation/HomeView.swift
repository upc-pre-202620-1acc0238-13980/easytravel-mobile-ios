//
//  HomeView.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 20/11/26.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            ForEach(viewModel.destinations) { destination in
                DestinationCard(destination: destination, isFavorite: viewModel.favoriteIds.contains(destination.id)) {
                    viewModel.toggleFavoriteDestination(id: destination.id)
                }
            }
            .listRowSeparator(.hidden)
        }
        .task {
            await viewModel.loadDestinations()
        }
        .listStyle(.plain)
    }
}


#Preview {
    HomeView(viewModel: AppContainer().makeHomeViewModel())
}
