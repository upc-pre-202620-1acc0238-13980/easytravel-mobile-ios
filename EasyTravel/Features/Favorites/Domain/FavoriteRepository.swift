//
//  FavoriteRepository.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 23/11/26.
//

protocol FavoriteRepository {
    
    func getFavorites() throws -> Set<Int>
    func addFavorite(id: Int) throws
    func remoteFavorite(id: Int) throws
}
