//
//  DestinationRepositoryImpl.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 20/11/26.
//

class DestinationRepositoryImpl: DestinationRepository {
    
    private let api: DestinationApi
    
    init(api: DestinationApi) {
        self.api = api
    }
    
    func getDestinatiosn() async throws -> [Destination] {
        let dtos = try await api.getDestinations()
        
        return dtos.map { dto in
            dto.toDomain()
        }
    }
    
    
}
