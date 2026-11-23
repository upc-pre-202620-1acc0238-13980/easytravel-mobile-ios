//
//  PersistenceController.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 23/11/26.
//

import SwiftData

class PersistenceController {
    let container: ModelContainer
    
    static let shared = PersistenceController()
    
    private init() {
        do {
            self.container = try ModelContainer(for: Favorite.self, configurations: ModelConfiguration())
        } catch {
            fatalError("Failed to create container")
        }
        
    }
    
}
