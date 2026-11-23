//
//  FavoriteDao.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 23/11/26.
//

import SwiftData
import Foundation

class FavoriteDao {
    let context = PersistenceController.shared.container.mainContext
    
    func getFavorites() throws -> [Favorite]  {
        let descriptor = FetchDescriptor<Favorite>()
        return try context.fetch(descriptor)
    }
    
    func addFavorite(id: Int) throws {
        let favorite = Favorite(id: id)
        context.insert(favorite)
        try context.save()
    }
    
    func removeFavorite(id: Int) throws {
        let predicate = #Predicate<Favorite> { favorite in
            favorite.id == id
        }
        
        let descriptor = FetchDescriptor<Favorite>(predicate: predicate)
        
        let favorites = try context.fetch(descriptor)
        
        if let favorite = favorites.first {
            context.delete(favorite)
            try context.save()
        }
        
    }
}
