//
//  GetFavoritesUseCase.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 23/11/26.
//

class GetFavoritesUseCase {
    private let repository: any FavoriteRepository
    
    init(repository: any FavoriteRepository) {
        self.repository = repository
    }
    
    func execute() throws -> Set<Int> {
        try repository.getFavorites()
    }
}
