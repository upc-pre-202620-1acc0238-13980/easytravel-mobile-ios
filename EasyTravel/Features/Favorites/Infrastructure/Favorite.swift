//
//  Favorite.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 23/11/26.
//

import SwiftData

@Model
class Favorite {
    
    @Attribute(.unique)
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
}
