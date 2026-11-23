//
//  ToggleFavoriteUseCase.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 23/11/26.
//

class ToggleFavoriteUseCase {
    
    private let repository: any FavoriteRepository
    
    init(repository: any FavoriteRepository) {
        self.repository = repository
    }
    
    func execute(id: Int) {
        if let ids = try? repository.getFavorites() {
            if ids.contains(id) {
               try? repository.remoteFavorite(id: id)
            } else {
               try? repository.addFavorite(id: id)
            }
        }
    }
}
