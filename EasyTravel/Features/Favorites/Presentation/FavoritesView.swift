//
//  FavoritesView.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 23/11/26.
//

import SwiftUI

struct FavoritesView: View {
    @State private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            ForEach(viewModel.favorites) { destination in
                DestinationCard(destination: destination, isFavorite: viewModel.favoriteIds.contains(destination.id)) {
                    viewModel.toggleFavoriteDestination(id: destination.id)
                }
                .swipeActions {
                    Button(role: .destructive) {
                        viewModel.toggleFavoriteDestination(id: destination.id)
                    } label: {
                        Label("Remove", systemImage: "trash")
                    }
                }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}
