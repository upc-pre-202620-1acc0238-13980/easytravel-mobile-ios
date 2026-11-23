//
//  HomeViewModel.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 20/11/26.
//

import Observation

@Observable
class HomeViewModel {
    private let getDestinations: GetDestinationsUseCase
    private let getFavorites: GetFavoritesUseCase
    private let toggleFavorite: ToggleFavoriteUseCase
    
    private(set) var destinations: [Destination] = []
    private(set) var favoriteIds: Set<Int> = []
    
    var favorites: [Destination] {
        return destinations.filter { destination in
            favoriteIds.contains(destination.id)
        }
    }
    
    init(getDestinations: GetDestinationsUseCase, getFavorites: GetFavoritesUseCase, toggleFavorite: ToggleFavoriteUseCase) {
        self.getDestinations = getDestinations
        self.getFavorites = getFavorites
        self.toggleFavorite = toggleFavorite
    }
    
    func loadDestinations() async {
        do {
            self.destinations = try await getDestinations.execute()
            self.favoriteIds = try getFavorites.execute()
        } catch {
            
        }
        
    }
    
    func toggleFavoriteDestination(id: Int)  {
        toggleFavorite.execute(id: id)
        do {
            self.favoriteIds = try getFavorites.execute()
        } catch {
            
        }
    }
}
