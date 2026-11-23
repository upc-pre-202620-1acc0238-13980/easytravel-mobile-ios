//
//  FavoriteRepositoryImpl.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 23/11/26.
//

class FavoriteRepositoryImpl: FavoriteRepository {
    let dao: FavoriteDao
    
    init(dao: FavoriteDao) {
        self.dao = dao
    }
    
    func getFavorites() throws -> Set<Int> {
        let favorites = try dao.getFavorites()
        
        let ids = favorites.map { favorite in
            favorite.id
        }
        
        return Set(ids)
    }
    
    func addFavorite(id: Int) throws {
        try dao.addFavorite(id: id)
    }
    
    func remoteFavorite(id: Int) throws {
        try dao.removeFavorite(id: id)
    }
    
    
}
