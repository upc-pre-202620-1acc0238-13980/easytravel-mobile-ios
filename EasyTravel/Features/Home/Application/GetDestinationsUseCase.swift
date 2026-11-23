//
//  GetDestinationsUseCase.swift
//  EasyTravel
//
//  Created by Jorge Mayta on 20/11/26.
//

class GetDestinationsUseCase {
    private let repository: any DestinationRepository
    
    init(repository: any DestinationRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [Destination] {
        return try await repository.getDestinatiosn()
    }
}
